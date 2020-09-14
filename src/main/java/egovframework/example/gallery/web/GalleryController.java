package egovframework.example.gallery.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import egovframework.example.gallery.service.GalleryService;
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
		System.out.println("1234");
		
		return "gallery/galleryMain";
	}
	
	@RequestMapping(value="writeGallery.do", method=RequestMethod.GET)
	public String writeGallery() {
		
		return "gallery/writeGallery";
	}
	
}
