<%--
  Created by IntelliJ IDEA.
  User: choijaeyong
  Date: 11/10/2018
  Time: 12:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.css">
    <script
            src="https://code.jquery.com/jquery-3.1.1.min.js"
            integrity="sha256-hVVnYaiADRTO2PzUGmuLJr8BLUSjGIZsDYGmIJLv2b8="
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.3.3/semantic.min.js"></script>


    <title>게시판 - 댓글 수정</title>
</head>
<body style="padding-top:40px">
<div class="ui container column grid">
    <div class="ui nine column centered floated">

    <form class="ui reply form" method="post" accept-charset="UTF-8" action="/board/comment/update">


        <c:if test="${requestScope.get('unvalidPassword')}">
            <div class="ui negative message">
                <i class="close icon"></i>
                <div class="header">
                    비밀번호가 맞지 않습니다.
                </div>
                <p>다시 시도해주세요.</p>
            </div>
        </c:if>

        <input type="hidden" name="commentid" value="${comment.commentid}"/>
        <input type="hidden" name="boardid" value="${comment.boardid}"/>
        <h4 class="ui header">댓글 수정하기</h4>
        <div class="fields">
            <div class="field">
                <input type="text" placeholder="닉네임" value="${comment.nickname}" name="nickname" required>
            </div>
            <div class="field">
                <input type="password" placeholder="비밀번호" name="password" required>
            </div>
        </div>

        <div class="field">
            <textarea name="content" placeholder="내용을 입력하세요." required>${comment.content}</textarea>
        </div>

        <div>
            <button type="submit" class="right floated ui primary button">
                <i class="icon edit"></i>
                수정 완료
            </button>
            <button type="button" onclick="window.location.href='/board/read?id='+${comment.boardid}" class="right floated ui button">
                취소
            </button>
        </div>
    </form>

    </div>
    </div>
</body>


<script>
    $('.message .close')
        .on('click', function() {
            $(this)
                .closest('.message')
                .transition('fade')
            ;
        })
    ;</script>


</html>
