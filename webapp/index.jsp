<%@ page language="java" contentType="text/html; UTF=8" pageEncoding="utf-8" %>

<!doctype html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Umstagram</title>
    <link rel="stylesheet" href="css/style.css?after">
    <link rel="icon" href="images/favicon.jpg" type="image/x-icon">
    <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/8.0.0/firebase-firestore.js"></script>

</head>
<body>
<header>
    <div class="logo">
        <svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="slogo">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M12 18C15.3137 18 18 15.3137 18 12C18 8.68629 15.3137 6 12 6C8.68629 6 6 8.68629 6 12C6 15.3137 8.68629 18 12 18ZM12 16C14.2091 16 16 14.2091 16 12C16 9.79086 14.2091 8 12 8C9.79086 8 8 9.79086 8 12C8 14.2091 9.79086 16 12 16Z" fill="#0F0F0F"/>
            <path d="M18 5C17.4477 5 17 5.44772 17 6C17 6.55228 17.4477 7 18 7C18.5523 7 19 6.55228 19 6C19 5.44772 18.5523 5 18 5Z" fill="#0F0F0F"/>
            <path fill-rule="evenodd" clip-rule="evenodd" d="M1.65396 4.27606C1 5.55953 1 7.23969 1 10.6V13.4C1 16.7603 1 18.4405 1.65396 19.7239C2.2292 20.8529 3.14708 21.7708 4.27606 22.346C5.55953 23 7.23969 23 10.6 23H13.4C16.7603 23 18.4405 23 19.7239 22.346C20.8529 21.7708 21.7708 20.8529 22.346 19.7239C23 18.4405 23 16.7603 23 13.4V10.6C23 7.23969 23 5.55953 22.346 4.27606C21.7708 3.14708 20.8529 2.2292 19.7239 1.65396C18.4405 1 16.7603 1 13.4 1H10.6C7.23969 1 5.55953 1 4.27606 1.65396C3.14708 2.2292 2.2292 3.14708 1.65396 4.27606ZM13.4 3H10.6C8.88684 3 7.72225 3.00156 6.82208 3.0751C5.94524 3.14674 5.49684 3.27659 5.18404 3.43597C4.43139 3.81947 3.81947 4.43139 3.43597 5.18404C3.27659 5.49684 3.14674 5.94524 3.0751 6.82208C3.00156 7.72225 3 8.88684 3 10.6V13.4C3 15.1132 3.00156 16.2777 3.0751 17.1779C3.14674 18.0548 3.27659 18.5032 3.43597 18.816C3.81947 19.5686 4.43139 20.1805 5.18404 20.564C5.49684 20.7234 5.94524 20.8533 6.82208 20.9249C7.72225 20.9984 8.88684 21 10.6 21H13.4C15.1132 21 16.2777 20.9984 17.1779 20.9249C18.0548 20.8533 18.5032 20.7234 18.816 20.564C19.5686 20.1805 20.1805 19.5686 20.564 18.816C20.7234 18.5032 20.8533 18.0548 20.9249 17.1779C20.9984 16.2777 21 15.1132 21 13.4V10.6C21 8.88684 20.9984 7.72225 20.9249 6.82208C20.8533 5.94524 20.7234 5.49684 20.564 5.18404C20.1805 4.43139 19.5686 3.81947 18.816 3.43597C18.5032 3.27659 18.0548 3.14674 17.1779 3.0751C16.2777 3.00156 15.1132 3 13.4 3Z" fill="#0F0F0F"/>
        </svg>
        <img src="images/umstagram.png" alt="" style="width: 120px">
    </div>

    <div class="home nav">
        <div class="icon"><svg width="30px" height="30px" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path fill="#000000" d="M512 128 128 447.936V896h255.936V640H640v256h255.936V447.936z"/></svg></div>
        <div class="txt">홈</div>
    </div>

    <div class="search nav">
        <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 48 48">
            <path d="M 20.5 6 C 12.509634 6 6 12.50964 6 20.5 C 6 28.49036 12.509634 35 20.5 35 C 23.956359 35 27.133709 33.779044 29.628906 31.75 L 39.439453 41.560547 A 1.50015 1.50015 0 1 0 41.560547 39.439453 L 31.75 29.628906 C 33.779044 27.133709 35 23.956357 35 20.5 C 35 12.50964 28.490366 6 20.5 6 z M 20.5 9 C 26.869047 9 32 14.130957 32 20.5 C 32 23.602612 30.776198 26.405717 28.791016 28.470703 A 1.50015 1.50015 0 0 0 28.470703 28.791016 C 26.405717 30.776199 23.602614 32 20.5 32 C 14.130953 32 9 26.869043 9 20.5 C 9 14.130957 14.130953 9 20.5 9 z"></path>
        </svg></div>
        <div class="txt">검색</div>
    </div>

    <div class="research nav" >
        <div class="icon"><svg fill="#000000" width="30px" height="30px" viewBox="0 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg">
            <path d="M22.912 8.758l-9.786 4.207c-0.177 0.090-0.32 0.233-0.411 0.411l-4.483 9.038c-0.184 0.36-0.117 0.798 0.166 1.087 0.181 0.184 0.426 0.282 0.673 0.282 0.139 0 0.279-0.030 0.41-0.094l9.554-3.968c0.175-0.084 0.32-0.221 0.413-0.391l4.715-9.278c0.201-0.363 0.141-0.813-0.145-1.111-0.288-0.298-0.737-0.371-1.105-0.184zM11.183 20.776l2.719-5.553 2.746 3.437zM18.272 17.488l-2.775-3.473 5.525-2.18zM16 0c-8.836 0-16 7.163-16 16s7.163 16 16 16c8.837 0 16-7.163 16-16s-7.163-16-16-16zM16 30.032c-7.72 0-14-6.312-14-14.032s6.28-14 14-14 14 6.28 14 14-6.28 14.032-14 14.032z"></path>
        </svg></div>
        <div class="txt">탐색 탭</div>
    </div>

    <div class="reels nav">
        <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 50 50">
            <path d="M 15 4 C 8.9365932 4 4 8.9365932 4 15 L 4 35 C 4 41.063407 8.9365932 46 15 46 L 35 46 C 41.063407 46 46 41.063407 46 35 L 46 15 C 46 8.9365932 41.063407 4 35 4 L 15 4 z M 16.740234 6 L 27.425781 6 L 33.259766 16 L 22.574219 16 L 16.740234 6 z M 29.740234 6 L 35 6 C 39.982593 6 44 10.017407 44 15 L 44 16 L 35.574219 16 L 29.740234 6 z M 14.486328 6.1035156 L 20.259766 16 L 6 16 L 6 15 C 6 10.199833 9.7581921 6.3829803 14.486328 6.1035156 z M 6 18 L 44 18 L 44 35 C 44 39.982593 39.982593 44 35 44 L 15 44 C 10.017407 44 6 39.982593 6 35 L 6 18 z M 21.978516 23.013672 C 20.435152 23.049868 19 24.269284 19 25.957031 L 19 35.041016 C 19 37.291345 21.552344 38.713255 23.509766 37.597656 L 31.498047 33.056641 C 33.442844 31.951609 33.442844 29.044485 31.498047 27.939453 L 23.509766 23.398438 L 23.507812 23.398438 C 23.018445 23.120603 22.49297 23.001607 21.978516 23.013672 z M 21.982422 24.986328 C 22.158626 24.988232 22.342399 25.035052 22.521484 25.136719 L 30.511719 29.677734 C 31.220922 30.080703 31.220922 30.915391 30.511719 31.318359 L 22.519531 35.859375 C 21.802953 36.267773 21 35.808686 21 35.041016 L 21 25.957031 C 21 25.573196 21.201402 25.267385 21.492188 25.107422 C 21.63758 25.02744 21.806217 24.984424 21.982422 24.986328 z"></path>
        </svg></div>
        <div class="txt">릴스</div>
    </div>

    <div class="message nav">
        <div class="icon"><svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M20.33 3.66996C20.1408 3.48213 19.9035 3.35008 19.6442 3.28833C19.3849 3.22659 19.1135 3.23753 18.86 3.31996L4.23 8.19996C3.95867 8.28593 3.71891 8.45039 3.54099 8.67255C3.36307 8.89471 3.25498 9.16462 3.23037 9.44818C3.20576 9.73174 3.26573 10.0162 3.40271 10.2657C3.5397 10.5152 3.74754 10.7185 4 10.85L10.07 13.85L13.07 19.94C13.1906 20.1783 13.3751 20.3785 13.6029 20.518C13.8307 20.6575 14.0929 20.7309 14.36 20.73H14.46C14.7461 20.7089 15.0192 20.6023 15.2439 20.4239C15.4686 20.2456 15.6345 20.0038 15.72 19.73L20.67 5.13996C20.7584 4.88789 20.7734 4.6159 20.7132 4.35565C20.653 4.09541 20.5201 3.85762 20.33 3.66996ZM4.85 9.57996L17.62 5.31996L10.53 12.41L4.85 9.57996ZM14.43 19.15L11.59 13.47L18.68 6.37996L14.43 19.15Z" fill="#000000"/>
        </svg></div>
        <div class="txt">메시지</div>
    </div>

    <div class="alarm nav">
        <div class="icon"><svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path fill-rule="evenodd" clip-rule="evenodd" d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
        </svg></div>
        <div class="txt">알림</div>
    </div>

    <div class="make nav">
        <div class="icon"><svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
            <path d="M9 12H15" stroke="#323232" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M12 9L12 15" stroke="#323232" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            <path d="M3 12C3 4.5885 4.5885 3 12 3C19.4115 3 21 4.5885 21 12C21 19.4115 19.4115 21 12 21C4.5885 21 3 19.4115 3 12Z" stroke="#323232" stroke-width="2"/>
        </svg></div>
        <div class="txt">만들기</div>
    </div>

    <div class="profile nav">
        <div class="icon"><img src="images/logo.png" alt="" class="myprofileicon"></div>
        <div class="txt">프로필</div>
    </div>

    <div class="profile nav" style="position: absolute; bottom: 0" onclick="window.location='login.html'">
        <div class="icon"><svg fill="#000000" height="20px" width="20px" version="1.1" id="Capa_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                               viewBox="0 0 384.971 384.971" xml:space="preserve">
