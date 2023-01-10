<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<content ="width=device-width, initial-scale=1.0"> <jsp:include
	page="header.jsp" />
<title>Insert title here</title>
<script type="text/javascript">

let curPos = 0;
let postion = 0;
const IMAGE_WIDTH = 400;
const prevBtn = document.querySelector(".prev")
const nextBtn = document.querySelector(".next")
const images = document.querySelector(".images")
 
function prev(){
  if(curPos > 0){
    nextBtn.removeAttribute("disabled")
    postion += IMAGE_WIDTH;
    images.style.transform = `translateX(${postion}px)`;
    curPos = curPos - 1;
  }
  if(curPos == 0){
    prevBtn.setAttribute('disabled', 'true')
  }
}
function next(){
  if(curPos < 3){
    prevBtn.removeAttribute("disabled")
    postion -= IMAGE_WIDTH;
    images.style.transform = `translateX(${postion}px)`;
    curPos = curPos + 1;
  }
  if(curPos == 3){
    nextBtn.setAttribute('disabled', 'true')
  }
}
 
function init(){
  prevBtn.setAttribute('disabled', 'true')
  prevBtn.addEventListener("click", prev)
  nextBtn.addEventListener("click", next)
}
 
init();


function reply(Index){
	
	//tr의 고유번호 (reply+ index=0)
	var replytr='replytr'+Index;
	
	
	//replyContent 고유번호
	var replyContent='replyContent'+Index;
	
	//고유 번호로 찾은 content 내용
	var content=document.getElementById(replyContent).innerHTML;
	
	
	console.log(content);
	
	
	
	//수정을 바뀔 내용 (수정 창 나오게 하기)
	var htmls ="";
	
	htmls+='<tr>'
	
	htmls+='<td style="border-bottom: 1px solid #444444; padding: 10px;" >'
	
	htmls+='<input type=text value=" ' + content + ' ">'
	
	htmls += '<a href="javascript:void(0)" id="a" onclick="fn_updateReply(' + Index + ', ' + Index + ')" style="padding-right:5px">저장</a>';

	htmls += '<a href="javascript:void(0)" onClick="showReplyList()">취소<a>';

	htmls +='</td>'
	
	htmls+='</tr>'
	
	//찾은 고유번호의 innerHTML를 이용하여 수정	
	document.getElementById(replytr).innerHTML =htmls;
}
	
	function fn_updateReply(replyList,replyList2){
		console.log(replyList);
		//window.onload = function() {
			console.log('시작');
			var httpRequest;
			/* button이 클릭되었을때 이벤트 */
			//document.getElementById("a").addEventListener('click', () => {
				/* textBox에 작성된 name 데이터를 가져옴 */
				//var inputName = document.getElementById("replyContent1").innerHTML;
				var inputName =replyList;
				/* 입력된 데이터 Json 형식으로 변경 */
				var reqJson = new Object();
				reqJson.email = inputName;
				
				console.log(reqJson.email);
				/* 통신에 사용 될 XMLHttpRequest 객체 정의 */
				httpRequest = new XMLHttpRequest();
				/* httpRequest의 readyState가 변화했을때 함수 실행 */
			    httpRequest.onreadystatechange = () => {
			    	console.log('통신시작');
			    	/* readyState가 Done이고 응답 값이 200일 때, 받아온 response로 name과 age를 그려줌 */
				    if (httpRequest.readyState === XMLHttpRequest.DONE) {
					      if (httpRequest.status === 200) {
					    	var result = httpRequest.response;
					        document.getElementById("replyContent1").innerText = result.email;
					        document.getElementById("replyContent1").innerText = result.content;
					        alert("a");
					      } else {
					        alert('request에 뭔가 문제가 있어요.');
					      }
					}
			    };
			    /* Post 방식으로 요청 */
			    httpRequest.open('POST', '/aa', true);
			    /* Response Type을 Json으로 사전 정의 */
			    httpRequest.responseType = "json";
			    /* 요청 Header에 컨텐츠 타입은 Json으로 사전 정의 */
			    httpRequest.setRequestHeader('Content-Type', 'application/json');
			    /* 정의된 서버에 Json 형식의 요청 Data를 포함하여 요청을 전송 */
			    httpRequest.send(JSON.stringify(reqJson));
				
	//		});
		//}
		
	}
	
