<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="tour.Tour" %>
<%@ page import="tour.Tour_check" %>
<%@ page import="java.util.*" %>
<jsp:useBean id="tour_name" class="tour.Tour_check" scope="page"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>춘천 여행</title>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
  		<div class="container-fluid">
    		
    		<a class="navbar-brand" href="index.jsp">Home</a>
    		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
        	<div class="collapse navbar-collapse" id="navbarTogglerDemo03">
      			
        		<li class="nav-item">
          			<a class="nav-link" href="post.jsp">여행지 게시판</a>
        		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="map.jsp">일정 제작</a>
        		</li>
        		<li class="nav-item">
          			<a class="nav-link" href="mypage.jsp">MyPage</a>
        		</li>
     		</div>
     			<li class="nav-item">
     				<div class="col-12"><a class="btn btn-secondary" href="logout.jsp">로그아웃</a></div>
     			</li>
      		</ul>	
  		</div>
	</nav><br>
		<div class="row">
			<div class="col-sm-6">
				<div id="map" style="width:600px; height:400px; margin:0 auto;"></div><br><br>
				<div id="selected" style="width:600px; height: 300px; margin:0 auto;" class="form-control">
					<form method="post" action="map_process.jsp">
						<h6 class="text-center text-info">여행지</h6>
						<input type="text" class="form-control" style="height:20px;" name="num1" id="num1"/><br>
						<input type="text" class="form-control" style="height:20px;" name="num2" id="num2"/><br>
						<input type="text" class="form-control" style="height:20px;" name="num3" id="num3"/><br>
						<input type="text" class="form-control" style="height:20px;" name="num4" id="num4"/><br>
						<input type="text" class="form-control" style="height:20px;" name="num5" id="num5"/><br>
						<input type="reset" class="btn btn-primary" value="초기화" style="float:left;">&nbsp;&nbsp; 
						<input type="submit" class="btn btn-primary" value="등록" style="float:right">&nbsp;&nbsp;
						&nbsp;&nbsp;<input type="button" class="btn btn-primary" value="확인" style="float:right" onclick="show()">&nbsp;&nbsp; <!-- 여기부터 -->
						
				</div>
			</div>
			<div class="col-sm-6">
					<div style="width:600px; height:800px; margin:0 auto;">
						
						<fieldset><legend><h5 class="text-info">관광지</h5></legend>
						<div class="form-control" style=" overflow-y:scroll; width:500px; height:250px; margin:0 auto;">
							<%
								ArrayList<Tour> list1 = tour_name.getTourList();
								
								for(Tour tour1 : list1){
							%>		
									<label><%=tour1.getTourism()%>&nbsp;<input type="checkbox" id="tourism" name="<%=tour1.getTourism()%>" value="<%=tour1.getTourism()%>"  onclick=getCheckboxValue()></label>&nbsp;&nbsp;
							<%
								}
							%>
						</div>
						</fieldset><br>
						
						<fieldset><legend><h5 class="text-info">음식점</h5></legend>
						<div class="form-control" style=" overflow-y:scroll; width:500px; height:250px; margin:0 auto;">
							<%
								ArrayList<Tour> list2 = tour_name.getRestaurantList();
								
								for(Tour tour2 : list2){
							%>		
									<label><%=tour2.getRestaurant()%>&nbsp;<input type="checkbox" id="restaurant" name="<%=tour2.getRestaurant()%>" value="<%=tour2.getRestaurant()%>"  onclick=getCheckboxValue()></label>&nbsp;&nbsp;
							<%
								}
							%>
						</div>
						</fieldset><br>
						</form>	
					</div>
			</div>
		</div>		
</body>
</html>
<script>
	function getCheckboxValue(){
		var selected = document.querySelectorAll("#tourism:checked, #restaurant:checked");
		
		var result = [];
		
		var i=1;
		selected.forEach((el) => {
			var temp = ""; 
			temp += el.value;
			document.getElementById('num'+i).value = temp;
			temp = "";
			i++;
		});
	}
</script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=2c253b08d08769de56ed8091ee7fa204&libraries=services"></script>
<script>
	function show(){
	    num1 = document.getElementById("num1").value;
	    num2 = document.getElementById("num2").value;
	    num3 = document.getElementById("num3").value;
	    num4 = document.getElementById("num4").value;
	    num5 = document.getElementById("num5").value;
	 
	    printMap(num1);
	    printMap(num2);
	    printMap(num3);
	    printMap(num4);
	    printMap(num5);
	}
	
</script>
<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
                center: new kakao.maps.LatLng(37.88129, 127.73008), // 지도의 중심좌표
                level: 7 // 지도의 확대 레벨
            };   

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(); 

var markers = [];
// 키워드로 장소를 검색합니다
function printMap(num){
	ps.keywordSearch(num, placesSearchCB); 

// 키워드 검색 완료 시 호출되는 콜백함수 입니다
	function placesSearchCB (data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        var bounds = new kakao.maps.LatLngBounds();
	
	        for (var i=0; i<1; i++) {
	            displayMarker(data[0]);    
	            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
	        }       
	
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	        map.setBounds(bounds+5);
	    } 
	}

	// 지도에 마커를 표시하는 함수입니다
	function displayMarker(place) {
	    
	    // 마커를 생성하고 지도에 표시합니다
	    marker = new kakao.maps.Marker({
	        map: map,
	        position: new kakao.maps.LatLng(place.y, place.x) 
	    });
	
	    // 마커에 클릭이벤트를 등록합니다
	    kakao.maps.event.addListener(marker, 'click', function() {
	        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
	        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
	        infowindow.open(map, marker);
	    });
	}
}
function hideMarkers() {
    markers.setMap(null);
}
</script>