<g>
    <g id="Sign_Out">
        <path d="M180.455,360.91H24.061V24.061h156.394c6.641,0,12.03-5.39,12.03-12.03s-5.39-12.03-12.03-12.03H12.03
			C5.39,0.001,0,5.39,0,12.031V372.94c0,6.641,5.39,12.03,12.03,12.03h168.424c6.641,0,12.03-5.39,12.03-12.03
			C192.485,366.299,187.095,360.91,180.455,360.91z"/>
        <path d="M381.481,184.088l-83.009-84.2c-4.704-4.752-12.319-4.74-17.011,0c-4.704,4.74-4.704,12.439,0,17.179l62.558,63.46H96.279
			c-6.641,0-12.03,5.438-12.03,12.151c0,6.713,5.39,12.151,12.03,12.151h247.74l-62.558,63.46c-4.704,4.752-4.704,12.439,0,17.179
			c4.704,4.752,12.319,4.752,17.011,0l82.997-84.2C386.113,196.588,386.161,188.756,381.481,184.088z"/>
    </g>
    <g>
    </g>
    <g>
    </g>
    <g>
    </g>
    <g>
    </g>
    <g>
    </g>
    <g>
    </g>
</g>
</svg></div>
        <div class="txt">로그아웃</div>
    </div>


