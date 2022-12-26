<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
Date nowTime = new Date();
SimpleDateFormat sf = new SimpleDateFormat("yyyy년 MM월 dd일");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="stylesheet" href="/WUE/css/import.css" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Expenditure</title>
<script type="text/javascript">
	//이름 / 값 / 저장 시킬 시간
	function SetCookie(cookie_name, value, hours) {
		if (hours) {
			var date = new Date();
			date.setTime(date.getTime() + (hours * 60 * 60 * 1000));
			var expires = "; expires=" + date.toGMTString();
		} else {
			var expires = "";
		}
		document.cookie = cookie_name + "=" + value + expires + "; path=/";
	}

	setInterval("dpTime()", 1000);
	function dpTime() {
		var now = new Date();
		hours = now.getHours();
		minutes = now.getMinutes();
		seconds = now.getSeconds();

		if (hours > 12) {
			hours -= 12;
			ampm = "오후 ";
		} else {
			ampm = "오전 ";
		}
		if (hours < 10) {
			hours = "0" + hours;
		}
		if (minutes < 10) {
			minutes = "0" + minutes;
		}
		if (seconds < 10) {
			seconds = "0" + seconds;
		}
		document.getElementById("dpTime").innerHTML = ampm + hours + ":"
				+ minutes + ":" + seconds;
	}
</script>
<style type="text/css">
ul li {
	list-style: none;
}

a {
	text-decoration: none;
	color: #333;
}
/* 글자크기를 16px 맑은 고딕 굵게하고 width넓이 200, 높이 30, 글자색은 검정색, 라인높이30px
menu박스 가운데정렬, 글자가운데 정렬 */
#menu2 {
	font: bold 16px "malgun gothic";
	width: 180px;
	color: black;
	line-height: 30px;
	margin: 0 auto;
	text-align: center;
}

/* menu태그 자식의 ul의 자식 li를 왼쪽정렬과 넓이 140설정 */
#menu2>ul>li {
	float: left;
	width: 120px;
	position: relative;
}

#menu2>ul>li>ul {
	width: 120px;
	display: none;
	position: absolute;
	font-size: 14px;
}

#menu2>ul>li:hover>ul {
	display: block;
}

