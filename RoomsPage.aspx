<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RoomsPage.aspx.cs" Inherits="Hotel_Mgnt_System.RoomsPage" %>

<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rooms</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css"
        integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px;
            background-color: #007b8f;
            color: white;
        }

        .main {
            position: relative;
            width: 100%;
            height: 100vh;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            text-align: center;
            color: white;
        }

            .main::before {
                content: "";
                position: absolute;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 1;
            }

            .main img {
                width: 100%;
                height: 100vh;
                object-fit: cover;
                position: absolute;
                top: 0;
                left: 0;
                z-index: 0;
            }

        .main-content {
            position: relative;
            z-index: 2;
        }

        .main h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .main p {
            font-size: 1.2rem;
            margin-bottom: 40px;
        }

        .bttn {
            padding: 12px 25px;
            font-size: 1.1em;
            background-color: #212932;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

            .bttn:hover {
                background-color: #ffffff;
                color: #060A39;
            }

        .room-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 60px;
            padding: 70px 0;
        }

        .room-card {
            display: flex;
            width: 80%;
            height: 450px;
            border-radius: 10px;
            overflow: hidden;
            position: relative;
        }


            .room-card img {
                position: absolute;
                width: 60%;
                height: 100%;
                object-fit: cover;
                border-radius: 15px;
            }

        .room-info {
            position: absolute;
            padding: 20px;
            display: flex;
            height: 80%;
            width: 40%;
            flex-direction: column;
            justify-content: center;
            background-color: #ffffff;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            left: 55%;
            top: 10%;
        }

            .room-info h2 {
                font-size: 1.5rem;
                margin-bottom: 10px;
                padding: 10px;
            }

            .room-info p {
                margin-bottom: 10px;
                padding: 10px;
            }

        .room-icons {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            margin-bottom: 20px;
            padding: 10px;
        }

        .image-mid {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 15px;
            left: 35%;
        }

        .room-info-mid {
            position: absolute;
            padding: 20px;
            display: flex;
            height: 80%;
            width: 40%;
            flex-direction: column;
            justify-content: center;
            background-color: #ffffff;
            box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.1);
            right: 55%;
            top: 10%;
            z-index: 99;
        }

            .room-info-mid h2 {
                font-size: 1.5rem;
                margin-bottom: 10px;
                padding: 10px;
            }

            .room-info-mid p {
                margin-bottom: 10px;
                padding: 10px;
            }


        .room-icons div {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        i {
            color: #007b8f;
        }

        .book-btn {
            background-color: #007b8f;
            color: white;
            padding: 10px 15px;
            border-radius: 5px;
            text-decoration: none;
            font-weight: bold;
            text-align: center;
        }

        .facility {
            position: relative;
            width: 100%;
            height: 60vh;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            overflow: hidden;
            margin-bottom: 70px;
        }

        .facility__video {
            position: absolute;
            width: 100%;
            height: 100%;
            object-fit: cover;
            z-index: 1;
        }

        .overlay {
            position: absolute;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: 2;
        }

        .content {
            position: relative;
            z-index: 3;
        }

        .subtitle {
            font-size: 15px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }

        h2 {
            font-size: 2.5rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .facility-list {
            display: flex;
            justify-content: center;
            gap: 50px;
            list-style: none;
            padding: 0;
            margin-top: 20px;
        }

        .facility-item {
            display: flex;
            flex-direction: column;
            align-items: center;
            font-size: 20px;
        }

        .facility-icon {
            font-size: 40px;
            color: #00bcd4;
            margin: 20px;
        }

        .facility-text {
            font-size: 20px;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
                <header class="header" id="navbar">
            <div class="logo">
                <a href="HomePage.aspx">
                    <img src="../image/Oasis Logo.png" alt="Hotel Logo" /></a>
            </div>
            <nav>
                <ul>
                    <li><a href="HomePage.aspx">Home</a></li>
                    <li><a href="RoomsPage.aspx">Rooms</a></li>
                    <li><a href="BookingPage.aspx">Book Now</a></li>
                    <li><a href="ContactUs.aspx">Contact Us</a></li>
                    <% if (Session["gemail"] == null)
                        {%>
                    <li><a href="GuestLoginPage.aspx">Sign Up/Login</a></li>
                    <% }
                    else
                    { %>
                    <li><a href="UpdateGuestDetails.aspx">My Profile</a></li>
                    <li>
                        <asp:Button ID="btnLoginOut" runat="server" Text="LogOut" CssClass="logOut" OnClick="btnLoginOut_Click" /></li>
                    <%} %>
                </ul>
            </nav>
        </header>
        <main>
            <section class="main">
                <img src="../image/room_main.jpeg" alt="Hotel Room" />
                <div class="main-content">
                    <p>LUXURY HOTEL EXPERIENCE</p>
                    <h1>OUR ROOMS & SUITES</h1>
                    <asp:Button ID="btnBook" runat="server" Text="Book Now" CssClass="bttn" OnClick="btnBook_Click" />
                </div>
            </section>

            <section class="room-container">
                <div class="room-card">
                    <div class="image">
                        <img src="../image/delux.jpg" alt="Deluxe Room" />
                    </div>
                    <div class="room-info">
                        <h2>Deluxe Room</h2>
                        <p>A perfect blend of comfort and style with a beautiful interior and scenic views.</p>
                        <div class="room-icons">
                            <div><i class="fa-solid fa-bed"></i>King Size Bed</div>
                            <div><i class="fa-solid fa-tv"></i>40" TV</div>
                        </div>
                        <asp:HyperLink ID="lnkDeluxe" runat="server" NavigateUrl="BookingPage.aspx" CssClass="book-btn">Book Now</asp:HyperLink>
                    </div>
                </div>

                <div class="room-card">
                    <div class="room-info-mid">
                        <h2>Super Deluxe Room</h2>
                        <p>Beautiful design with modern furnishings including a glamorous bay window.</p>
                        <div class="room-icons">
                            <div><i class="fa-solid fa-bed"></i>King Size Bed</div>
                            <div><i class="fa-solid fa-tv"></i>42" Smart TV</div>
                            <div><i class="fa-solid fa-wifi"></i>Free Wi-Fi</div>
                            <div><i class="fa-solid fa-bath"></i>Luxury Bathroom</div>
                        </div>
                        <asp:HyperLink ID="lnkSuperDeluxe" runat="server" NavigateUrl="BookingPage.aspx" CssClass="book-btn">Book Now</asp:HyperLink>
                    </div>
                    <div class="image-mid">
                        <img src="../image/super.jpg" alt="Super Deluxe Room" />
                    </div>
                </div>

                <div class="room-card">
                    <div class="image">
                        <img src="../image/grandsuit.jpg" alt="Grand Suite" />
                    </div>
                    <div class="room-info">
                        <h2>Grand Suite</h2>
                        <p>Experience the ultimate luxury in our Grand Suite with premium amenities.</p>
                        <div class="room-icons">
                            <div><i class="fa-solid fa-bed"></i>King Size Bed</div>
                            <div><i class="fa-solid fa-tv"></i>50" Ultra HD TV</div>
                            <div><i class="fa-solid fa-utensils"></i>Complimentary Breakfast</div>
                            <div><i class="fa-solid fa-spa"></i>Private Spa</div>
                        </div>
                        <asp:HyperLink ID="lnkGrandSuite" runat="server" NavigateUrl="BookingPage.aspx" CssClass="book-btn">Book Now</asp:HyperLink>
                    </div>
                </div>
            </section>

            <section class="facility">
                <video autoplay loop muted class="facility__video">
                    <source src="../image/hotelclip.mp4" type="video/mp4" />
                </video>
                <div class="overlay"></div>
                <div class="content">
                    <p class="subtitle">HOTEL OASIS</p>
                    <h2>Facilities</h2>
                    <ul class="facility-list">
                        <li class="facility-item">
                            <i class="fa-solid fa-car facility-icon"></i>
                            <span class="facility-text">Private Parking</span>
                        </li>
                        <li class="facility-item">
                            <i class="fa-solid fa-wifi facility-icon"></i>
                            <span class="facility-text">High Speed Wifi</span>
                        </li>
                        <li class="facility-item">
                            <i class="fa-solid fa-tv facility-icon"></i>
                            <span class="facility-text">Smart TV</span>
                        </li>
                        <li class="facility-item">
                            <i class="fa-solid fa-snowflake facility-icon"></i>
                            <span class="facility-text">Air Conditioning</span>
                        </li>
                    </ul>
                </div>
            </section>

        </main>
        <uc:Footer runat="server" />
    </form>
</body>
</html>
