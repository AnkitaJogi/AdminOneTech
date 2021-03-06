<%@ page language="java" session="false"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="bean.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.DAOFactory"%>
<%@page import="bean.User"%>
<%@page import="bean.Category"%>

<%!ArrayList<Product> proList;
	ArrayList<Category> allcategory;
	Product product;
	Category category;
	Iterator<Product> itr;
	Iterator<Category> itr_cat;%>
<%
	HttpSession session = request.getSession(false);
	if (session == null) {
		response.sendRedirect("login.jsp");
	} else {
		User user = (User) session.getAttribute("user");

		DAOFactory dao = DAOFactory.getDao();
		proList = dao.getAllProduct();
		allcategory = dao.getAllCategory();
		itr = proList.iterator();
		itr_cat = allcategory.iterator();
%>
<%
	Product product = (Product) request.getAttribute("product");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Product List | OneTech ERP</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!--STYLESHEET-->
<!--=================================================-->

<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="css/fee_bootstrap.min.css" rel="stylesheet">

<!--Bootstrap Table [ OPTIONAL ]-->
<link href="css/fee_bootstrap_table.min.css" rel="stylesheet">

<!--JAVASCRIPT-->
<!--=================================================-->

<!--jQuery [ REQUIRED ]-->
<script src="js/fee_jquery.min.js"></script>

<!--Bootstrap Table Sample [ SAMPLE ]-->
<script src="js/fee_tables_bs_table.js"></script>

<!--Bootstrap Table [ OPTIONAL ]-->
<script src="js/fee_bootstrap_table.min.js"></script>


<!--X-editable [ OPTIONAL ]-->
<script src="js/fee_bootstrap_editable.min.js"></script>


<!--=================================================

  
    <!-- Bootstrap 3.3.6 -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
<!-- Select2 -->
<link rel="stylesheet" href="plugins/select2/select2.min.css">
<!-- edit css -->
<link rel="stylesheet" href="css/fee_css.css">

<!-- Theme style -->
<link rel="stylesheet" href="css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet" href="css/skins/_all-skins.min.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<script type="text/javascript">
  
 	function deleteProduct()
	{
 		alert('delete button pressed');
		if(a.length>0){
		 		/* var product_id= []; */
		 		alert(a);
				document.location.href="product_delete.jsp?product_id="+a;
		}
		a=[];
		 //v = confirm("Are You sure you want to Delete product");
		//if(v)
		//	document.location.href="product_delete.jsp?product_id="+val; 
	}
 	function editProduct()
	{
 		//alert('get button pressed');
		if(a.length>0){
		 		//alert(a);
				//document.getElementById('myModal2'+a).click();
				document.location.href="#myModel2"+a;
		}
		a=[];
	} 
 	
 	
	
	 var a = [];  
	function addProduct(val)
	{
		v = confirm("Are You sure you want to Add Product id");
		var flag = true;
		console.log(val);
		if(a.length == 0){
			console.log('array is empty');
			a.push(val);
		}else{

			for(var i=0;i<a.length;i++){
				if(a[i] == val){
					a.splice(i,1);
					flag=false;
				}
			}if(flag){
			a.push(val);	
			}	
		}
		console.log(a);
		
		
		//if(v)
		//	document.location.href="editProduct.jsp?product_id="+val;
	}
	/* function getCheckedCheckboxesFor(checkboxName) {
		console.log(checkboxName);
	    var checkboxes = document.querySelectorAll('input[name="' + checkboxName + '"]:checked'), values = [];
	    Array.prototype.forEach.call(checkboxes, function(el) {
	        values.push(el.value);
	    });
	    return values;
	} */
	
	</script>

</head>
<body class="hold-transition skin-blue sidebar-mini">
	<div class="wrapper">

  <header class="main-header">

    <!-- Logo -->
    <a href="index.jsp" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Admin </b>Tech</span>
    </a>

    <!-- Header Navbar: style can be found in header.less -->
    <nav class="navbar navbar-static-top">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- Messages: style can be found in dropdown.less-->
          <li class="dropdown messages-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-envelope-o"></i>
              <span class="label label-success">4</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 4 messages</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- start message -->
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Support Team
                        <small><i class="fa fa-clock-o"></i> 5 mins</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <!-- end message -->
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        AdminLTE Design Team
                        <small><i class="fa fa-clock-o"></i> 2 hours</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Developers
                        <small><i class="fa fa-clock-o"></i> Today</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user3-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Sales Department
                        <small><i class="fa fa-clock-o"></i> Yesterday</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <div class="pull-left">
                        <img src="dist/img/user4-128x128.jpg" class="img-circle" alt="User Image">
                      </div>
                      <h4>
                        Reviewers
                        <small><i class="fa fa-clock-o"></i> 2 days</small>
                      </h4>
                      <p>Why not buy a new awesome theme?</p>
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">See All Messages</a></li>
            </ul>
          </li>
          <!-- Notifications: style can be found in dropdown.less -->
          <li class="dropdown notifications-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-bell-o"></i>
              <span class="label label-warning">10</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 10 notifications</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-aqua"></i> 5 new members joined today
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-warning text-yellow"></i> Very long description here that may not fit into the
                      page and may cause design problems
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-users text-red"></i> 5 new members joined
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-shopping-cart text-green"></i> 25 sales made
                    </a>
                  </li>
                  <li>
                    <a href="#">
                      <i class="fa fa-user text-red"></i> You changed your username
                    </a>
                  </li>
                </ul>
              </li>
              <li class="footer"><a href="#">View all</a></li>
            </ul>
          </li>
          <!-- Tasks: style can be found in dropdown.less -->
          <li class="dropdown tasks-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <i class="fa fa-flag-o"></i>
              <span class="label label-danger">9</span>
            </a>
            <ul class="dropdown-menu">
              <li class="header">You have 9 tasks</li>
              <li>
                <!-- inner menu: contains the actual data -->
                <ul class="menu">
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Design some buttons
                        <small class="pull-right">20%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-aqua" style="width: 20%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">20% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Create a nice theme
                        <small class="pull-right">40%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-green" style="width: 40%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">40% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Some task I need to do
                        <small class="pull-right">60%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-red" style="width: 60%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">60% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                  <li><!-- Task item -->
                    <a href="#">
                      <h3>
                        Make beautiful transitions
                        <small class="pull-right">80%</small>
                      </h3>
                      <div class="progress xs">
                        <div class="progress-bar progress-bar-yellow" style="width: 80%" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100">
                          <span class="sr-only">80% Complete</span>
                        </div>
                      </div>
                    </a>
                  </li>
                  <!-- end task item -->
                </ul>
              </li>
              <li class="footer">
                <a href="#">View all tasks</a>
              </li>
            </ul>
          </li>
          <!-- User Account: style can be found in dropdown.less -->
          <li class="dropdown user user-menu">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
              <!-- <img src="dist/img/user2-160x160.jpg" class="user-image" alt="User Image"> -->
              
            
              <span class="hidden-xs"><%-- <%=user.getName() %> --%><%=user.getName() %></span>
            
            
            </a>
            <ul class="dropdown-menu">
              <!-- User image -->
              <li class="user-header">
                <img src="dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">

                <p>
                  <%=user.getName() %>
                </p>
              </li>
              <!-- Menu Body -->
              <li class="user-body">
                <div class="row">
                  <div class="col-xs-4 text-center">
                    <a href="#">Followers</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Sales</a>
                  </div>
                  <div class="col-xs-4 text-center">
                    <a href="#">Friends</a>
                  </div>
                </div>
                <!-- /.row -->
              </li>
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="#" class="btn btn-default btn-flat">Profile</a>
                </div>
                <div class="pull-right">
                  <a href="#" class="btn btn-default btn-flat">Sign out</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
        </ul>
      </div>

    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
      <!-- Sidebar user panel -->
      
      <!-- search form -->
      <form action="#" method="get" class="sidebar-form">
        <div class="input-group">
          <input type="text" name="q" class="form-control" placeholder="Search...">
              <span class="input-group-btn">
                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>
                </button>
              </span>
        </div>
      </form>
      <!-- /.search form -->
      <!-- sidebar menu: : style can be found in sidebar.less -->
      <ul class="sidebar-menu">
        <li class="header"></li>
        <li class="active treeview">
          <a href="index.jsp">
            <i class="fa fa-dashboard"></i> Dashboard
            
          </a>
          
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-files-o"></i>
            <span>Products</span>
            <span class="pull-right-container">
              <span class="label label-primary pull-right">1</span>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="product_list.jsp"><i class="fa fa-circle-o"></i> All Products</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>Sales</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="order.jsp"><i class="fa fa-circle-o"></i> Order</a></li>
            <li><a href="invoice.jsp"><i class="fa fa-circle-o"></i> Invoice</a></li>
            <li><a href="shipment.jsp"><i class="fa fa-circle-o"></i> Shipment</a></li>
            <li><a href="trans.jsp"><i class="fa fa-circle-o"></i> Transaction</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-pie-chart"></i>
            <span>Shops</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="request.jsp"><i class="fa fa-circle-o"></i> Requests</a></li>
            <li><a href="all.jsp"><i class="fa fa-circle-o"></i> All</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-laptop"></i>
            <span>Category</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="allcategory.jsp"><i class="fa fa-circle-o"></i> Category</a></li>
            <li><a href="subcategory.jsp"><i class="fa fa-circle-o"></i> Sub Category</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-edit"></i> <span>Offers</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="categoryoffer.jsp"><i class="fa fa-circle-o"></i> Category Offer</a></li>
            <li><a href="productoffer.jsp"><i class="fa fa-circle-o"></i> Sub Category Offer</a></li>
          </ul>
        </li>
        <li class="treeview">
          <a href="#">
            <i class="fa fa-table"></i> <span>Stock</span>
            <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
          </a>
          <ul class="treeview-menu">
            <li><a href="avail.jsp"><i class="fa fa-circle-o"></i> Stock</a></li>
          </ul>
        </li>
        <li class="treeview">
		<a href="#">
           <i class="fa fa-calendar"></i> <span>Reports</span>
		   <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span></a>
            <ul class="treeview-menu">
            <li><a href="refund.jsp"><i class="fa fa-circle-o"></i> Refund</a></li>
          </ul>
        </li>
      <li>
          <a href="gift.jsp">
            <i class="fa fa-envelope"></i> <span>Gift Card</span>
          </a>
        </li>
    </section>
    <!-- /.sidebar -->
  </aside>


		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					All Products <small>Preview</small>
				</h1>
				<ol class="breadcrumb">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li class="active">All Products</li>
				</ol>
			</section>

			<!-- Main content -->
			<section class="content">

				<!-- SELECT2 EXAMPLE -->
				<div class="box box-default">

					<!-- /.box-header -->
					<div class="box-body">
						<!-- Button trigger modal -->


						<div class="box-header">

							<a href="#myModal" class="tip" class="btn btn-primary btn-lg"
								data-toggle="modal"><img src="img/add.png" alt="Add"
								style="margin-left: 10px;"><span>Add</span></a>
							<!-- Modal -->
							<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
								aria-labelledby="myModalLabel">
								<div class="modal-dialog" role="document" style="width: 950px;">
									<div class="modal-content">

										<div class="modal-body">

											<div class="box box-info">

												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>

												<form action="AddProductAction" method="post"
													enctype="multipart/form-data">
													<div class="box-body">
														<div class="box-header with-border">
															<h3 class="modal-title" id="myModalLabel">Add
																Product</h3>
														</div>
														<div class="col-md-6">
															<!-- fee category feild -->
															<div class="form-group">
																<label>Product Name</label> <input type="text"
																	name="pname" class="form-control"
																	placeholder="Product Name">
															</div>
															<div class="form-group">
																<label>Category</label> <select class="form-control"
																	name="pcategory">
																	<option selected="selected">--Category--</option>
																	<%
																		while (itr_cat.hasNext()) {
																				category = itr_cat.next();
																	%>
																	<option><%=category.getCategory()%></option>
																	<%
																		}
																	%>
																</select>
															</div>
															<div class="form-group">
																<label>Price</label> <input type="text" name="pprice"
																	class="form-control" placeholder="Price">
															</div>

															<div class="form-group">
																<label>Upload Image1</label> <input type="file"
																	name="addimage1" class="form-control">
															</div>

															<div class="form-group">
																<label>Upload Image2</label> <input type="file"
																	name="addimage2" class="form-control">
															</div>

															<div class="box-footer">
																<button type="submit" class="btn btn-primary"
																	name="proadd">Add Product</button>
															</div>
														</div>

														<div class="col-md-6">
															<!-- Status feild -->
															<div class="form-group">
																<label>Offer</label> <input type="text" name="poffer"
																	class="form-control" placeholder="Offer">
															</div>



															<div class="form-group">
																<label>Stock</label> <input type="text" name="pstock"
																	class="form-control" placeholder="Stock">
															</div>

															<div class="form-group">
																<label>Quantity</label> <input type="text"
																	name="pquantity" class="form-control"
																	placeholder="Quantity">
															</div>

															<div class="form-group">
																<label>Upload Image3</label> <input type="file"
																	name="addimage3" class="form-control">
															</div>

															<div class="form-group">
																<label>Upload Image4</label> <input type="file"
																	name="addimage4" class="form-control">
															</div>

														</div>
												</form>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<a class="tip" onclick="deleteProduct();" id="button"><img
							src="img/delete.png" alt="Delete" style="margin-left: 10px;"><span>Delete</span></a>
						<a href="#"> <img src="img/excel.png" alt="Excel"
							style="margin-left: 10px;"></img></a> <a href="#"> <img
							src="img/pdf.png" alt="PDF" style="margin-left: 10px;"></img></a>
					</div>
				</div>
				<!--Table start-->
				<div id="container"
					class="effect aside-float aside-bright mainnav-lg">

					<!--<input type="button" id="dmo-delete-row" class="buton buton-danger" disabled value="Delete">-->

					<table id="demo-custom-toolbar" class="demo-add-niftycheck"
						data-toggle="table" data-toolbar="" data-search="true"
						data-show-refresh="true" data-show-toggle="true"
						data-show-columns="true" data-sort-name="id"
						data-page-list="[5, 10, 20]" data-page-size="5"
						data-pagination="true" data-show-pagination-switch="true">
						<thead>
							<tr>
								<th data-checkbox="false">
								</td>
								<th data-align="center" data-sortable="true">Product Name</th>
								<th data-align="center" data-sortable="true">Category</th>
								<th data-align="center" data-sortable="true">Price</th>
								<th data-align="center" data-sortable="true">Quantity</th>
								<th data-align="center" data-sortable="true">Stock</th>
								<th data-align="center" data-sortable="true">Offer</th>
							</tr>

						</thead>
						<%
							while (itr.hasNext()) {

									product = itr.next();
						%>
						<tr data-index="0">
							<td><input type="checkbox"
								onclick="addProduct(<%=product.getId()%>);" /></td>
							<td><a class="tip" class="btn btn-primary btn-lg"
								data-toggle="modal" href="#myModal2<%=product.getId()%>"> <img
									alt="<%=product.getImage1()%>"
									src="<%=request.getContextPath()%>/upload/<%=product.getImage1()%>"
									style="width: 60px; height: 60px;"><%=product.getProduct_name()%></a></td>
							<td><%=product.getCategory()%></td>
							<td><%=product.getPrice()%></td>
							<td><%=product.getQty()%></td>
							<td><%=product.getStock()%></td>
							<td><%=product.getOffer()%></td>
						</tr>
						<div class="modal fade" id="myModal2<%=product.getId()%>"
							tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document" style="width: 950px;">
								<div class="modal-content">

									<div class="modal-body">

										<div class="box box-info">
											<button type="button" class="close" data-dismiss="modal"
												aria-label="Close">
												<span aria-hidden="true">&times;</span>
											</button>
											<form enctype="multipart/form-data"
												action="EditProductAction?product_id=<%=product.getId()%>"
												method="post">
												<div class="box-body">
													<div class="box-header with-border">
														<h3 class="modal-title" id="myModalLabel">Edit
															Product</h3>
													</div>
													<div class="col-md-6">
														<!-- fee category feild -->
														<div class="form-group">
															<label>Product Name</label> <input type="text"
																name="epname" class="form-control"
																value="<%=product.getProduct_name()%>">
														</div>
														<div class="form-group">
															<label>Category</label> <select class="form-control"
																name="epcategory">
																<option selected="selected"><%=product.getCategory()%></option>
																<%
																	itr_cat = allcategory.iterator();
																			while (itr_cat.hasNext()) {
																				category = itr_cat.next();
																%>
																<option><%=category.getCategory()%></option>
																<%
																	}
																%>
															</select>
														</div>
														<div class="form-group">
															<label>Price</label> <input type="text" name="epprice"
																class="form-control" value="<%=product.getPrice()%>">
														</div>
														<div class="form-group">
															<div>
																<label>Selected</label><br> <img
																	alt="<%=product.getImage1()%>"
																	src="<%=request.getContextPath()%>/upload/<%=product.getImage1()%>"
																	style="width: 60px; height: 60px;"> <input
																	type="hidden" name="teditimage1" class="form-control"
																	value="<%=product.getImage1()%>">
															</div>

															<div>
																<label>Change Image1</label> <input type="file"
																	name="epimage1" class="form-control" 
																	value="<%=product.getImage1()%>"
																	style="margin-top: 15px;">
															</div>
														</div>
														<div class="form-group">
															<div>
																<label>Selected</label><br> <img
																	alt="<%=product.getImage2()%>"
																	src="<%=request.getContextPath()%>/upload/<%=product.getImage2()%>"
																	style="width: 60px; height: 60px;"> <input
																	type="hidden" name="teditimage2" class="form-control"
																	value="<%=product.getImage2()%>">
															</div>

															<div>
																<label>Change Image2</label> <input type="file"
																	name="epimage2" class="form-control"
																	value="<%=product.getImage2()%>"
																	style="margin-top: 15px;">
															</div>
														</div>

													</div>
													<div class="col-md-6">
														<div class="form-group">
															<label>Offer</label> <input type="text" name="epoffer"
																class="form-control" value="<%=product.getOffer()%>">
														</div>

														<div class="form-group">
															<label>Stock</label> <input type="text" name="epstock"
																class="form-control" value="<%=product.getStock()%>">
														</div>

														<div class="form-group">
															<label>Quantity</label> <input type="text"
																name="equantity" class="form-control"
																value="<%=product.getQty()%>">
														</div>
														<div class="form-group">
															<div>
																<label>Selected</label><br> <img
																	alt="<%=product.getImage3()%>"
																	src="<%=request.getContextPath()%>/upload/<%=product.getImage3()%>"
																	style="width: 60px; height: 60px;"> <input
																	type="hidden" name="teditimage3" class="form-control"
																	value="<%=product.getImage3()%>">
															</div>

															<div>
																<label>Change Image3</label> <input type="file"
																	name="epimage3" class="form-control"
																	value="<%=product.getImage3()%>"
																	style="margin-top: 15px;">
															</div>
														</div>
														<div class="form-group">
															<div>
																<label>Selected</label><br> <img
																	alt="<%=product.getImage4()%>"
																	src="<%=request.getContextPath()%>/upload/<%=product.getImage4()%>"
																	style="width: 60px; height: 60px;"> <input
																	type="hidden" name="teditimage4" class="form-control"
																	value="<%=product.getImage4()%>">
															</div>

															<div>
																<label>Change Image4</label> <input type="file"
																	name="epimage4" class="form-control"
																	value="<%=product.getImage4()%>"
																	style="margin-top: 15px;">
															</div>
														</div>
														<div class="box-footer">
															<button type="submit" class="btn btn-primary"
																name="proedit">Edit Product</button>
														</div>
													</div>
											</form>

										</div>
									</div>
								</div>
							</div>
						</div>
						<%
							}
						%>

					</table>

					<!--===================================================-->

				</div>

				<!--table end-->
		</div>

		<!-- /.box-body -->
	</div>
	<!-- /.box -->

	</section>
	<!-- /.content -->
	</div>
	<!-- /.content-wrapper -->
	<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.0
		</div>
		<strong>Copyright &copy; 2014-2016 <a href="#">Zriven
				Technology</a>.
		</strong> All rights reserved.
	</footer>

	<!-- Control Sidebar -->
	<aside class="control-sidebar control-sidebar-dark">
		<!-- Create the tabs -->
		<ul class="nav nav-tabs nav-justified control-sidebar-tabs">
			<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i
					class="fa fa-home"></i></a></li>
			<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i
					class="fa fa-gears"></i></a></li>
		</ul>
		<!-- Tab panes -->
		<div class="tab-content">
			<!-- Home tab content -->
			<div class="tab-pane" id="control-sidebar-home-tab">
				<h3 class="control-sidebar-heading">Recent Activity</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-birthday-cake bg-red"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>

								<p>Will be 23 on April 24th</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-user bg-yellow"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Frodo Updated His
									Profile</h4>

								<p>New phone +1(800)555-1234</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-envelope-o bg-light-blue"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Nora Joined Mailing
									List</h4>

								<p>nora@example.com</p>
							</div>
					</a></li>
					<li><a href="javascript:void(0)"> <i
							class="menu-icon fa fa-file-code-o bg-green"></i>

							<div class="menu-info">
								<h4 class="control-sidebar-subheading">Cron Job 254
									Executed</h4>

								<p>Execution time 5 seconds</p>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

				<h3 class="control-sidebar-heading">Tasks Progress</h3>
				<ul class="control-sidebar-menu">
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Custom Template Design <span
									class="label label-danger pull-right">70%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-danger" style="width: 70%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Update Resume <span class="label label-success pull-right">95%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-success"
									style="width: 95%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Laravel Integration <span class="label label-warning pull-right">50%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-warning"
									style="width: 50%"></div>
							</div>
					</a></li>
					<li><a href="javascript:void(0)">
							<h4 class="control-sidebar-subheading">
								Back End Framework <span class="label label-primary pull-right">68%</span>
							</h4>

							<div class="progress progress-xxs">
								<div class="progress-bar progress-bar-primary"
									style="width: 68%"></div>
							</div>
					</a></li>
				</ul>
				<!-- /.control-sidebar-menu -->

			</div>
			<!-- /.tab-pane -->
			<!-- Stats tab content -->
			<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab
				Content</div>
			<!-- /.tab-pane -->
			<!-- Settings tab content -->
			<div class="tab-pane" id="control-sidebar-settings-tab">
				<form method="post">
					<h3 class="control-sidebar-heading">General Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Report panel
							usage <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Some information about this general settings option</p>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Allow mail
							redirect <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Other sets of options are available</p>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Expose author
							name in posts <input type="checkbox" class="pull-right" checked>
						</label>

						<p>Allow the user to show his name in blog posts</p>
					</div>
					<!-- /.form-group -->

					<h3 class="control-sidebar-heading">Chat Settings</h3>

					<div class="form-group">
						<label class="control-sidebar-subheading"> Show me as
							online <input type="checkbox" class="pull-right" checked>
						</label>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Turn off
							notifications <input type="checkbox" class="pull-right">
						</label>
					</div>
					<!-- /.form-group -->

					<div class="form-group">
						<label class="control-sidebar-subheading"> Delete chat
							history <a href="javascript:void(0)" class="text-red pull-right"><i
								class="fa fa-trash-o"></i></a>
						</label>
					</div>
					<!-- /.form-group -->
				</form>
			</div>
			<!-- /.tab-pane -->
		</div>
	</aside>
	<!-- /.control-sidebar -->
	<!-- Add the sidebar's background. This div must be placed
       immediately after the control sidebar -->
	<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->

	<!-- jQuery 2.2.3 -->
	<script src="plugins/jQuery/jquery-2.2.3.min.js"></script>
	<!-- Bootstrap 3.3.6 -->
	<script src="js/bootstrap.min.js"></script>
	<!-- Select2 -->
	<script src="plugins/select2/select2.full.min.js"></script>
	<!-- SlimScroll 1.3.0 -->
	<script src="plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- iCheck 1.0.1 -->
	<script src="plugins/iCheck/icheck.min.js"></script>
	<!-- FastClick -->
	<script src="plugins/fastclick/fastclick.js"></script>
	<!-- AdminLTE App -->
	<script src="js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="js/demo.js"></script>
</body>
</html>
<%
	}
%>