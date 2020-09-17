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

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawVisualization);

  function drawVisualization() {
	  
	  $.ajax({ 
			type : 'POST',
			url : "getTagStatus.do",
			dataType : "json",
			
			success : function (result) {
				console.log(result)
			}
		}); // ajax End  
	  
    var data = google.visualization.arrayToDataTable([
      ['태그명', '태그사용 횟수', '태그 조회수', '다운로드 수'],
      ['2004/05',  8,      40,         72],
      ['2005/06',  15,      35,        18],
      ['2006/07',  13,      20,        38],
      ['2007/08',  20,      15,        96],
      ['2008/09',  15,      20,         50]
    ]);

    var options = {
      title : 'Monthly Coffee Production by Country',
      vAxis: {title: '횟수'},
      hAxis: {title: '태그명'},
      seriesType: 'bars',
      series: {3: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>
</head>
<body>
	<div class="container wrapper">
		
		<h2 style="margin-top: 60px; display: inline-block;"><a href="tagStatusMenu.do">인기태그 사용현황</a></h2>
		
		<hr>
	    <div id="chart_div" style="width: 100%; height: 700px;"></div>
	</div>
</body>
</html>