</header>

<div class="main">
<div class="body">
    <div class="stories">
        <div class="story">
            <img src="images/ring.png" alt="" class="ring">
            <div class="icon"><img src="images/logo.png" alt=""></div>
            <div class="id">uno_coffee</div>
        </div>
        <div class="story">
            <img src="images/ring.png" alt="" class="ring">
            <div class="icon"><img src="images/uno.PNG" alt=""></div>
            <div class="id">yuno35877</div>
        </div>
        <div class="story">
            <img src="images/ring.png" alt="" class="ring">
            <div class="icon"><img src="images/ch.PNG" alt=""></div>
            <div class="id" >chan_hyu...</div>
        </div>
        <div class="story">
            <img src="images/ring.png" alt="" class="ring">
            <div class="icon"><img src="images/vain.PNG" alt=""></div>
            <div class="id">vayne</div>
        </div>
        <div class="story">
            <img src="images/ring.png" alt="" class="ring">
            <div class="icon"><img src="images/uno2.PNG" alt=""></div>
            <div class="id">unouno</div>
        </div>
        <div class="story">
            <div class="icon"><img src="images/sm.PNG" alt=""></div>
            <div class="id">yun0_531</div>
        </div>
        <div class="story">
            <div class="icon"><img src="images/bs.PNG" alt=""></div>
            <div class="id">dbjunb_</div>
        </div>
        <div class="story">
            <div class="icon"><img src="images/sss.png" alt=""></div>
            <div class="id">sebuung_e</div>
        </div>
    </div>

    <div class="posts">
        <div class="post">
            <div class="postHeader">
                <div class="headerWrap">
                    <div class="icon"><img src="images/logo.png" alt="" style="width:30px; border-radius: 100px; margin-right: 5px;"></div>
                    <div class="id" style="font-size: 14px; font-weight: bold">uno_coffee</div>
                    <div class="dot" style="color: #8a8a8a">•</div>
                    <div class="time" style="color: #9a9a9a; font-size: 14px">10시간</div>
                </div>

                <div class="more">•••</div>
            </div>
            <div class="postPic">
                <button class="nav-button prev" onclick="moveSlide(-1)">&#9664;</button>
                <div class="picSlide">
                    <div class="insert"><%@ include file="db_insert.jsp" %></div>
                    <div class="sale"><%@include file="db_select_sale.jsp"%></div>
                    <div class="product"><%@ include file="db_select_product.jsp" %></div>
                    <div class="shop"><%@ include file="db_select_shop.jsp" %></div>
                </div>
                <button class="nav-button next" onclick="moveSlide(1)">&#9654;</button>
            </div>

            <div class="action">
                <div class="actionWrap">
                    <div class="like"><svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg></div>
                    <div class="chat"><img src="images/chat.png" alt="" style="width: 20px"></div>
                    <div class="share"><svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M20.33 3.66996C20.1408 3.48213 19.9035 3.35008 19.6442 3.28833C19.3849 3.22659 19.1135 3.23753 18.86 3.31996L4.23 8.19996C3.95867 8.28593 3.71891 8.45039 3.54099 8.67255C3.36307 8.89471 3.25498 9.16462 3.23037 9.44818C3.20576 9.73174 3.26573 10.0162 3.40271 10.2657C3.5397 10.5152 3.74754 10.7185 4 10.85L10.07 13.85L13.07 19.94C13.1906 20.1783 13.3751 20.3785 13.6029 20.518C13.8307 20.6575 14.0929 20.7309 14.36 20.73H14.46C14.7461 20.7089 15.0192 20.6023 15.2439 20.4239C15.4686 20.2456 15.6345 20.0038 15.72 19.73L20.67 5.13996C20.7584 4.88789 20.7734 4.6159 20.7132 4.35565C20.653 4.09541 20.5201 3.85762 20.33 3.66996ZM4.85 9.57996L17.62 5.31996L10.53 12.41L4.85 9.57996ZM14.43 19.15L11.59 13.47L18.68 6.37996L14.43 19.15Z" fill="#000000"/>
                    </svg></div>
                </div>

                <div class="bookmark"></div>
            </div>

            <div class="likesCount" style="margin-bottom: 8px">
                <div class="txt" style="font-size: 14px; font-weight: bold">좋아요 30615개</div>
            </div>

            <div class="writerComment" style="font-size: 14px">
                <span class="id" style="font-weight: bold">uno_coffee</span>
                <span style="color: #0064e0">#우노커피</span><span class="change"> 판매 등록입니다.</span> <br>
            </div>

            <div class="allChat" style="color: rgba(115,115,115,.85); font-size: 14px; margin: 6px 0; cursor: pointer">
                댓글 510개 모두 보기
            </div>

            <div class="topChats">

            </div>

            <div class="chatWrap" style="display: flex; justify-content: space-between; margin: 5px 0">
                <input type="text" class="sendChat" placeholder="댓글 달기..."  style=" font-size: 14px; border: none; outline: none">
                <svg width="15px" height="15px" viewBox="-3 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                    <g id="icomoon-ignore">
                    </g>
                    <path d="M12.8 3.2c-7.093 0-12.8 5.707-12.8 12.8s5.707 12.8 12.8 12.8c7.093 0 12.8-5.707 12.8-12.8s-5.707-12.8-12.8-12.8zM12.8 27.733c-6.453 0-11.733-5.28-11.733-11.733s5.28-11.733 11.733-11.733c6.453 0 11.733 5.28 11.733 11.733s-5.28 11.733-11.733 11.733z" fill="#000000">

                    </path>
                    <path d="M19.467 19.040c-0.267-0.107-0.587-0.053-0.693 0.213-1.173 2.293-3.467 3.68-5.973 3.68-2.56 0-4.8-1.387-5.973-3.68-0.107-0.267-0.427-0.373-0.693-0.213-0.267 0.107-0.373 0.427-0.267 0.693 1.333 2.613 3.947 4.267 6.933 4.267 2.933 0 5.6-1.653 6.88-4.267 0.16-0.267 0.053-0.587-0.213-0.693z" fill="#000000">

                    </path>
                    <path d="M10.133 13.333c0 0.884-0.716 1.6-1.6 1.6s-1.6-0.716-1.6-1.6c0-0.884 0.716-1.6 1.6-1.6s1.6 0.716 1.6 1.6z" fill="#000000">

                    </path>
                    <path d="M18.667 13.333c0 0.884-0.716 1.6-1.6 1.6s-1.6-0.716-1.6-1.6c0-0.884 0.716-1.6 1.6-1.6s1.6 0.716 1.6 1.6z" fill="#000000">

                    </path>
                </svg>
            </div>
            <div class="line" style="border-bottom: solid 1px lightgray; margin-top: 20px"></div>
        </div>
        <div class="scroll" style="height: 10px"></div>
    </div>
    </div>


    <div class="mheader">
        <div class="">
            <div class="icon"><svg width="30px" height="30px" viewBox="0 0 1024 1024" xmlns="http://www.w3.org/2000/svg"><path fill="#000000" d="M512 128 128 447.936V896h255.936V640H640v256h255.936V447.936z"/></svg></div>
        </div>

        <div class="">
            <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 48 48">
                <path d="M 20.5 6 C 12.509634 6 6 12.50964 6 20.5 C 6 28.49036 12.509634 35 20.5 35 C 23.956359 35 27.133709 33.779044 29.628906 31.75 L 39.439453 41.560547 A 1.50015 1.50015 0 1 0 41.560547 39.439453 L 31.75 29.628906 C 33.779044 27.133709 35 23.956357 35 20.5 C 35 12.50964 28.490366 6 20.5 6 z M 20.5 9 C 26.869047 9 32 14.130957 32 20.5 C 32 23.602612 30.776198 26.405717 28.791016 28.470703 A 1.50015 1.50015 0 0 0 28.470703 28.791016 C 26.405717 30.776199 23.602614 32 20.5 32 C 14.130953 32 9 26.869043 9 20.5 C 9 14.130957 14.130953 9 20.5 9 z"></path>
            </svg></div>
        </div>

        <div class="" >
            <div class="icon"><svg fill="#000000" width="30px" height="30px" viewBox="0 0 32 32" version="1.1" xmlns="http://www.w3.org/2000/svg">
                <path d="M22.912 8.758l-9.786 4.207c-0.177 0.090-0.32 0.233-0.411 0.411l-4.483 9.038c-0.184 0.36-0.117 0.798 0.166 1.087 0.181 0.184 0.426 0.282 0.673 0.282 0.139 0 0.279-0.030 0.41-0.094l9.554-3.968c0.175-0.084 0.32-0.221 0.413-0.391l4.715-9.278c0.201-0.363 0.141-0.813-0.145-1.111-0.288-0.298-0.737-0.371-1.105-0.184zM11.183 20.776l2.719-5.553 2.746 3.437zM18.272 17.488l-2.775-3.473 5.525-2.18zM16 0c-8.836 0-16 7.163-16 16s7.163 16 16 16c8.837 0 16-7.163 16-16s-7.163-16-16-16zM16 30.032c-7.72 0-14-6.312-14-14.032s6.28-14 14-14 14 6.28 14 14-6.28 14.032-14 14.032z"></path>
            </svg></div>
        </div>

        <div class="">
            <div class="icon"><svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0 0 50 50">
                <path d="M 15 4 C 8.9365932 4 4 8.9365932 4 15 L 4 35 C 4 41.063407 8.9365932 46 15 46 L 35 46 C 41.063407 46 46 41.063407 46 35 L 46 15 C 46 8.9365932 41.063407 4 35 4 L 15 4 z M 16.740234 6 L 27.425781 6 L 33.259766 16 L 22.574219 16 L 16.740234 6 z M 29.740234 6 L 35 6 C 39.982593 6 44 10.017407 44 15 L 44 16 L 35.574219 16 L 29.740234 6 z M 14.486328 6.1035156 L 20.259766 16 L 6 16 L 6 15 C 6 10.199833 9.7581921 6.3829803 14.486328 6.1035156 z M 6 18 L 44 18 L 44 35 C 44 39.982593 39.982593 44 35 44 L 15 44 C 10.017407 44 6 39.982593 6 35 L 6 18 z M 21.978516 23.013672 C 20.435152 23.049868 19 24.269284 19 25.957031 L 19 35.041016 C 19 37.291345 21.552344 38.713255 23.509766 37.597656 L 31.498047 33.056641 C 33.442844 31.951609 33.442844 29.044485 31.498047 27.939453 L 23.509766 23.398438 L 23.507812 23.398438 C 23.018445 23.120603 22.49297 23.001607 21.978516 23.013672 z M 21.982422 24.986328 C 22.158626 24.988232 22.342399 25.035052 22.521484 25.136719 L 30.511719 29.677734 C 31.220922 30.080703 31.220922 30.915391 30.511719 31.318359 L 22.519531 35.859375 C 21.802953 36.267773 21 35.808686 21 35.041016 L 21 25.957031 C 21 25.573196 21.201402 25.267385 21.492188 25.107422 C 21.63758 25.02744 21.806217 24.984424 21.982422 24.986328 z"></path>
            </svg></div>
        </div>

        <div class="">
            <div class="icon"><svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M20.33 3.66996C20.1408 3.48213 19.9035 3.35008 19.6442 3.28833C19.3849 3.22659 19.1135 3.23753 18.86 3.31996L4.23 8.19996C3.95867 8.28593 3.71891 8.45039 3.54099 8.67255C3.36307 8.89471 3.25498 9.16462 3.23037 9.44818C3.20576 9.73174 3.26573 10.0162 3.40271 10.2657C3.5397 10.5152 3.74754 10.7185 4 10.85L10.07 13.85L13.07 19.94C13.1906 20.1783 13.3751 20.3785 13.6029 20.518C13.8307 20.6575 14.0929 20.7309 14.36 20.73H14.46C14.7461 20.7089 15.0192 20.6023 15.2439 20.4239C15.4686 20.2456 15.6345 20.0038 15.72 19.73L20.67 5.13996C20.7584 4.88789 20.7734 4.6159 20.7132 4.35565C20.653 4.09541 20.5201 3.85762 20.33 3.66996ZM4.85 9.57996L17.62 5.31996L10.53 12.41L4.85 9.57996ZM14.43 19.15L11.59 13.47L18.68 6.37996L14.43 19.15Z" fill="#000000"/>
            </svg></div>
        </div>

        <div class="">
            <div class="icon"><svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
            </svg></div>
        </div>

        <div class="">
            <div class="icon"><svg width="30px" height="30px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" >
                <path d="M9 12H15" stroke="#323232" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M12 9L12 15" stroke="#323232" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                <path d="M3 12C3 4.5885 4.5885 3 12 3C19.4115 3 21 4.5885 21 12C21 19.4115 19.4115 21 12 21C4.5885 21 3 19.4115 3 12Z" stroke="#323232" stroke-width="2"/>
            </svg></div>
        </div>

        <div class="">
            <div class="icon"><img src="images/logo.png" alt="" class="myprofileicon" style="width: 30px; height: 30px; border-radius: 100px"></div>
        </div>
    </div>
