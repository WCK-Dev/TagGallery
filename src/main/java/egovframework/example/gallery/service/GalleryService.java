package egovframework.example.gallery.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

public interface GalleryService {
	
	UserVO login(UserVO vo);
	
	int selectMaxGseq();
	
	int insertGallery(GalleryVO vo);
	
	int insertFile(FilesVO vo);
	
	int insertTag(TagVO vo);
	
	List<GalleryVO> selectGalleryList(GalleryVO vo);
	
	int selectGalleryListTotCnt(GalleryVO vo);
	
	List<TagVO> selectTagRank();
	
	GalleryVO selectGallery(GalleryVO vo);
	
	FilesVO selectFile(FilesVO vo);
	
	void updateFileDownCnt(FilesVO vo);
	
	int selectTagDownCnt(TagVO vo);
	
	List<FilesVO> selectFileList(GalleryVO vo);
	
	int updateGallery(GalleryVO vo);
	
	int deleteTag(TagVO vo);
	
	int deleteFile(FilesVO vo);
	
	int deleteGallery(GalleryVO vo);
	
}
