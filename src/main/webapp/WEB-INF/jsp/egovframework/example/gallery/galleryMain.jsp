<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" 	uri="http://java.sun.com/jsp/jstl/fmt" %>	
<%@ taglib prefix="fn" 		uri="http://java.sun.com/jsp/jstl/functions" %>	
<%@ taglib prefix="ui"     	uri="http://egovframework.gov/ctl/ui"%>
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

.contents { float: left; width: 100%; box-sizing: border-box; text-align: center; margin-bottom: 50px; min-height: 500px;} 

.content_box { display: inline-block; display: inline-block; width: 250px; height: 25%; position: relative; overflow: hidden; margin: 10px; min-width: 180px; color: black; text-align: center; font-size: 16px; border: 2px solid lightgray; border-radius: 10px; }
.content_box img { display:block; width: 250px; height:150px; align: center}

.tag_Rank { position: absolute; left: 85%; top: 30%; text-align: center;}
.tag_Rank tr { height: 40px; border: 1px solid lightgray;}
.tag_Rank td { width: 150px;}

.text-right { clear: both;}

</style>

<script>

function fn_link_page(pageNo){
	document.galleryListForm.pageIndex.value = pageNo;
	document.galleryListForm.action = "galleryMain.do";
   	document.galleryListForm.submit();
}

function searchThisTag(searchKeyword){
	$("select[name='searchCondition']").val("g_tag");
	$("input[name='searchKeyword']").val(searchKeyword);
	document.galleryListForm.submit();
}

</script>

</head>
<body>

	<div class="container wrapper">
		<div class="userBox" style="width: 100%; padding-top:20px; text-align: right;">
			${sessionScope.user.u_name }(${sessionScope.user.u_id })님 환영합니다.
			<button class="btn btn-danger" onclick="location.href='logout.do'">로그아웃</button>
		</div>
		
		<h2 style="margin-top: 60px; display: inline-block;"><a href="galleryMain.do">태그 갤러리 게시판</a></h2>
		
		<div style="margin-left: 58%">
		<form class="form-inline ml-auto" action="galleryMain.do" method="get" id="galleryListForm" name="galleryListForm">
			<!-- Navbar brand -->
				<select name="searchCondition" class="browser-default custom-select mr-2 mb-2">
				  <option value="g_title" <c:if test="${gallery.searchCondition=='g_title' || board.searchCondition=='' }">selected</c:if>>제목</option>
				  <option value="g_content" <c:if test="${gallery.searchCondition=='g_content'}">selected</c:if>>내용</option>
				  <option value="g_tag" <c:if test="${gallery.searchCondition=='g_tag'}">selected</c:if>>태그</option>
				  <option value="f_originname" <c:if test="${gallery.searchCondition=='f_originname'}">selected</c:if>>첨부파일명</option>
				</select>
				<div class="row mx-0">
					<input class="col form-control mt-1" type="text" name="searchKeyword" placeholder="Search" value="${gallery.searchKeyword }">
					<button class="col btn btn-primary my-0 mb-2 ml-3" type="submit">검색</button>
				</div>
			<input type="hidden" id="pageIndex" name="pageIndex" value="1">
		</form>
		</div>
		
		<hr>
		
		<!-- Content -->
		<div class="contents">
		<c:forEach items="${galleryList }" var="galleryOne">
			<c:set var="tags" value="${fn:split(galleryOne.g_tag, ',') }"/>
			<div class="content_box">
		    	<a href="readGallery.do?g_seq=${galleryOne.g_seq }">
		    		<c:if test="${galleryOne.g_thumbname != null }">
				    	<img class="content_img" src="${pageContext.request.contextPath }/upload/${galleryOne.g_regdate }/${galleryOne.g_thumbname }">
		    		</c:if>
		    		<c:if test="${galleryOne.g_thumbname == null }">
				    	<img class="content_img" src="${pageContext.request.contextPath }/upload/no_image.jpg">
		    		</c:if>
			    	<span>${galleryOne.g_title }</span><br>
		    	</a>
		    	<span>${galleryOne.g_writer }</span><br>
		    	<span>
		    		<c:forEach items="${tags }" var="eachTag">
		    			<a href="#" onclick="searchThisTag('${eachTag }')">#${eachTag }</a>&nbsp;
		    		</c:forEach>
		    	</span>
		    </div>
		</c:forEach>
		</div>
		
		<div class="tag_Rank">
			<table>
				<tr><th>태그순위 #5</th></tr>
				<c:forEach items="${tagRank }" var="rank" varStatus="i">
					<tr 
						<c:if test="${i.index == 0}">class="table-primary"</c:if>
						<c:if test="${i.index == 1}">class="table-success"</c:if>
						<c:if test="${i.index == 2}">class="table-danger"</c:if>
						<c:if test="${i.index == 3}">class="table-warning"</c:if>
						<c:if test="${i.index == 4}">class="table-info"</c:if>
					>
						<td><a href="#" onclick="searchThisTag('${rank.t_name }')">#${rank.t_name }</a> <small style="color:red;">(총 ${rank.t_usecnt }개)</small></td>
					</tr>
				</c:forEach>
				<tr><td><a href="tagStatusMenu.do">인기태그 사용현황</a></td></tr>
			</table>
		</div>
		
		<!-- 페이징 -->
		<ul class="pagination" style="width: 100%; text-align:center;">
   			<ui:pagination paginationInfo = "${paginationInfo}" type="image" jsFunction="fn_link_page" />
       	</ul>
       	
		<div class="text-right">
			<button style="width: 100px; height:50px; padding:5px;" class="btn btn-primary mb-3" onclick="location='writeGallery.do'">글쓰기</button>
		</div>
	</div>
</body>
</html>