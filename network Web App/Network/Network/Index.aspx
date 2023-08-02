<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Network.Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        .sidebar {/*Burası filtre kısmının özellikleri*/
            max-width: 100%;
            flex: 1;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 10px;
            margin-left:-10px;
        }
        .filter-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
            .filter-table th,
            .filter-table td {
                padding: 10px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }
        .submenu {/*Yan menünün özellikleri*/
            display: none;
            position: absolute;
            left: 100%;
            top: 0;
            background-color: #f8f9fa;
            border: 1px solid #ced4da;
            z-index: 2;
            padding: 5px;
            width: 100%;
        }

        .list-group-item:hover .submenu {
            display: block;
            
        }

        .list-group-item:hover {
            background-color: rgb(221, 221, 221);

        }

            .list-group-item:hover > .menu-link,
            .submenu-list li a:hover {
                color: #000;
            }

        .menu-link {
            position: relative;
            display: inline-block;
            padding: 5px;
            color: rgb(36, 36, 36);
            font-weight: bold;
            text-decoration: none;
        }

        .submenu-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

            .submenu-list li:hover {
                background-color: rgb(221, 221, 221);
            }

            .submenu-list li {
                padding: 5px;
                border-bottom: 1px solid #ced4da;
            }

                .submenu-list li:last-child {
                    border-bottom: none;
                }

        .hovered {
            background-color: #f8f9fa;
            color: #888;
        }

        .greater-than1 {
            margin-left: 130px;
        }

        .greater-than2 {
            margin-left: 110px;
        }

        .greater-than3 {
            margin-left: 125px;
        }

        /* Hamburger Menu Styles */
        .menu-toggle {
            display: none;
        }

            .menu-toggle:checked ~ .container .row .col-lg-3 .list-group {
                display: block;
                position: static; /* Değişiklik */
                width: auto; /* Değişiklik */
                background-color: transparent; /* Değişiklik */
                border: none; /* Değişiklik */
                padding: 0; /* Değişiklik */
            }

        @media (max-width: 991px) {


            .container .row .col-lg-3 .list-group {
                position: relative;
                top: 0;
                left: 0;
                width: 100%;
                background-color: transparent;
                border: none;
                z-index: 0;
                padding: 0;
            }

            .container .row .col-lg-3 {
                position: relative;
            }

            .menu-toggle {
                display: block;
                top: 10px;
                right: 10px;
                z-index: 2;
                margin-top: 00px;
                margin-left: 4%;
            }

                .menu-toggle + label {
                    display: inline-block;
                    border: 1px solid gray;
                    padding: 5px 10px;
                    cursor: pointer;
                    width: 93%;
                    border-radius: 4px;
                    background-color: white;
                }

                .menu-toggle .bar {
                    display: block;
                    width: 30px;
                    height: 3px;
                    background-color: #000;
                    margin-bottom: 4px;
                    margin-left: 45%;
                }

                    .menu-toggle .bar:last-child {
                        margin-bottom: 0;
                    }

                .menu-toggle:checked + .container .row .col-lg-3 .list-group {
                    display: block;
                }

            .container .row .col-lg-3 .list-group {
                display: none;
            }

            .submenu {
                position: static;
                margin-top: 5px;
                border: none;
                width: auto;
            }
        }

        .carousel-item img {
            border-radius: 10px;
        }


        .menu-link:before {
            content: "";
            position: absolute;
            left: -16px; /* Önceki değer: 0 */
            top: 0;
            bottom: 0;
            width: 3px;
            background-color: #007bff;
            height: 50px;
            margin-top: -7px;
        }

        .submenu:before {
            content: "";
            position: absolute;
            left: -3px; /* Önceki değer: -3px */
            top: 0;
            bottom: 0;
            width: 3px;
            background-color: #007bff;
        }

        @media (max-width: 1399px) {
            .menu-link {
                position: relative;
                display: inline-block;
                color: rgb(36, 36, 36);
                font-weight: bold;
                text-decoration: none;
                margin-left: 7px;
            }

            .list-group-item {
                padding: 0px;
                height: 44px;
            }

            .menu-link:before {
                content: "";
                position: absolute;
                left: -8px; /* Önceki değer: 0 */
                top: 6px;
                bottom: 0;
                width: 3px;
                height: 44px;
                margin-top: -7px;
            }

            .greater-than1 {
                visibility: hidden;
            }

            .greater-than2 {
                visibility: hidden;
            }

            .greater-than3 {
                visibility: hidden;
            }
        }

        @media (max-width: 1199px) {
            .menu-link {
                position: relative;
                display: inline-block;
                color: rgb(36, 36, 36);
                font-weight: bold;
                text-decoration: none;
                margin-left: 7px;
            }

            .list-group-item {
                padding: 0px;
                height: 37px;
            }

            .menu-link:before {
                content: "";
                position: absolute;
                left: -8px; /* Önceki değer: 0 */
                top: 6px;
                bottom: 0;
                width: 3px;
                height: 37px;
                margin-top: -7px;
            }

            .greater-than1 {
                visibility: hidden;
            }

            .greater-than2 {
                visibility: hidden;
            }

            .greater-than3 {
                visibility: hidden;
            }
        }

        .cardpoz {
            margin-top: 100px;
            margin-left: 1%;
        }

        .card {
            margin-left: 1%;

        }

        .products {
            flex: 4;
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .product-card {
            padding: 20px;
            border: 1px solid #ddd;
            background-color: #fff;
        }

            .product-card img {
                width: 100%;
                max-height: 150px;
                object-fit: cover;
                margin-bottom: 10px;
            }

            .product-card h5 {
                margin-bottom: 5px;
            }

        .add-product-form {
            margin-top: 20px;
        }

        .error-message {
            color: red;
        }

        .add-product-form {
            max-width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f7f7f7;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

            .add-product-form h3 {
                text-align: center;
                margin-bottom: 20px;
            }

            .add-product-form label {
                font-weight: bold;
            }

            .add-product-form .form-group {
                margin-bottom: 20px;
            }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            text-align: center;
        }

    </style>
    <input style="display: none;" type="checkbox" class="menu-toggle" id="menu-toggle">

    <label for="menu-toggle" class="menu-toggle">
        <span class="bar"></span>
        <span class="bar"></span>
        <span class="bar"></span>

    </label>
    <br />


    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <ul class="list-group">
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Bilgisayar   <span class="greater-than1">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Masaüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Dizüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Tablet</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Bilgisayar   <span class="greater-than1">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Masaüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Dizüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Tablet</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Bilgisayar   <span class="greater-than1">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Masaüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Dizüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Tablet</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Bilgisayar   <span class="greater-than1">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Masaüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Dizüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Tablet</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Bilgisayar   <span class="greater-than1">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Masaüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Dizüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Tablet</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Bilgisayar   <span class="greater-than1">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Masaüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Dizüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Tablet</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Bilgisayar   <span class="greater-than1">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Masaüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Dizüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Tablet</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Bilgisayar   <span class="greater-than1">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Masaüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Dizüstü Bilgisayar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Tablet</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Cep Telefonu <span class="greater-than2">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">Akıllı Telefonlar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Yedek Parçalar</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">Aksesuarlar</a></li>
                            </ul>
                        </div>
                    </li>
                    <li class="list-group-item">
                        <a style="text-decoration: none;" href="#" class="menu-link">Televizyon <span class="greater-than3">&gt;</span></a>
                        <div class="submenu">
                            <ul class="submenu-list">
                                <li><a class="renk" style="text-decoration: none;" href="#">LED TV</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">OLED TV</a></li>
                                <li><a class="renk" style="text-decoration: none;" href="#">UHD TV</a></li>
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
            <div class="col-lg-9">
                <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="images/AsustorMayisFirsatlari23.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/DahuaHDCViMayis23.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="images/EsdMarketingMayis23.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Previous</span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">Next</span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="cardpoz">
        <div id="container" class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="sidebar">
                        <table class="filter-table">
                            <tr>
                                <th>Kategori</th>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="filter-checkbox" data-category="Elektronik" onchange="applyFilters()" />
                                        Elektronik
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="filter-checkbox" data-category="Giyim" onchange="applyFilters()" />
                                        Giyim
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="filter-checkbox" data-category="Ev" onchange="applyFilters()" />
                                        Ev
                                    </label>
                                </td>
                            </tr>
                        </table>

                        <table class="filter-table">
                            <tr>
                                <th>Marka</th>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="filter-checkbox" data-brand="Samsung" onchange="applyFilters()" />
                                        Samsung
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="filter-checkbox" data-brand="Apple" onchange="applyFilters()" />
                                        Apple
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <label>
                                        <input type="checkbox" class="filter-checkbox" data-brand="Nike" onchange="applyFilters()" />
                                        Nike
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="col-md-8">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="slider"></div>
                        </div>
                    </div>

                    <div style="width:1250px; margin-left:-18px;" class="row">
                        <asp:Repeater ID="tekrarlayici" runat="server">
                            <ItemTemplate>
                                <div class="col-md-3 mb-3 card" data-category='<%# Eval("Category") %>' data-brand='<%# Eval("Brand") %>'>
                                    <div>
                                        <img style="height: 300px;" src="<%# Eval("ImageUrl") %>" class="card-img-top" alt="...">
                                        <div class="card-body">
                                            
                                            <h5 class="card-title"><%# Eval("Title") %></h5>
                                            <p class="card-text">Kategori: <%# Eval("Category") %></p>
                                            <p class="card-text">Marka: <%# Eval("Brand") %></p>
                                            <p class="card-text">Fiyat: <%# Eval("Price","{0:c}") %> TL</p>
                                            <a href="#" class="btn btn-danger"><span class="shopping-cart-icon">&#128722</span> Sepete Ekle</a>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function applyFilters() {
            var checkboxes = document.getElementsByClassName("filter-checkbox");
            var cards = document.getElementsByClassName("card");

            for (var i = 0; i < cards.length; i++) {
                var card = cards[i];
                var showCard = true;

                for (var j = 0; j < checkboxes.length; j++) {
                    var checkbox = checkboxes[j];

                    if (checkbox.checked && card.getAttribute("data-category") !== checkbox.getAttribute("data-category") && card.getAttribute("data-brand") !== checkbox.getAttribute("data-brand")) {
                        showCard = false;
                        break;
                    }
                }

                if (showCard) {
                    card.style.display = "block";
                } else {
                    card.style.display = "none";
                }
            }
        }
    </script>

</asp:Content>
