<%--
  Created by IntelliJ IDEA.
  User: SuanCaiyu
  Date: 2019-10-02
  Time: 19:23
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!-->

<!--[if lt IE 7]> <html class="no-js lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]>    <html class="no-js lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]>    <html class="no-js lt-ie9" lang="en"> <![endif]-->
<!-- Consider adding a manifest.appcache: h5bp.com/d/Offline -->
<!--[if gt IE 8]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>
	<meta charset="utf-8" />

	<title>MyPetstore</title>
	<meta name="description" content="" />

	<meta name="viewport" content="width=device-width" />


	<link rel="stylesheet" media="screen" href="css/superfish.css" />
	<link rel="stylesheet" href="css/nivo-slider.css" media="all" />
	<link rel="stylesheet" href="css/tweet.css" media="all" />
	<link rel="stylesheet" href="css/style.css" />
	<link rel="stylesheet" media="all" href="css/lessframework.css" />
	<link rel="stylesheet" href="css/modifier.css" />


	<!-- All JavaScript at the bottom, except this Modernizr build.
       Modernizr enables HTML5 elements & feature detects for optimal performance.
       Create your own custom Modernizr build: www.modernizr.com/download/ -->
	<script src="js/modernizr-2.5.3.min.js"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>

<body>

<!-- WRAPPER -->
<div class="wrapper cf">
	<header>

		<!-- social-bar -->
		<div id="social-bar-holder">
			<ul id="social-bar" class="cf">
				<li class="dribbble"><a href="addItemToCart?workingitemId=EST-8&removeCartItemId=EST-8" title="Dribbble"></a></li>
				<c:if test="${sessionScope.account == null}">
					<li class="googleplus"><a href="login" title="googleplus"></a></li>
				</c:if >
				<c:if test="${sessionScope.account != null}">
					<c:if test="${!sessionScope.account.getIslogin()}">
						<li class="googleplus"><a href="login" title="googleplus"></a></li>
					</c:if>
				</c:if>

				<c:if test="${sessionScope.account!= null}">
					<c:if test="${sessionScope.account.getIslogin()}">
						<li class="github"><a href="myAccount?username=${sessionScope.account.getUsername()}" title="github"></a></li>
						<li class="linkedin"><a href="login?isLogin=false" title="linkedin"></a></li>
					</c:if>
				</c:if>
				<li class="facebook"><a href="" title="Facebook"></a></li>
				<li class="twitter"><a href="" title="twitter"></a></li>
			</ul>

			<div id="section_search">
				<section class="navbar-section">
					<div class="input-group input-inline">
						<input class="form-input" type="text">
						<button class="btn btn-primary input-group-btn">Search</button>
						<ul id="nav" class="sf-menu">
							<li>
								<ul>
									<li><a href="page.html">Columns</a></li>
									<li><a href="page-typography.html">Typography</a></li>
									<li><a href="page-elements.html">Elements</a></li>
									<li><a href="page-sidebar.html">Sidebar Page</a></li>
								</ul>
							</li>
						</ul>
					</div>
				</section>
			</div>
		</div>
		<div class="cf"></div>
		<!-- ENDS social-bar -->

		<div id="logo" class="cf">
			<a href="main"><img src="img/logo.png" alt="" /></a>
		</div>

		<!-- nav -->
		<nav class="cf" id="naver">
			<ul id="nav" class="sf-menu">
				<li><a href="main"><span>home</span></a></li>
				<li><a href="viewcategory?categoryId=FISH"><span>fish</span></a></li>
				<li><a href="viewcategory?categoryId=DOGS"><span>dogs</span></a></li>
				<li><a href="viewcategory?categoryId=REPTILES"><span>reptiles</span></a></li>
				<li><a href="viewcategory?categoryId=CATS"><span>cats</span></a></li>
				<li><a href="viewcategory?categoryId=BIRDS"><span>birds</span></a></li>
			</ul>
			<div id="combo-holder"></div>
		</nav>
		<!-- ends nav -->

	</header>

	<div id="Content">
		<!-- MAIN -->
		<div role="main" id="main" class="cf">

			<div id="BackLink">
				<a href="main">Return to Main Menu</a>
			</div>
			<p></p>
			<div id="Cart-container">

				<div id="Cart">

					<h2>Shopping Cart</h2>

					<form action="updateCart" method="post">
						<ul class="menu">
							<table  class="table">
								<tr>
									<th><b>Item ID</b></th>
									<th><b>Product ID</b></th>
									<th><b>Description</b></th>
									<th><b>In Stock?</b></th>
									<th><b>Quantity</b></th>
									<th><b>List Price</b></th>
									<th><b>Total Cost</b></th>
									<th>&nbsp;</th>
								</tr>

								<c:if test="${sessionScope.cart.numberOfItems == 0}">
									<tr>
										<td colspan="8"><b>Your cart is empty.</b></td>
									</tr>
								</c:if>

								<c:forEach var="cartItem" items="${sessionScope.cart.cartItems}">
									<tr>
										<td>

											<a href="viewItem?itemId=${cartItem.item.itemId}">${cartItem.item.itemId}</a>
										</td>
										<td>${cartItem.item.product.productId}</td>
										<td>${cartItem.item.attribute1} ${cartItem.item.attribute2}
												${cartItem.item.attribute3} ${cartItem.item.attribute4}
												${cartItem.item.attribute5} ${cartItem.item.product.name}</td>
										<td>${cartItem.inStock}</td>
										<td>
											<input type="text" class="form-input" id="quantity" onblur="updateCart();" name="${cartItem.item.itemId}" value="${cartItem.quantity}">
											<div id="cartMsg"></div>
											<script type="text/javascript" src="javascript/updateCart.js"></script>
											<script type="text/javascript" src="${pageContext.request.contextPath }/javascript/updateCart.js"></script>
										</td>
										<td>

											<fmt:formatNumber value="${cartItem.item.listPrice}"
															  pattern="$#,##0.00" />
										</td>
										<td><fmt:formatNumber value="${cartItem.total}"
															  pattern="$#,##0.00" /></td>
										<td>

											<script>
												function insertParam(key, value){
													key = encodeURI(key); value = encodeURI(value);
													var kvp = document.location.search.substr(1).split('&');
													var i=kvp.length; var x; while(i--)
													{
														x = kvp[i].split('=');

														if (x[0]==key)
														{
															x[1] = value;
															kvp[i] = x.join('=');
															break;
														}
													}
													if(i<0) {kvp[kvp.length] = [key,value].join('=');}
													//this will reload the page, it's likely better to store this until finished
													document.location.search = kvp.join('&'); }
											</script>
												<%--					<button onclick="sessionScope.cart.removeItemById(cartItem.item.itemId)" value="Remove">Remove</button>--%>
											<a href="javascript:void(0);" onclick="insertParam('removeCartItemId','${cartItem.item.itemId}')"> Remove</a>

										</td>
									</tr>
								</c:forEach>
								<tr>
									<td colspan="7">
										Sub Total: <fmt:formatNumber
											value="${sessionScope.cart.subTotal}" pattern="$#,##0.00" />

										<%--				<input type="submit" value="Update Cart" />--%>
									</td>
									<td>&nbsp;</td>
								</tr>
							</table>
						</ul>
					</form>
					<c:if test="${sessionScope.cart.numberOfItems > 0}">
						<a href="newOrderForm" class="Button">Proceed to Checkout</a>
					</c:if>
				</div>

				<%--<div id="MyList">--%>
				<%--  <c:if test="${sessionScope.accountBean != null}">--%>
				<%--	<c:if test="${!sessionScope.accountBean.authenticated}">--%>
				<%--	  <c:if test="${!empty sessionScope.accountBean.account.listOption}">--%>
				<%--	    <%@ include file="IncludeMyList.jsp"%>--%>
				<%--      </c:if>--%>
				<%--	</c:if>--%>
				<%--  </c:if>--%>
				<%--</div>--%>

				<div id="Separator">&nbsp;</div>
			</div>

		</div>
		<!-- ENDS MAIN -->


		<%--		-----------------------------------------------------------%>
	</div>
	<footer>

		<!-- twitter -->
		<div id="twitter-holder">
			<div class="ribbon-left"></div>
			<div class="ribbon">
				<div id="tweets-bar" class="tweet"></div>
			</div>
			<div class="ribbon-right"></div>
		</div>
		<!-- ENDS twitter -->


		<!-- widgets -->
		<ul class="widget-cols cf">
			<li class="first-col">

				<div class="widget-block">
					<h4>RECENT POSTS</h4>
					<div class="recent-post cf">
						<a href="#" class="thumb"><img src="img/dummies/54x54b.gif" alt="Post" /></a>
						<div class="post-head">
							<a href="#">Suancaiyu1806</a><span>December 22, 2000</span>
						</div>
					</div>
					<div class="recent-post cf">
						<a href="#" class="thumb"><img src="img/dummies/54x54c.gif" alt="Post" /></a>
						<div class="post-head">
							<a href="#">Zhao Haoyang</a><span> March 12, 2000</span>
						</div>
					</div>
				</div>
			</li>

			<li class="second-col">

				<div class="widget-block">
					<h4>ABOUT</h4>
					<p>Vintage Template it's completely free this means you don't have to pay anything.</p>

					<p>Placeholder images by Dan Matutina</p>
					<p>Visit Template Creme and find the most beautiful free templates up to date.</p>
				</div>

			</li>

			<li class="third-col">

				<div class="widget-block">
					<h4>DUMMY TEXT</h4>
					<p>Give you the chance lightly to bear my joys and sorrows. et netus et malesuada fames ac
						turpis egestas.
						Vestibulum tortor quam, feugiat vitae, ultricies eget, tempor sit amet, ante. Donec eu
						libero sit amet quam egestas semper. Aenean ultricies mi vitae est. Mauris placerat eleifend
						leo. </p>
				</div>

			</li>

			<li class="fourth-col">

				<div class="widget-block">
					<h4>CATEGORIES</h4>
					<ul>
						<li class="cat-item"><a href="#">Design</a></li>
						<li class="cat-item"><a href="#">Photo</a></li>
						<li class="cat-item"><a href="#">Art</a></li>
						<li class="cat-item"><a href="#">Game</a></li>
						<li class="cat-item"><a href="#">Film</a></li>
						<li class="cat-item"><a href="#">TV</a></li>
					</ul>
				</div>

			</li>
		</ul>
		<!-- ENDS widgets -->

		<!-- bottom -->
		<div id="bottom">
			<div id="widget-trigger-holder"><a id="widget-trigger" href="#" title="View More" class="poshytip"></a>
			</div>
			<div id="content">&copy; Copyright &copy; 2020.CSU.</div>
		</div>
		<!-- ENDS bottom -->

	</footer>


</div>
<!-- ENDS WRAPPER -->

<!-- JavaScript at the bottom for fast page loading -->

<!-- Grab Google CDN's jQuery, with a protocol relative URL; fall back to local if offline -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="js/jquery-1.7.1.min.js"><\/script>')</script>

<!-- scripts concatenated and minified via build script -->
<script src="js/custom.js"></script>

<!-- superfish -->
<script src="js/superfish-1.4.8/js/hoverIntent.js"></script>
<script src="js/superfish-1.4.8/js/superfish.js"></script>
<script src="js/superfish-1.4.8/js/supersubs.js"></script>
<!-- ENDS superfish -->

<script src="js/tweet/jquery.tweet.js"></script>
<script src="js/jquery.isotope.min.js"></script>
<script src="js/jquery.nivo.slider.js"></script>
<script src="js/css3-mediaqueries.js"></script>
<script src="js/tabs.js"></script>
<script src="js/poshytip-1.1/src/jquery.poshytip.min.js"></script>
<script src="js/moveform.js"></script>
<!-- end scripts -->


</body>

</html>