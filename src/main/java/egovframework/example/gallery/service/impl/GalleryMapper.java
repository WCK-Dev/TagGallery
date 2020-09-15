/*
 * Copyright 2011 MOPAS(Ministry of Public Administration and Security).
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package egovframework.example.gallery.service.impl;

import java.util.List;

import egovframework.example.gallery.service.FilesVO;
import egovframework.example.gallery.service.GalleryVO;
import egovframework.example.gallery.service.TagVO;
import egovframework.example.gallery.service.UserVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("galleryMapper")
public interface GalleryMapper {
	
	UserVO login(UserVO vo);
	
	int selectMaxGseq();
	
	int insertGallery(GalleryVO vo);
	
	int insertFile(FilesVO vo);
	
	int insertTag(TagVO vo);
	
	List<GalleryVO> selectGalleryList(GalleryVO vo);
	
	int selectGalleryListTotCnt(GalleryVO vo);
	
	GalleryVO selectGallery(GalleryVO vo);
	
	void updateGalleryReadCnt(GalleryVO vo);
	
	List<FilesVO> selectFileList(GalleryVO vo);
	
	int updateGallery(GalleryVO vo);
	
	int deleteTag(TagVO vo);
	
	int deleteFile(FilesVO vo);
	
	int deleteGallery(GalleryVO vo);
}
