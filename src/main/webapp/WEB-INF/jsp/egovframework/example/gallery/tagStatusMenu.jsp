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
<title>인기태그 현황메뉴</title>
<%@include file="../cmmn/common_top.jsp"%>

<style>

</style>
<!-- 엑셀 파일 다운로드 필요 script -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.css"/> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script> 
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.fileDownload/1.4.2/jquery.fileDownload.js"></script>
<script type="text/javascript"> 
//<![CDATA[ 
	$(function() {
		$("#btn-excel").on("click", function () {
			var $preparingFileModal = $("#preparing-file-modal");
			$preparingFileModal.dialog({ modal: true });
			$("#progressbar").progressbar({value: false});
			$.fileDownload("getTagStatus.do", {
				successCallback: function (url) {
					$preparingFileModal.dialog('close');
				},
				failCallback: function (responseHtml, url) {
					$preparingFileModal.dialog('close');
					$("#error-modal").dialog({ modal: true });
				}
			});
			// 버튼의 원래 클릭 이벤트를 중지 시키기 위해 필요합니다.
			return false;
		});
	});
//]]> 
</script>

<!-- 그래프표시 필요 script -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawVisualization);

  function drawVisualization() {
  	var chartData = [['태그명', '태그사용 횟수', '태그 조회수', '다운로드 수']];
	  
  	$.ajax({ 
		type : 'POST',
		url : "getTagStatus.do",
		async : false,
		dataType : "json",
		
		success : function (result) {
			for(i=0; i<result.length; i++) {
				var subArr = [ "#" +result[i].t_name, result[i].t_usecnt, result[i].t_readcnt, result[i].t_downcnt];
				chartData.push(subArr);
				}
			}
	}); // ajax End
	
    var options = {
      title : '상위 5개 태그 사용 현황',
      vAxis: {title: '횟수'},
      hAxis: {title: '태그명'},
      seriesType: 'bars',
      series: {3: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(google.visualization.arrayToDataTable(chartData), options);
  }
</script>

</head>
<body>
	<div class="container wrapper text-center">
		
		<h2 style="margin-top: 60px; display: inline-block;"><a href="galleryMain.do">게시판 메인</a></h2>
		
		<hr>
		<h2 class="text-center mt-2">인기태그 현황차트</h2>
	    <div id="chart_div" style="width: 100%; height: 700px;"></div>
	    
	    <button class="btn btn-primary" id="btn-excel">엑셀 다운로드</button> 
	    
	    <!-- 파일 생성중 보여질 진행막대를 포함하고 있는 다이얼로그 --> 
	    <div title="Data Download" id="preparing-file-modal" style="display: none;">
	    	<div id="progressbar" style="width: 100%; height: 22px; margin-top: 20px;"></div> 
	    </div> 
	    
	    <!-- 에러발생시 보여질 메세지 다이얼로그 입니다. --> 
	    <div title="Error" id="error-modal" style="display: none;"> 
	    	<p>생성실패.</p> 
	    </div>
	</div>
</body>
</html>