</div>
</body>
</html>
<script>

    const firebaseConfig = {
        apiKey: "AIzaSyB1fq1idRid0tALckasn45bcLLXO5OLeH4",
        authDomain: "umstagram-d60cc.firebaseapp.com",
        projectId: "umstagram-d60cc",
        storageBucket: "umstagram-d60cc.appspot.com",
        messagingSenderId: "370794491709",
        appId: "1:370794491709:web:b995461f9dc188a99f5f54",
        measurementId: "G-X4TNX7NBZ8"
    };

    // Firebase 초기화
    firebase.initializeApp(firebaseConfig);
    var db = firebase.firestore();

    // 메시지를 HTML에 추가하는 함수
    function addMessageToChat(data) {
        console.log(`Adding message from ${data.username}: ${data.message}`); // 매개변수 로그 출력
        const chatContainer = document.querySelector('.topChats');
        const chatMessage = `
        <div id="chat" style="margin-bottom: 3px">
            <div class="chatWrap" style="font-size: 14px">
                <span class="id" style="font-weight: bold">`+data.username+`</span>`+
                data.message+`
            </div>
                <div class="likeBtn">
                    <svg class="likeBtnsvg" width="15px" height="15px" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M12 6.00019C10.2006 3.90317 7.19377 3.2551 4.93923 5.17534C2.68468 7.09558 2.36727 10.3061 4.13778 12.5772C5.60984 14.4654 10.0648 18.4479 11.5249 19.7369C11.6882 19.8811 11.7699 19.9532 11.8652 19.9815C11.9483 20.0062 12.0393 20.0062 12.1225 19.9815C12.2178 19.9532 12.2994 19.8811 12.4628 19.7369C13.9229 18.4479 18.3778 14.4654 19.8499 12.5772C21.6204 10.3061 21.3417 7.07538 19.0484 5.17534C16.7551 3.2753 13.7994 3.90317 12 6.00019Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </div>
        </div>`;
        chatContainer.innerHTML += chatMessage;
    }

    db.collection("chats").orderBy("timestamp")
        .onSnapshot(snapshot => {
            snapshot.docChanges().forEach(change => {
                if (change.type === "added") {
                    var data = change.doc.data();
                    addMessageToChat(data); // 함수 호출
                    console.log(data)
                }
            });
        });



    // 채팅 메시지 보내기
    function sendMessage(username, message) {
        db.collection("chats").add({
            username: username,
            message: message,
            timestamp: firebase.firestore.FieldValue.serverTimestamp()
        });
    }

    // 입력 필드에서 엔터키 이벤트 처리
    document.querySelector('.sendChat').addEventListener('keypress', function(e) {
        if (e.key === 'Enter' && !e.shiftKey) {
            const message = e.target.value.trim();
            if (message) {
                sendMessage("2._.been", message);
                e.target.value = '';
            }
            e.preventDefault();
        }
    });

    // 현재 슬라이드 인덱스
    let currentSlide = 0;

    // 슬라이드 수 가져오기
    const totalSlides = 4;

    // 슬라이드 이동 함수
    function moveSlide(direction) {
        // 새 인덱스 계산
        currentSlide += direction;
        if (currentSlide < 0) {
            currentSlide = 0;
        } else if (currentSlide >= totalSlides) {
            currentSlide = totalSlides - 1;
        }

        if(currentSlide==0){
            document.querySelector('.change').innerHTML = ' 판매 등록입니다.'
        } else if(currentSlide==1){
            document.querySelector('.change').innerHTML = ' 판매 현황입니다.'
        }else if(currentSlide==2){
            document.querySelector('.change').innerHTML = ' 상품별 판매 현황입니다.'
        }else if(currentSlide==3){
            document.querySelector('.change').innerHTML = ' 매장별 판매 현황입니다.'
        }

        // 슬라이드 이동
        const slideWidth = document.querySelector('.postPic').offsetWidth;
        const newTransform = "translateX(-" + (currentSlide * slideWidth) + "px)";
        document.querySelector('.picSlide').style.transform = newTransform;

    }

</script>
