<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 메인</title>
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
			
			$(".tags").append("<b><span class='badge badge-pill badge-primary'>" + newTag + "</span> <a class='text-danger' onclick='deleteThisTag(this)'>&nbsp;x</a></b>")
		}
	}
	
	function deleteThisTag(a_tag) {
		var delTag = $(a_tag).prev().text();
		console.log(delTag);
	}

</script>

</head>
<body>
	<div class="container wrapper">
		<form class="text-center border border-light p-5" action="writeGallery" method="post" onsubmit="return empCheck()">
			<input type="hidden" name="g_tag" value="">
		
		    <p class="h4 mb-4">갤러리 글작성</p>
		
		    <!-- Name -->
		    <input type="text" name="b_writer" class="form-control mb-4" placeholder="Writer" value="" readonly>
			
			<hr>
			
			<!-- Title -->
		    <input type="text" name="b_title" class="form-control mb-4" placeholder="Title" required>
		    
		    <!-- Content -->
		    <div class="form-group text-left">
		        <textarea id="b_content" name="b_content" class="w-100 form-control rounded-0" placeholder="Content" rows="13"></textarea>
		    </div>
		    
		    <div class="form-group text-left">
		    	<input type="text" class="form-control" id="newTag" placeholder="태그명 추가" style="width: 30%; display: inline">
		        <button type="button" onclick="addTag()" style="width: 100px; height:40px; padding:5px;" class="btn btn-primary mb-3">태그추가하기</button>
		        <div class="tags"><!-- 태그추가시 badge 추가되는 div --></div>
		    </div>
			
		    <div class="form-group text-left">
		        <input type="file" multiple="multiple">
		    </div>
		    
			<div class="container text-right">
				<button type="submit" style="width: 100px; height:40px; padding:5px;" class="btn btn-primary mb-3">글쓰기</button>
				<button type="button" style="width: 100px; height:40px; padding:5px;" class="btn btn-primary mb-3" onclick="location='galleryMain.do'">취소</button>
			</div>
		</form>
	</div>
</body>
</html>