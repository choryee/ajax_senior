2023.01.16
https://www.youtube.com/watch?v=w2ULuAO7NUY&list=PLEOnZ6GeucBWCR_eYjmKuFykGAQylAl9M&index=7
웹개발 05 - 속성 jQuery 한방에 정리하기 (2/2)
seniorcoding의 게시판 버튼 누르면, 새로운 버튼이 만들어지면서 하는 것.

환경
-스프링부트, JPA,  maven, java 17 SDK, tomcat 10
- spring framework+mybatis로 이거 만들려고 하다, 계속 몇주간 오류나서 이건 포기함.

접속
http://localhost:8080/getBoardList

testboard.jsp
-Bootstrap 강의부분. JQuery 2_2, 09'53

intellij 스프링부트 maven 프로젝트 생성
https://imksh.com/98

- 타임리프을 쓸거면, 미리 생성시 넣어줘라


userrepository,controller등 인식못할때. AjaxApplication.java
@SpringBootApplication(scanBasePackages = {"com.example.ajax.repository", "com.example.ajax.controller",
"com.example.ajax.dto"})
https://dkswngus7.tistory.com/19

.jsp인식 못 할때,
https://stackoverflow.com/questions/8021370/java-lang-noclassdeffounderror-javax-servlet-jsp-tagext-taglibraryvalidator
https://stackoverflow.com/questions/4928271/how-to-install-jstl-the-absolute-uri-http-java-sun-com-jstl-core-cannot-be-r
Tomcat10인 경우, 그 부분을 pom.xml와 jar를 톰캣10/lib안에 넣어라.

.jsp오류 참고
https://wikim.tistory.com/52

DB에 테이블 생성될때 그 '테이블명'은 model/User33처럼 그 클래스 이름이 '테이블명'이 된다.

30'53 브라우저의 콘솔창에서 코드로 작업하는 거 보여줌.
55'16- refactoring강의, 공통된 ajax부분 refactoring 함.
01;09'52 - 막 새글 올린 것은 삭제버튼 작용 안 해서, 최종 수정함.
01;10'15 - 전부 정리 해줌