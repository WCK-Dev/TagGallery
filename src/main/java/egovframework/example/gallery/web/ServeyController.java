package egovframework.example.gallery.web;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.gallery.service.ServeyService;
import egovframework.rte.fdl.property.EgovPropertyService;

@Controller
public class ServeyController {
	
	/** EgovSampleService */
	@Resource(name = "galleryService")
	private ServeyService galleryService;
	
	/** EgovPropertyService */
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	
	@RequestMapping(value="galleryMain.do")
	public String galleryMain() {
		System.err.print("124");
		return "";
	}
	
}
