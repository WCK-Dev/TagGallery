<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>	
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

.contents { float: left; width: 100%; box-sizing: border-box; text-align: center; margin-bottom: 50px; min-height: 600px;} 

.content_box { display: inline-block; display: inline-block; width: 250px; height: 25%; position: relative; overflow: hidden; margin: 10px; min-width: 180px; color: black; text-align: center; font-size: 16px; border: 2px solid lightgray; border-radius: 10px; }
.content_box img { display:block; width: 250px; height:150px; align: center}

.tag_Rank { position: absolute; left: 85%; top: 30%;}

.text-right { clear: both;}

</style>
</head>
<body>

	<div class="container wrapper">
		
		<h2 style="margin-top: 60px; display: inline-block;">태그 갤러리 게시판</h2>
		<div style="margin-left: 58%">
			<!-- Navbar brand -->
			<form class="form-inline ml-auto" action="index" method="get">
				<select name="condition" class="browser-default custom-select mr-2 mb-2">
				  <option value="b_title">제목</option>
				  <option value="b_writer">내용</option>
				  <option value="b_content">첨부파일명</option>
				</select>
				<div class="row mx-0">
					<input class="col form-control mt-1" type="text" name="keyword" placeholder="Search" value="">
					<button class="col btn btn-primary my-0 mb-2 ml-3" type="submit">검색</button>
				</div>
			</form>
		</div>

		<hr>
		
		<!-- Content -->
		<div class="contents">
		<c:forEach items="${galleryList }" var="gallery">
			<c:set var="tags" value="${fn:split(gallery.gTag, ',') }"/>
			<div class="content_box">
		    	<a href="readGallery.do?g_seq=${gallery.gSeq }">
			    	<img class="content_img" src="${pageContext.request.contextPath }/upload/${gallery.gRegdate }/${gallery.gThumbname }">
			    	<span>${gallery.gTitle }</span><br>
		    	</a>
		    	<span>${gallery.gWriter }</span><br>
		    	<span>
		    		<c:forEach items="${tags }" var="eachTag">
		    			<a href="#">#${eachTag }</a>&nbsp;&nbsp;
		    		</c:forEach>
		    	</span>
		    </div>
		</c:forEach>
		</div>
		
		<div class="tag_Rank">
			<table>
				<tr><th>태그순위 #10</th></tr>
				<tr><td>1</td></tr>
				<tr><td>2</td></tr>
				<tr><td>3</td></tr>
				<tr><td>4</td></tr>
				<tr><td>5</td></tr>
				<tr><td>6</td></tr>
				<tr><td>7</td></tr>
				<tr><td>8</td></tr>
				<tr><td>9</td></tr>
				<tr><td>10</td></tr>
			</table>
		</div>
		<div class="text-right">
			<button style="width: 100px; height:50px; padding:5px;" class="btn btn-primary mb-3" onclick="location='writeGallery.do'">글쓰기</button>
		</div>
	</div>
</body>
</html>