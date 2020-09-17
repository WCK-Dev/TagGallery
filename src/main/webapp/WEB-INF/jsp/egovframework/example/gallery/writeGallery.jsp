<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 글작성</title>
<%@include file="../cmmn/common_top.jsp"%>

<style>
* { font-family: 'Noto Sans KR', sans-serif; }
* { box-shadow: 0 0!important;}

.wrapper { min-height: 70vh;}

.text-right { clear: both;}

.tags b { margin-left: 10px;}

</style>

<script>
	function addTag() {
		var existingTag = $("input[name='g_tag']").val()+'';
		var splitTags = existingTag.split(',');
		var newTag = $("#newTag").val();
		
		if(newTag.trim() == '') {
			alert("공백문자는 태그값으로 입력될 수 없습니다.")
			return false;
			
		} else {
			for(i=0; i<splitTags.length; i++) {
				if(splitTags[i] == newTag) {
					alert("동일한 태그는 중복 추가할 수 없습니다.");
					return false;
				}
			}
			if(existingTag == '') {
				$("input[name='g_tag']").val(newTag);
			} else {
				$("input[name='g_tag']").val(existingTag + "," +newTag);	
			}
			
			$("#newTag").val('');
			$(".tags").append("<b><span class='badge badge-pill badge-primary'>" + newTag + "</span> <a class='text-danger' onclick='deleteThisTag(this)'>&nbsp;x</a></b>")
		}
	}
	
	function enterAdd() {
		if(event.keyCode == 13) {
			event.preventDefault();
			addTag();
		}
	}
	
	function deleteThisTag(a_tag) {
		var existingTag = $("input[name='g_tag']").val()+'';
		var splitTags = existingTag.split(',');
		var delTag = $(a_tag).prev().text();
		var newVal = "";
		
		
		for(i=0; i<splitTags.length; i++) {
			if(splitTags[i] != delTag) {
				if(newVal == '') {
					newVal = splitTags[i];
				} else {
					newVal = newVal + "," + splitTags[i];
				}
			}
		}
		
		$("input[name='g_tag']").val(newVal);
		
		$(a_tag).parent().remove();
	}
	
	function testValidation() {
		var g_title =  $("input[name='g_title']").val();
		var g_content =  $("textarea[name='g_content']").val();
		var g_tag =  $("input[name='g_tag']").val();
		
		if(g_title.trim() == '') {
			alert("게시글 제목을 입력해주세요");
			$("input[name='g_title']").focus();
			return false;
		}
		if(g_content.trim() == '') {
			alert("게시글 내용을 입력해주세요");
			$("textarea[name='g_content']").focus();
			return false;
		}
		if(g_tag.trim() == '') {
			alert("최소 하나의 태그를 추가해주세요");
			$("input[id='newTag']").focus();
			return false;
		}
	}
	
	function chkFileType(obj) {

		var fileKind = obj.value.lastIndexOf('.');
		var fileName = obj.value.substring(fileKind+1,obj.length);
		var fileType = fileName.toLowerCase();

		var checkFileType = new Array();

		checkFileType=['jpg','gif','png','jpeg','bmp','tif'];

		if(checkFileType.indexOf(fileType)==-1) {

			alert('이미지만 업로드 가능합니다.');

			var parentObj = obj.parentNode;
			var node = parentObj.replaceChild(obj.cloneNode(true),obj);

			$("#files").val(""); 

			return false;
		}

	}

</script>

</head>
<body>
	<div class="container wrapper">
		<div class="userBox" style="width: 100%; padding-top:20px; text-align: right;">
			${sessionScope.user.u_name }(${sessionScope.user.u_id })님 환영합니다.
			<button class="btn btn-danger" onclick="location.href='logout.do'">로그아웃</button>
		</div>
		
		<form class="text-center border border-light p-5" action="writeGallery.do" enctype="multipart/form-data" method="post" onsubmit="return testValidation()">
			<input type="hidden" name="g_tag" value="">
		
		    <p class="h4 mb-4">갤러리 글작성</p>
		
		    <!-- Name -->
		    <input type="text" name="g_writer" class="form-control mb-4" placeholder="Writer" value="${sessionScope.user.u_id }" readonly>
			
			<hr>
			
			<!-- Title -->
		    <input type="text" name="g_title" class="form-control mb-4" placeholder="Title">
		    
		    <!-- Content -->
		    <div class="form-group text-left">
		        <textarea id="b_content" name="g_content" class="w-100 form-control rounded-0" placeholder="Content" rows="13"></textarea>
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
				<button type="submit" style="width: 100px; height:40px; padding:5px;" class="btn btn-primary mb-3">글쓰기</button>
				<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-primary mb-3" onclick="location='galleryMain.do'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>