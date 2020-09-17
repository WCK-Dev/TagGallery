<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>	
<%
     //치환 변수 선언
      pageContext.setAttribute("crcn", "\n"); // Enter
      pageContext.setAttribute("br", "<br/>"); //br 태그
%> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>갤러리 상세보기</title>
<%@include file="../cmmn/common_top.jsp"%>

<style>
* { font-family: 'Noto Sans KR', sans-serif; }
* { box-shadow: 0 0!important;}

img { max-width: 100%;}

#tagBadge { margin: 0 5px;}

</style>

<script>
function del(g_seq, regPath) {
	
	console.log(regPath);
	
	if(confirm("해당글을 삭제하시겠습니까?\r\n삭제후에는 복구할 수 없습니다.")){
		
		$.ajax({
			type : 'POST',
			url : "deleteGallery.do",
			data : { "g_seq" : g_seq
					,"regPath" : regPath
					},
			
			success : function(result) {
				console.log(result);
				
				if(result == 1) {
					alert("글 삭제가 정상적으로 수행되었습니다.");
					location.href='galleryMain.do'					
				} else {
					alert("글 삭제에 오류가 발생했습니다.");
				}
			}
		});
	}
}

</script>

</head>
<body>
	<c:set var="tags" value="${fn:split(gallery.g_tag, ',') }"/>
	<div class="container wrapper">
		<div class="userBox" style="width: 100%; padding-top:20px; text-align: right;">
			${sessionScope.user.u_name }(${sessionScope.user.u_id })님 환영합니다.
			<button class="btn btn-danger" onclick="location.href='logout.do'">로그아웃</button>
		</div>

		<div class="text-center">
			<h2 style="margin-top: 60px; display: inline-block;"><a href="galleryMain.do">태그 갤러리 게시판</a></h2>
			<hr>
			
		    <p class="h4 mb-4">갤러리 상세보기</p>
		    
		    <!-- title -->
		    <div class="form-control mb-4 text-left" style="margin-right: 5%; display: inline-block;">${gallery.g_title }</div>
		    
		    <!-- writer -->
		    <div class="text-left mb-4" ><i class="fas fa-user prefix mr-2"></i>${gallery.g_writer }</div>
		    
			<!-- RedDate -->
		    <div class="text-left mb-4"><i class="fas fa-clock mr-2"></i>${gallery.g_regdate }</div>
		    
			<!-- ReadCount -->
		    <div class="text-left mb-4"><i class="far fa-eye mr-2"></i>${gallery.g_readcnt }</div>
		    
		    <!-- Tags -->
		    <div class="text-left mb-4"><i class="fas fa-hashtag"></i>
				<c:forEach items="${tags }" var="eachTag">
					<b id="tagBadge"><span class='badge badge-pill badge-primary'>${eachTag }</span></b>
				</c:forEach>
			</div>
			
		    <!-- Download Files -->
		    <div class="text-left mb-4" style="border: 1px solid lightgray; border-radius: 5px; padding: 10px"><p class="text-10">첨부파일 : </p>
		    	<c:forEach items="${fileList }" var="file">
					<i class="fas fa-file-image"></i><a style="margin: 0 25px" href="downloadFile.do?f_seq=${file.f_seq }&datePath=${gallery.g_regdate }">${file.f_originname}</a><small style="color: gray;">다운로드수 : ${file.f_downcnt }</small><br>
				</c:forEach>
			</div>
		    
			<hr>
		    
		    <!-- Content -->
		    <div class="text-left mb-3">
		    	<c:forEach items="${fileList }" var="file">
		    		<img src="${pageContext.request.contextPath }/upload/${gallery.g_regdate }/${file.f_uploadname }"><br>
		    	</c:forEach>
		    
				<p style="margin-top: 50px"><c:out value="${fn:replace(gallery.g_content, crcn, br)}" escapeXml="false"/></p>
		    </div>
		    
		    <!-- 수정 / 삭제 버튼 -->
		    <div class="text-right mb-3">
		 		<c:if test="${gallery.g_writer == sessionScope.user.u_id}">
					<button type="button" class="btn btn-dark mb-3" onclick="location='updateGallery.do?g_seq=${gallery.g_seq }'">글수정</button>
					<button type="button" class="btn btn-dark mb-3" onclick="del('${gallery.g_seq }', '${gallery.g_regdate }')">글삭제</button>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>