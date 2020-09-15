package egovframework.example.gallery.service;

import java.util.List;

public interface GalleryService {
	
	UserVO login(UserVO vo);
	
	int selectMaxGseq();
	
	int insertGallery(GalleryVO vo);
	
	int insertFile(FilesVO vo);
	
	int insertTag(TagVO vo);
	
	List<GalleryVO> selectGalleryList(GalleryVO vo);
	
	GalleryVO selectGallery(GalleryVO vo);
	
	List<FilesVO> selectFileList(GalleryVO vo);
	
	int deleteGallery(GalleryVO vo);
}
