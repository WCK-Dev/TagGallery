<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 글수정</title>
<%@include file="../cmmn/common_top.jsp"%>

<style>
* { font-family: 'Noto Sans KR', sans-serif; }
* { box-shadow: 0 0!important;}

.wrapper { min-height: 70vh;}

.text-right { clear: both;}

.tags b { margin-left: 10px;}

</style>

<script type="text/javascript" src="${pageContext.request.contextPath }/js/inputForm.js"></script>
<script>
	$(document).ready(function() {
		var existingTag = $("input[name='g_tag']").val()+'';
		var splitTags = existingTag.split(',');
		
		splitTags.forEach(function(element){
			if(element.trim() != '') {
				$(".tags").append("<b><span class='badge badge-pill badge-primary'>" + element + "</span> <a class='text-danger' onclick='deleteThisTag(this)'>&nbsp;x</a></b>")				
			}
		});
		
	});

	function addDelFileList(delButton) {
		
		var existingDelList = $("input[name='delFileList']").val()+'';
		var splitDelList = existingDelList.split(',');
		var delFileSeq = $(delButton).next().val();
		
		if(existingDelList == '') {
			$("input[name='delFileList']").val(delFileSeq);
		} else {
			$("input[name='delFileList']").val(existingDelList + "," +delFileSeq);	
		}
		
		$(delButton).parent().remove();
		
	}

</script>

</head>
<body>
	<div class="container wrapper">
		<div class="userBox" style="width: 100%; padding-top:20px; text-align: right;">
			${sessionScope.user.u_name }(${sessionScope.user.u_id })님 환영합니다.
			<button class="btn btn-danger" onclick="location.href='logout.do'">로그아웃</button>
		</div>
		
		<form class="text-center border border-light p-5" action="updateGallery.do" enctype="multipart/form-data" method="post" onsubmit="return testValidation()">
			<input type="hidden" name="g_tag" value="${gallery.g_tag }">
			<input type="hidden" name="delFileList" value="">
			<input type="hidden" name="g_seq" value="${gallery.g_seq }">
			<input type="hidden" name="datePath" value="${gallery.g_regdate }">
		
			<h2 style="margin-top: 60px; display: inline-block;"><a href="galleryMain.do">태그 갤러리 게시판</a></h2>
			<hr>
		
		    <p class="h4 mb-4">갤러리 글 수정</p>
		
		    <!-- Name -->
		    <input type="text" name="g_writer" class="form-control mb-4" placeholder="Writer" value="${sessionScope.user.u_id }" readonly>
			
			<hr>
			
			<!-- Title -->
		    <input type="text" name="g_title" class="form-control mb-4" placeholder="Title" value="${gallery.g_title }">
		    
		    <!-- Content -->
		    <div class="form-group text-left">
		        <textarea id="b_content" name="g_content" class="w-100 form-control rounded-0" placeholder="Content" rows="13">${gallery.g_content }</textarea>
		    </div>
		    
	     	<!-- Download Files -->
		    <div class="text-left mb-4" style="border: 1px solid lightgray; border-radius: 5px; padding: 10px"><p class="text-10">첨부파일 : </p>
		    	<c:forEach items="${fileList }" var="file">
					<div>
						<i class="fas fa-file-image"></i><a style="margin: 0 25px">${file.f_originname}</a><a class='text-danger' onclick='addDelFileList(this)'>삭제하기</a>
						<input type="hidden" value="${file.f_seq }">
					</div>
				</c:forEach>
			</div>
		    
		    <div class="form-group text-left">
		    	<input type="text" class="form-control" id="newTag" placeholder="태그명 추가" onkeypress="enterAdd()" style="width: 30%; display: inline">
		        <button type="button" onclick="addTag()" style="width: 100px; height:40px; padding:5px;" class="btn btn-primary mb-3">태그추가하기</button>
		        <div class="tags"><!-- 태그추가시 badge 추가되는 div --></div>
		    </div>
			
		    <div class="form-group text-left">
		        <input type="file" name="files" id="files"" multiple="multiple" accept="image/*" onchange="chkFileType(this)">
		    </div>
		    
			<div class="container text-right">
				<button type="submit" style="width: 100px; height:40px; padding:5px;" class="btn btn-primary mb-3">수정하기</button>
				<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-primary mb-3" onclick="location='readGallery.do?g_seq=${gallery.g_seq}'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>