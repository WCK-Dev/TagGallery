package egovframework.example.gallery.web;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.gallery.service.GalleryService;
import egovframework.example.gallery.service.GalleryVO;
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
			return "galleryMain.do";
		}
	}
	
	
	@RequestMapping(value="galleryMain.do")
	public String galleryMain() {
		
		return "gallery/galleryMain";
	}
	
	@RequestMapping(value="writeGallery.do", method=RequestMethod.GET)
	public String writeGallery() {
		
		return "gallery/writeGallery";
	}
	
	@RequestMapping(value="writeGallery.do", method=RequestMethod.POST)
	public String writeGallery(MultipartHttpServletRequest mtfRequest, GalleryVO gvo) {
		
		Date today = new Date(System.currentTimeMillis());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		List<MultipartFile> fileList = mtfRequest.getFiles("files");
		
		System.out.println(fileList);
		System.out.println(uploadPath);
		
		for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈

            System.out.println(mf);
            System.out.println("originFileName : " + originFileName);
            System.out.println("fileSize : " + fileSize);

            String safeFile = uploadPath + sdf.format(today) + "/" + originFileName;
            try {
                mf.transferTo(new File(safeFile));
            } catch (IllegalStateException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

		return "redirect:/galleryMain.do";
	}
	
}
