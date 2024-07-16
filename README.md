
  <img src="https://capsule-render.vercel.app/api?type=soft&color=gradient&color1=F3E5AB&color2=ADD8E6&height=150&section=header&text=welcome👋👋&fontSize=50&animation=twinkling" alt="Header">


## 프로젝트 소개

eTa는 택시 서비스의 기본 요금 인상으로 인해 부담을 느끼는 이용자들을 위해 개발된 서비스입니다. 택시는 많은 사람이 이용하는 교통수단이지만, 높은 요금 때문에 일부 사용자들은 대중교통이나 다른 대안을 찾게 됩니다. eTa는 이러한 문제를 해결하기 위해 기존 택시 시스템에 저렴한 요금으로 이용 가능도록 택시기사로 부터 요금을 직접 제시받는 딜 서비스, 모르는 사람과 함께 택시를 이용해 저렴하게 이용가능한 합석 서비스를 추가하여 만들었습니다.

<h3 align="left">프로젝트 발표</h3>
<p align="left">
<a href="https://www.youtube.com/watch?v=zSIsiJlZb5U" target="_blank">
  <img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/youtube.svg" alt="dev-kim" height="30" width="40" />
</a>

## <h3>포트폴리오</h3>

[eTa 포트폴리오](https://zrr.kr/yxPU)



## 주요 기능

- 택시 호출 및 예약 기능
- 실시간 위치 추적
- 요금 계산 및 결제 시스템
- 합석 시스템
- 딜 시스템
- 차종 및 반려동물 옵션
- 리뷰 및 평가 시스템

## 내가 개발한 시스템

- 회원관리 시스템
- 회원가입, 정보수정, 회원삭제, 비밀번호, 이메일 찾기 기능을 프론트엔드와 백엔드 모두 개발하였습니다. 
- 제가 맡은 회원관리 시스템에는 Kakao, Naver Login, PortOne, CoolSMS, SMPT를 사용하여 개발했습니다.
- Kakao, Naver Login은 Restful API를 사용하였습니다
- 전화번호 문자를 통해 본인인증을 하도록 CoolSMS API를 사용하였습니다.
- 예금주 확인을 위해 PortOne API를 사용하였습니다.
- 비밀번호 찾기를 위해서는 SMTP를 사용하여 이메일을 통해 비밀번호를 찾을 수 있게 하였습니다.

## 경험한 에러

- Cause: java.sql.SQLIntegrityConstraintViolationException → 무결성 제약조건
- 카카오톡 로그인 API적용 중 Jackson 라이브러리가 JSON 데이터를 Java 객체로 변환하는 과정에서 에러 발생 (com.fasterxml.jackson.databind.exc.UnrecognizedPropertyException:)
- JSON 데이터의 특정 필드가 Java 클래스에서 인식되지 않아 에러 발생 (ohttp://m.fasterxml.jackson.databind.exc.UnrecognizedPropertyException)
- 포트원 API JSON 문자열을 JsonNode 객체로 파싱

## 에러 해결 -> [정리 보기](https://als9045.tistory.com/entry/eTa-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8-%EC%A7%84%ED%96%89-%EC%A4%91-%EC%97%90%EB%9F%AC-%EB%AA%A8%EC%9D%8C)

- PL/SQL 블록 사용
- 화면에서 카카오로부터 응답받은 json 확인
- console에서 나온 json을 필드명 변경
- ObjectMapper의 readTree와 JsonNode사용

  
## 프로젝트 개발 중 고민

- 처음 적용해 보는 각각의 API
- 회원유무 확인을 위해  백엔드에서 Kakao, Naver Resful API 적용
- PortOne 예금주 API 사용 시 은행명 입력이 아닌 이미지 선택 시 은행코드 적용
- Naver Cloud SENS(Simple & Easy Notification Service) 서비스 중단

## 고민 해결

- UrlComponents, RestTemplate. HttpHeaders, MultiValueMap, ResponseEntity, ObjectMapper
  사용하여 Resful API 적용 -> [블로그 정리](https://zrr.kr/hgfl)
- 직접 이미지 삽입 후 이미지 클릭 시 코드 전달 되도록 개발 -> [블로그 정리](https://zrr.kr/93NG)
- 문자 인증을 위해 다른 API인 CoolSMS 적용 -> [블로그 정리](https://zrr.kr/Zotg)
  
## 기술 스택

- 프론트엔드: HTML, CSS, JavaScript, BootStrap, Chart js, JSP, JSTL, JQuery, Ajax, Json
- 백엔드: Java, SpringBoot, Tomcat, Open SSL, WebSocket, OAuth, SMTP, Mybatis
- 데이터베이스: MongoDB, Oracle, redis
- Tool & CI/CD : GitHub, docker, Maven, eclips, JUnit, SQLDeveloper, Jenkins
- 기타: Kakao Map API, Kakao login, Naver login, Portone, Coolsms, Kakao mobility, Naver Cloud
        Loda-Balencer, Server(Ubuntu20), Nacl, Global DNS, CDN+, SUbnet, Auto Scaling, Naver Sense
  


