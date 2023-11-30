<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
	<script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=843ae0fd7d31559bce57a18dcd82bf62&libraries=services"></script>
	
	<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=843ae0fd7d31559bce57a18dcd82bf62"></script>
	         <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
	<script>
	async function loadMapData() {
	    const apiUrl = 'https://apis-navi.kakaomobility.com/v1/directions?origin=127.03515132405035,37.500518493640655&destination=127.02902706106634,37.49943894990428';
	    console.log("Generated URL:", apiUrl);  

	    try {
	        const response = await fetch(apiUrl, {
	            method: 'get',
	            headers: {
	                "Content-Type": "application/json",
	                "Authorization": "KakaoAK bb9f3068bf970e08b9d0147524d0258f"
	            }
	        });

	        if (!response.ok) {
	            throw new Error("Failed to fetch data");
	        }

	        const data = await response.json();
	        console.log(data);
	        drawPolylineAndMoveMarker(data, map);
	    } catch (error) {
	        console.error("Error fetching data:", error);
	    }
	}

	loadMapData();

    	const drawPolylineAndMoveMarker = (data,map) => {
   	    const linePath = [];
   	    data.routes[0].sections[0].roads.forEach(router => {
   	        router.vertexes.forEach((vertex, index) => {
   	           if (index % 2 === 0) {
   	               const lat = router.vertexes[index + 1];
   	               const lng = router.vertexes[index];
   	               linePath.push(new kakao.maps.LatLng(lat, lng));
   	          
   	           }
   	        });
   	    });

   	    var polyline = new kakao.maps.Polyline({
   	        path: linePath,
   	        strokeWeight: 5,
   	        strokeColor: '#000000',
   	        strokeOpacity: 0.7,
   	        strokeStyle: 'solid'
   	      }); 
   	      polyline.setMap(map);
   	      
   	// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�.
   	    let marker = new kakao.maps.Marker({
   	        map: map,
   	        position: linePath[0], // ���������� �������� ��Ŀ�� ��ġ�մϴ�.
   	    });
   	
   	// ��Ŀ�� �̵���ų �ε��� ������ �ʱ�ȭ�մϴ�.
   	    let index = 0;
   	
   	 // ���� �ð� �������� ��Ŀ�� �̵���Ű�� �Լ��Դϴ�.
   	    const moveMarker = () => {
   	        if (index < linePath.length) {
   	            // ���� �ε����� ��ǥ�� ��Ŀ�� �̵���ŵ�ϴ�.
   	            marker.setPosition(linePath[index]);
   	            map.setCenter(linePath[index]);
   	         sendLocationToServer(linePath[index]);
	            //////////////////////////////////////////////////////////��ġ������
  
   	            index++;
   	        } else {
   	            // ���������� ���� �����ߴٸ�, ���͹��� �ߴ��մϴ�.
   	            clearInterval(intervalId);
   	        }
   	    };

   	    // 1�ʸ��� ��Ŀ�� �̵���Ű�� ���� ���͹� ����
   	    const intervalId = setInterval(moveMarker, 500);
   	};
   	
   	
   	
   	var stompClient = null; // ���� ���������� stompClient �ʱ�ȭ
   	function sendLocationToServer(index) {
 	    if (stompClient && stompClient.connected) {
 	        const location = index;
 	        const locationData = { lat: location.getLat(), lng: location.getLng() };
 	        stompClient.send("/app/sendLocation", {}, JSON.stringify(locationData));
 	    } else {
 	        console.error("Websocket is not connected.");
 	    }
 	}
   	function connectWebSocket() {
 	    var socket = new SockJS('/ws'); // '/ws'�� ������ ������ ���� URL
 	    stompClient = Stomp.over(socket);

 	    stompClient.connect({}, function (frame) {
 	    		console.log('Connected: ' + frame);
 	    		// �߰� ���� ����
 	    		
 	    		socket.onclose = function () {
 	            console.log('WebSocket connection closed');
 	        	};
 			}, function (error) {
 	    		console.error('Websocket connection error: ', error);
 			
 			});
 	}
	connectWebSocket();
	</script>
</head>
<body>
	<div class="col-md-6">
    	<div id="map" style="width:100%;height:710px;"></div>
    </div>
    

    
    
    
    
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=843ae0fd7d31559bce57a18dcd82bf62&libraries=services"></script>
          <script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=843ae0fd7d31559bce57a18dcd82bf62"></script>
    <script>
    var mapContainer = document.getElementById('map'), // ������ ǥ���� div 
    mapOption = { 
        center: new kakao.maps.LatLng(37.4939072071976, 127.0143838311636), // ������ �߽���ǥ
        level: 3 // ������ Ȯ�� ����
    };

var map = new kakao.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
    </script>
</body>
</html>