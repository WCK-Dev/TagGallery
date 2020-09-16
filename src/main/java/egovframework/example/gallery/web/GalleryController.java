package egovframework.example.gallery.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;

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
		
		/** pageing setting */
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(gvo.getPageIndex());
		paginationInfo.setRecordCountPerPage(gvo.getPageUnit());
		paginationInfo.setPageSize(gvo.getPageSize());

		gvo.setFirstIndex(paginationInfo.getFirstRecordIndex());
		gvo.setLastIndex(paginationInfo.getLastRecordIndex());
		gvo.setRecordCountPerPage(paginationInfo.getRecordCountPerPage());

		model.addAttribute("galleryList", galleryService.selectGalleryList(gvo));
		model.addAttribute("gallery", gvo);

		int totCnt = galleryService.selectGalleryListTotCnt(gvo);
		paginationInfo.setTotalRecordCount(totCnt);
		model.addAttribute("paginationInfo", paginationInfo);
		
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
	public String updateGallery(MultipartHttpServletRequest mtfRequest, GalleryVO gvo, String delFileList,  ModelMap model) throws IllegalArgumentException, IOException {
		
		//수정전 원글 정보 저장
		GalleryVO beforeGvo = galleryService.selectGallery(gvo);
		//갤러리 글 수정
		galleryService.updateGallery(gvo);
		
		
		//태그수정
		String beforeTags = beforeGvo.getG_tag();
		String newTags = gvo.getG_tag();
		
		TagVO tvo = new TagVO();
		tvo.setG_seq(gvo.getG_seq());
		
		for(String tag : newTags.split(",")) {
			//새로운 태그를 split하여 기존 태그에 존재하지않으면 새로운 태그로 추가
			if(!beforeTags.contains(tag)) {
				tvo.setT_name(tag);
				galleryService.insertTag(tvo);
			}	
		}
		
		for(String oldTag : beforeTags.split(",")) {
			//기존 태그를 split하여 새로운 태그에 존재하지 않으면, 해당 태그 DB데이터를 삭제
			if(!newTags.contains(oldTag)) {
				tvo.setT_name(oldTag);
				galleryService.deleteTag(tvo);
			}
		}
		
		//파일 DB수정
		//사용자가 제거한 첨부파일 DB에서 삭제
		String[] delFiles = delFileList.split(",");
		
		FilesVO fvo = new FilesVO();
		String deleteFileName = null;
		
		for(String delFileSeq :delFiles) {
			int f_seq = Integer.parseInt(delFileSeq);
			fvo.setF_seq(f_seq);
			
			fvo = galleryService.selectFile(fvo);
			deleteFileName = fvo.getF_uploadname();
			//File deleteFile = new File(uploadPath + ); 
		
			galleryService.deleteFile(fvo);
		}
		
		//사용자가 새롭게 추가한 첨부파일 DB에 추가( + 파일업로드)
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		File dir = new File(uploadPath + "/" + sdf.format(beforeGvo.getG_regdate()));

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
				
				eachFile.setF_originname(originalFileName);
				eachFile.setF_uploadname(serverFileName);
				eachFile.setF_fsize(fileSize);
				eachFile.setG_seq(gvo.getG_seq());
				
				galleryService.insertFile(eachFile);
			}
		}

		return "redirect:/readGallery.do?g_seq=" + gvo.getG_seq();
	}
	
	
	@RequestMapping(value="downloadFile.do", method=RequestMethod.GET)
	public void fileDownload (FilesVO fvo, String datePath, HttpServletRequest request, HttpServletResponse response) {
		//다운로드 요청된 파일의 정보를 DB로부터 획득
		fvo = galleryService.selectFile(fvo);
		
		String fileOriginName = fvo.getF_originname();
		String fileFullPath = uploadPath + datePath + "/" + fvo.getF_uploadname();
		String userBrowser = request.getHeader("User-Agent");
		String downName = null;
		
		File downloadFile = new File(fileFullPath);
		
		FileInputStream fileInputStream = null;
        ServletOutputStream servletOutputStream = null;
        
        try {
        	//다운로드 시 원본 파일명을 그대로 유지할 수 있게 원본 파일명을 인코딩하여 브라우저에 맞게 세팅함
           if(userBrowser.contains("MSIE") || userBrowser.contains("Trident") || userBrowser.contains("Chrome")){
        	   downName = URLEncoder.encode(fileOriginName,"UTF-8").replaceAll("\\+", "%20");
           }else {
               downName = new String(fileOriginName.getBytes("UTF-8"), "ISO-8859-1");
           }

           response.setHeader("Content-Disposition","attachment;filename=\"" + downName +"\"");
           response.setContentType("application/octer-stream");
           response.setHeader("Content-Transfer-Encoding", "binary;");

           fileInputStream = new FileInputStream(downloadFile);

           servletOutputStream = response.getOutputStream();

           byte b [] = new byte[1024];
           int data = 0;

           // 바이트를 더이상 읽을 수 없으면 -1 return
           while((data=(fileInputStream.read(b, 0, b.length))) != -1) {
                servletOutputStream.write(b, 0, data);
           }

           servletOutputStream.flush(); // 출력
           // 다운로드 횟수 증가

       } catch (UnsupportedEncodingException e) {
           e.printStackTrace();
       } catch (IOException e) {
           e.printStackTrace();
       } finally {

		   if(servletOutputStream != null){
			   try{
				   servletOutputStream.close();
	           }catch (IOException e){
	               e.printStackTrace();
               }
	       }
		   if(fileInputStream != null){
		       try{
		           fileInputStream.close();
	           }catch (IOException e){
	               e.printStackTrace();
               }
	       }
	   }
		
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