</script>
<style type="text/css">
.r {
	width: 50%;
	height: 100%;
	border: 1px solid Gray;
	position: relative;
	left: 300px;
	top: 110px;
	margin: 10px;
	margin-left: 200px;
	margin-bottom: 50px;
	box-shadow: 0 2px 0 2px rgba(0, 0, 0, 0.12);
}
</style>
</head>
<body>
	<main class="r">
		<c:choose>
			<c:when test="${posting!='[]'and posting2==null}">
				<form action="postAddreply">
					<div class="title_image"
						style="position: relative; left: 4px; top: 3px">
						<c:choose>
							<c:when test="${posting.url==''}">
								<a href="instagramProfile?email=${posting.email}"><img
									style="border-radius: 20px; width: 100%;"
									src="/WUE/img/noimage.png" class="tiny_image" align="left">
								</a>
							</c:when>
							<c:otherwise>
								<a href="instagramProfile?email=${posting.email}"><img
									style="border-radius: 30px; height: 50px; width: 50px"
									src="/WUE/img/${posting.url}" class="tiny_image" align="left">
								</a>
							</c:otherwise>
						</c:choose>

						<c:choose>
							<c:when test="${user.seller_email==authInfo.email}">
								<div class="postInsert" align=center
									style="border: 1px solid gray; width: 200px; position: relative; top: 10px; 
									left: 80%; transform: translate(-50%);">
									<a href="InstaPostUpdateForm?postnumber=${posting.postnumber}"
										style="text-decoration: none; color: gray;"> 게시물 수정</a>/ <a
										href="InstaPostDelete?postnumber=${posting.postnumber}"
										style="text-decoration: none; color: gray;"> 삭제</a>
								</div>
							</c:when>
						</c:choose>
					</div>

					<div class="userid_txt"
						style="font-family: arial; position: relative; left: 10px; top: 6px">
						<a href="instagramProfile?email=${posting.email}">${posting.email}</a>
					</div>

					<div id="container"
						style="position: relative; top: 10px; width: 500px; margin: 0 auto;">
						<div class="album" style="overflow: hidden;">

							<c:forEach var="cmt" items="${posting.postimages}">
								<div class="images" style="position: relative; top: 30px;">
									<img src="/WUE/img/${cmt}"
										style="border-radius: 20px; height: 400px; width: 450px; display: block; margin-left: auto; margin-right: auto; margin-top: 5px;">
								</div>
							</c:forEach>
						</div>
					</div>

					<div class="write" style="margin: 20px">
						${posting.context} <br />			<p>
							<span style="" onclick="location.href='/main/post/'"> 댓글
								${replycount}개 </span> <input type="hidden" name="postnumber"
								value="${posting.postnumber}">
						<table
							style="width: 80%; border-top: 1px solid #444444; border-collapse: collapse;" id="replyTable">
							<c:forEach var="replyList" items="${replyList}" varStatus="status" >

								<tr id="replytr${status.index}">
									<td style="border-bottom: 1px solid #444444; padding: 10px;" ><b id="replyEmail${status.index}">${replyList.email}</b></td>

									<td style="border-bottom: 1px solid #444444; padding: 10px;" ><b id="replyContent${status.index}">${replyList.content}</b></td>
									<td style="border-bottom: 1px solid #444444; padding: 10px;" ><b id="replyDay${status.index}"><fmt:formatDate
												value="${replyList.reg_date}" pattern="yyyy-MM-dd" /></b></td>
									<td><input type="hidden" name="currentbook${status.index}"  value="${replyList}"/></td>
									<c:choose>
										<c:when test="${replyList.email==authInfo.email}">		
											<td style="border-bottom: 1px solid #444444; padding: 10px;"><input type="button" onclick="reply(${status.index})" value="댓글 수정"/></td>
										</c:when>
										<c:otherwise>
											<td style="border-bottom: 1px solid #444444; padding: 10px;">  </td>
										</c:otherwise>
									</c:choose>	
								<%--  --%>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="2" style="margin-top: 10px;"><input
									type="text" name="content"
									style="width: 450px; height: 50px; margin-top: 20px;">
								</td>
								<td><input type="submit" value="댓글등록"></td>
							</tr>
						</table>

					</div>
				</form>
			</c:when>

			<c:when test="${posting2!='[]'}">
				<form action="farmAddreply">
					<div class="title_image"
						style="margin-left: 10px; padding-top: 10px; position: relative; left: 4px; top: 3px">
						<c:choose>
							<c:when test="${posting2.getFarmList().get(0).url==''}">
								<a
									href="instagramProfile?email=${posting2.getFarmList().get(0).email}"><img
									style="border-radius: 30px; height: 80px; width: 80px;"
									src="/WUE/img/noimage.png" class="tiny_image" align="left">
								</a>
							</c:when>
							<c:otherwise>
								<a
									href="instagramProfile?email=${posting2.getFarmList().get(0).email}"><img
									style="border-radius: 30px; height: 80px; width: 80px"
									src="/WUE/img/${posting2.getFarmList().get(i).url}"
									class="tiny_image" align="left"> </a>
							</c:otherwise>
						</c:choose>
					</div>
					<br>&nbsp;&nbsp;
					<div class="userid_txt"
						style="font-family: arial; position: relative; left: 20px; top: 20px">
						<a
							href="instagramProfile?email=${posting2.getFarmList().get(0).email}">${posting2.getFarmList().get(0).email}</a>
					</div>
					<br>
					<c:choose>
						<c:when test="${user.seller_email==authInfo.email}">
							<div class="postInsert" align=center
								style="margin-left: 50px; border: 1px solid gray; width: 200px; position: absolute; top: 17px; left: 80%; transform: translate(-50%);">
								<a href="farmForm" style="text-decoration: none; color: gray;">
									주말 농장 추가등록</a>/ <a href="farmUpdateForm"
									style="text-decoration: none; color: gray;"> 수정</a>
							</div>
						</c:when>
					</c:choose>

					<div id="container"
						style="position: relative; top: 10px; width: 500px; margin: 0 auto;">
						<div class="album" style="overflow: hidden;">

							<c:forEach var="cmt"
								items="${posting2.getFarmList().get(0).postimages}">
								<div class="images" style="position: relative; top: 30px;">
									<img src="/WUE/img/${cmt}"
										style="border-radius: 20px; height: 400px; width: 450px; display: block; margin-left: auto; margin-right: auto; margin-top: 5px;">
								</div>
							</c:forEach>
						</div>
					</div>
					<div style="height: 20px;"></div>
					<div class="write" style="margin: 20px">
						<input type="hidden" name="fseq"
							value="${posting2.getFarmList().get(i).fseq}">
						${posting2.getFarmList().get(0).experience_context}<p>
						<div style="height: 20px;"></div>
						<table
							style="margin-left: 70px; width: 80%; border-top: 1px solid #444444; border-collapse: collapse;">
							<tr>
								<th style="border-bottom: 1px solid #444444; padding: 10px;"><b>index</b></th>
								<th style="border-bottom: 1px solid #444444; padding: 10px;"><b>예약
										가능날짜</b></th>
								<th style="border-bottom: 1px solid #444444; padding: 10px;"><b>예약
										가능시간</b></th>
								<th style="border-bottom: 1px solid #444444; padding: 10px;"><b>예약
										금액(총합)</b></th>
								<th style="border-bottom: 1px solid #444444; padding: 10px;"><b>체험가능
										인원</b></th>
							</tr>
							<c:forEach var="i" begin="0"
								end="${posting2.getFarmList().size()-1}">

								<tr>
									<td style="border-bottom: 1px solid #444444; padding: 10px;">${i+1}</td>
									<td style="border-bottom: 1px solid #444444; padding: 10px;">${posting2.getFarmList().get(i).experience_date}</td>
									<td style="border-bottom: 1px solid #444444; padding: 10px;">${posting2.getFarmList().get(i).experience_time}</td>
									<td style="border-bottom: 1px solid #444444; padding: 10px;">${posting2.getFarmList().get(i).experience_price}</td>
									<td style="border-bottom: 1px solid #444444; padding: 10px;">${posting2.getFarmList().get(i).experience_number}</td>
								</tr>
							</c:forEach>
							<tr>
							</tr>
						</table>

						<div style="height: 30px;"></div>
						<p>
							<span style="margin-left: 640px; margin-top: 50px;"
								onclick="location.href='/main/post/'"> 댓글 ${replycount}개</span>
						<table
							style="margin-left: 70px; width: 80%; border-top: 1px solid #444444; border-collapse: collapse;">
							<c:choose>
								<c:when test="${replyList.getReplyList().size()!=0}">
									<c:forEach var="i" begin="0"
										end="${replyList.getReplyList().size()-1}">

										<tr>
											<td style="border-bottom: 1px solid #444444; padding: 10px;"><b>${replyList.getReplyList().get(i).email}</b></td>
											<td style="border-bottom: 1px solid #444444; padding: 10px;"><b>${replyList.getReplyList().get(i).content}</b></td>
											<td style="border-bottom: 1px solid #444444; padding: 10px;"><b><fmt:formatDate
														value="${replyList.getReplyList().get(i).reg_date}"
														pattern="yyyy-MM-dd" /></b></td>
										</tr>
									</c:forEach>
								</c:when>
							</c:choose>
							<tr>
								<td colspan="2" style="margin-top: 10px;"><input
									type="text" name="content"
									style="width: 450px; height: 50px; margin-left: 40px; margin-top: 20px;">
								</td>
								<td><input type="submit" value="댓글등록"></td>
							</tr>

						</table>
					</div>
				</form>
			</c:when>
		</c:choose>
	</main>
</body>
</html>