#menu2>ul>li>ul>li:hover {
	background: pink;
	transition: ease 1s;
}
</style>
</head>
<body>

	<header class="header" style="z-index: 2;">
		<div class="header__img">
			<img src="/WUE/img/logoWorker.png" />
		</div>

		<div style="margin-right: 125px; float: right; margin-top: -90px;"><%=sf.format(nowTime)%></div>
		<div style="margin: 20px; float: right; margin-top: -90px;">
			<span id="dpTime">오후 01:44:40</span>
		</div>
		<div class="header__img" style="margin-top: -60px;">
			<i class="fas fa-user-cog fa-3x"></i>&nbsp;&nbsp;&nbsp;<span>${authInfo.name}
				님 로그인</span>
		</div>

	</header>
	<script src="https://kit.fontawesome.com/4a9dbb7224.js"
		crossorigin="anonymous"></script>
	<nav class="menu">
		<table>
			<tr>
				<th style="border: 4px outset pink;" onclick="location.href='list'">관리자
					정보</th>
			</tr>
			<tr>
				<th style="border: 4px outset pink;"
					onclick="location.href='management'">회원 관리</th>
			</tr>
			<tr style="height: 140px;">
				<th style="border: 4px outset pink;">
					<div id="menu2">
						<ul>
							<li><a href="kind=1">상품 관리 &nbsp;&nbsp;&nbsp;</a>
								<ul>
									<li><a href="reg">상품 등록 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="kind=1">상품 관리 &nbsp;&nbsp;&nbsp;</a></li>
								</ul></li>
							<ul>
								<li>&nbsp;&nbsp;</li>
								<li>&nbsp;&nbsp;</li>
							</ul>
						</ul>
					</div>
				</th>
			</tr>
			<tr>
				<th style="border: 4px outset pink;" onclick="location.href='event'">이벤트 관리</th>
			</tr>
			<tr style="height: 140px;">
				<th style="border: 4px outset pink;">
					<div id="menu2">
						<ul>
							<li><a href="board">게시판 관리 &nbsp;&nbsp;&nbsp;</a>
								<ul>
									<li><a href="board">게시판 등록 &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="qna">Q & A &nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="notice">공지사항 &nbsp;&nbsp;&nbsp;</a></li>
								</ul></li>
							<ul>
								<li>&nbsp;&nbsp;</li>
								<li>&nbsp;&nbsp;</li>
								<li>&nbsp;&nbsp;</li>
								<li>&nbsp;&nbsp;</li>
							</ul>
						</ul>
					</div>
				</th>
			</tr>
			<tr>
				<th style="border: 4px outset pink;"
					onclick="location.href='seller_order'">주문내역 관리</th>
			</tr>
			<tr>
				<th style="border: 4px outset pink;">
					<div id="menu2">
						<ul>
							<li><a href="sales">매출 관리 &nbsp;&nbsp;&nbsp;</a>
								<ul>
									<li><a href="sales">이익 관리&nbsp;&nbsp;&nbsp;</a></li>
									<li><a href="expenditure">지출 관리 &nbsp;&nbsp;&nbsp;</a></li>
								</ul></li>
							<ul>
								<li>&nbsp;&nbsp;</li>
							</ul>
						</ul>
					</div>
				</th>
			</tr>
		</table>
	</nav>
	<form action='expenditure' method='post'>
		<main class="to_do_list">
			<article
				style="padding-left: 150px; padding-right: 100px; z-index: 1;">
				<h3>Statistics</h3>
				<p>&nbsp;
				<h4>항목별 지출 현황</h4>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
				<div style="width: 500px; height: 500px;">
					<!--차트가 그려질 부분-->
					<canvas id="myChart"></canvas>
				</div>
				<script type="text/javascript">
					var context = document.getElementById('myChart')
							.getContext('2d');
					var myChart = new Chart(context, {
						type : 'pie', // 차트의 형태
						data : { // 차트에 들어갈 데이터
							labels : [ "임금" , "운영비", "소득세" ,"부가 가치세"],
							datasets : [ { //데이터
								label : '항목별 지출 현황', //차트 제목
								data : [ 50, 20, 10, 1.3 ],
								backgroundColor : [
								//색상
								'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)',
										'rgba(153, 102, 255, 0.2)',
										'rgba(255, 159, 64, 0.2)' ],
								borderColor : [
								//경계선 색상
								'rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)',
										'rgba(153, 102, 255, 1)',
										'rgba(255, 159, 64, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});
				</script>
				<div style="height: 80px"></div>
				<h4>월별 지출 내역</h4>
				<script
					src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
				<div style="width: 900px; height: 480px;">
					<!--차트가 그려질 부분-->
					<canvas id="Chart2"></canvas>
				</div>
				<script type="text/javascript">
					var context = document.getElementById('Chart2').getContext(
							'2d');
					var Chart2 = new Chart(context, {
						type : 'bar', // 차트의 형태
						data : { // 차트에 들어갈 데이터
							labels : ["3월", "4월", "5월", "6월", "7월", "8월"],
							datasets : [ { //데이터
								label : '월별 지출 내역', //차트 제목
								data : [ 60, 70, 80, 75, 55, 85],
								backgroundColor : [
								//색상
								'rgba(255, 99, 132, 0.2)',
										'rgba(54, 162, 235, 0.2)',
										'rgba(255, 206, 86, 0.2)',
										'rgba(75, 192, 192, 0.2)',
										'rgba(153, 102, 255, 0.2)',
										'rgba(255, 159, 64, 0.2)' ],
								borderColor : [
								//경계선 색상
								'rgba(255, 99, 132, 1)',
										'rgba(54, 162, 235, 1)',
										'rgba(255, 206, 86, 1)',
										'rgba(75, 192, 192, 1)',
										'rgba(153, 102, 255, 1)',
										'rgba(255, 159, 64, 1)' ],
								borderWidth : 1
							} ]
						},
						options : {
							scales : {
								yAxes : [ {
									ticks : {
										beginAtZero : true
									}
								} ]
							}
						}
					});
				</script>
				
			</article>
		</main>
	</form>

</body>
</html>