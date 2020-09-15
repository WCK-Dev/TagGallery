package egovframework.example.gallery.web;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.gallery.service.FilesVO;
import egovframework.example.gallery.service.GalleryService;
import egovframework.example.gallery.service.GalleryVO;
import egovframework.example.gallery.service.TagVO;
import egovframework.example.gallery.service.UserVO;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class GalleryController {
	
	/** EgovSampleService */
	@Resource(name = "galleryService")
	private GalleryService galleryService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	/** FileUpload Path */
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value="login.do", method=RequestMethod.GET)
	public String login() {
		
		return "gallery/login";
	}
	
	@RequestMapping(value="login.do", method=RequestMethod.POST)
	public String login(UserVO userVO, HttpServletRequest request, RedirectAttributes ra) {
		
		UserVO user = new UserVO();
		user = galleryService.login(userVO);
		
		if(user == null) {
			ra.addFlashAttribute("loginErrMsg", "true");
			return "redirect:/login.do";
		} else {
			 request.getSession().setAttribute("user", galleryService.login(userVO));
			return "redirect:/galleryMain.do";
		}
	}
	
	
	@RequestMapping(value="galleryMain.do")
	public String galleryMain(ModelMap model, GalleryVO gvo) {
		
		model.addAttribute("galleryList", galleryService.selectGalleryList(gvo));
		
		return "gallery/galleryMain";
	}
	
	@RequestMapping(value="writeGallery.do", method=RequestMethod.GET)
	public String writeGallery() {
		
		return "gallery/writeGallery";
	}
	
	@RequestMapping(value="writeGallery.do", method=RequestMethod.POST)
	public String writeGallery(MultipartHttpServletRequest mtfRequest, GalleryVO gvo) throws IllegalArgumentException, IOException {
		
		//갤러리 글 등록
		int g_seq = galleryService.selectMaxGseq();
		System.out.println(g_seq);
		gvo.setG_seq(g_seq);
		galleryService.insertGallery(gvo);
		
		//파일 등록 & 태그 등록
		Date today = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
        File dir = new File(uploadPath + "/" + sdf.format(today));
        
        //파일 원본 이미지와 섬네일이 업로드될 디렉토리를 생성
        if (!dir.isDirectory()) dir.mkdirs();

        //선택된 파일의 숫자를 List로 받아 반복하면서, 업로드 진행
		List<MultipartFile> fileList = mtfRequest.getFiles("files");
		
		if(!(fileList.size() == 1 && fileList.get(0).getOriginalFilename().equals(""))) {
			
			for (int i=0; i<fileList.size(); i++) {
				
				String originalFileName = fileList.get(i).getOriginalFilename();
				
				String extension = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				
				String serverFileName = UUID.randomUUID().toString() + "." + extension;
				
				long fileSize = fileList.get(i).getSize();
				
				File images = new File(dir, serverFileName);
				
				fileList.get(i).transferTo(images);
				
				//섬네일작업
				/*if(i==0) {
					if (images.exists()) {
						
					}
				}*/
				
				FilesVO eachFile = new FilesVO();
				
				if(i == 0) eachFile.setF_thumbname(serverFileName); // 섬네일은 첫 반복(하나의 사진파일에만 입력)
				eachFile.setF_originname(originalFileName);
				eachFile.setF_uploadname(serverFileName);
				eachFile.setF_fsize(fileSize);
				eachFile.setG_seq(g_seq);
				
				galleryService.insertFile(eachFile);
			}
		}
		
		//태그내용 DB에 추가
		String[] tags = gvo.getG_tag().split(",");
		
		TagVO tag = new TagVO();
		tag.setG_seq(g_seq);
		
		for(String eachTag : tags) {
			tag.setT_name(eachTag);
			
			galleryService.insertTag(tag);
		}

		return "redirect:/galleryMain.do";
	}
	
	@RequestMapping(value="readGallery.do")
	public String readGallery(GalleryVO gvo, ModelMap model) {
		
		model.addAttribute("gallery", galleryService.selectGallery(gvo));
		model.addAttribute("fileList", galleryService.selectFileList(gvo));
		
		return "gallery/readGallery";
	}
	
	@RequestMapping(value="updateGallery.do", method=RequestMethod.GET)
	public String updateGallery(GalleryVO gvo, ModelMap model) {
		
		model.addAttribute("gallery", galleryService.selectGallery(gvo));
		model.addAttribute("fileList", galleryService.selectFileList(gvo));
		
		return "gallery/updateGallery";
	}
	
	@RequestMapping(value="updateGallery.do", method=RequestMethod.POST)
	public String updateGallery(MultipartHttpServletRequest mtfRequest, GalleryVO gvo, ModelMap model){
		
		return "";
	}
	
	@RequestMapping(value="deleteGallery.do", method=RequestMethod.POST)
	@ResponseBody
	public String deleteGallery(GalleryVO gvo, String regPath, HttpSession session) {
		
		String u_id = ((UserVO)session.getAttribute("user")).getU_id();
		gvo.setG_writer(u_id);
		
		
		return galleryService.deleteGallery(gvo) + "";
		
		/*
		//삭제해야할 파일 리스트 확인
		List<FilesVO> delFiles = galleryService.selectFileList(gvo);
		
		// 갤러리 글 삭제이후, 파일 삭제처리
		if(result == 1) { 
		}*/
	}
	
}
