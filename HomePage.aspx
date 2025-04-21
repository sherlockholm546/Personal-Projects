<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="Hotel_Mgnt_System.HomePage" %>

<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Oasis Hotel</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />
    <style type="text/css">
        .first-section {
            /* background-image: url("https://3.imimg.com/data3/FM/MD/MY-1906485/hotel-booking.jpg");
            background-size: cover;
            background-position: center;
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center; */
            height: 90vh;
            color: white;
        }

        .first-section-img {
            position: relative;
            padding-bottom: 38%;
        }

            .first-section-img > img {
                display: block;
                position: absolute;
                height: 100%;
                width: 100%;
                object-fit: cover;
            }

        .first-section-content {
            position: absolute;
            padding: 20px;
            bottom: 15%;
            width: 500px;
        }

        .first-section h1 {
            font-size: 3em;
            margin-bottom: 15px;
            font-weight: bold;
        }

        .first-section p {
            font-size: 1.2em;
            margin-bottom: 20px;
            line-height: 1.5;
        }

        .first-section .btnBook {
            padding: 12px 25px;
            font-size: 1.1em;
            background-color: #212932;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease, color 0.3s ease;
        }

            .first-section .btnBook:hover {
                background-color: #ffffff;
                color: #060A39;
            }

        .section {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 80vh;
            padding: 20px;
            overflow: hidden;
        }

            .section .left,
            .section .right {
                width: 48%;
                opacity: 0;
                transform: translateX(-100%);
                transition: all 0.8s ease;
            }

            .section .right {
                transform: translateX(100%);
            }

            .section.visible .left,
            .section.visible .right {
                opacity: 1;
                transform: translateX(0);
            }

            .section img {
                width: 100%;
                height: 100%;
                object-fit: cover;
                border-radius: 10px;
            }

            .section .description {
                font-size: 1.2em;
                line-height: 1.6;
            }

        .reverse .left {
            transform: translateX(100%);
        }

        .reverse .right {
            transform: translateX(-100%);
        }

        .Hotel-Rooms h2 {
            text-align: center;
        }

        .facilities-section {
            padding: 50px 20px;
            background-color: #f9f9f9;
        }

            .facilities-section h2 {
                text-align: center;
                font-size: 2.5em;
                margin-bottom: 30px;
                color: #212932;
            }

        .facility {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 50px;
            overflow: hidden;
        }

            .facility .image {
                width: 40%;
                border-radius: 15px;
                overflow: hidden;
            }

            .facility img {
                width: 100%;
                height: 80%;
                object-fit: cover;
            }

            .facility .description {
                width: 48%;
                padding: 20px;
                font-size: 1.2em;
                line-height: 1.6;
                background-color: white;
                border-radius: 10px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

        .booking {
            display: flex;
            justify-content: center;
            background-color: #f9f9f9;
        }

            .booking .btnBook {
                padding: 12px 25px;
                margin: 10px;
                font-size: 18px;
                background-color: #212932;
                color: white;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                transition: background-color 0.3s ease, color 0.3s ease;
            }

                .booking .btnBook:hover {
                    background-color: #2A3B4C;
                    color: #fefeff;
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

            <div class="first-section">
                <div class="first-section-img">
                    <img src="../image/hotel-booking-bg-img.jpg" alt='hotel img' />
                </div>
                <div class="first-section-content">
                    <h1>Welcome to Oasis Hotel</h1>
                    <p>A 5-star luxury hotel nestled in the heart of the city offering world-class amenities.</p>
                    <asp:Button ID="btnBook" runat="server" Text="Book Now" CssClass="btnBook" OnClick="btnBook_Click" />
                </div>
            </div>

            <div class="Hotel-Rooms">
                <h2>Our Hotel Rooms</h2>


                <div class="section" id="single-room">
                    <div class="left">
                        <img src="../image/single-room.jpg" alt="Deluxe Room" />
                    </div>
                    <div class="right">
                        <div class="description">
                            <h3>Luxury Deluxe Room</h3>
                            <p>
                                Our Deluxe Room are perfect for solo travelers, offering a cozy yet luxurious
                                experience
                                with
                                modern amenities. Enjoy your stay in a beautifully designed room with comfortable
                                bedding
                                and
                                a stunning city view.
                            </p>
                        </div>
                    </div>
                </div>


                <div class="section reverse" id="double-room">
                    <div class="left">
                        <div class="description">
                            <h3>Spacious Super Deluxe Room</h3>
                            <p>
                                Our Super Deluxe Room are ideal for couples or friends, featuring elegant decor and ample
                                space.
                                Each
                                room is equipped with a king-size bed, modern furniture, and a breathtaking view of the
                                cityscape.
                            </p>
                        </div>
                    </div>
                    <div class="right">
                        <img src="../image/double-room.jpg" alt="Super Deluxe Room" />
                    </div>
                </div>

                
                <div class="section" id="suite-room">
                    <div class="left">
                        <img src="../image/suite.jpg" alt="Suite Room" />
                    </div>
                    <div class="right">
                        <div class="description">
                            <h3>Grand Suite Room</h3>
                            <p>
                                Our Grand Suite rooms redefine luxury with their spacious layout and exclusive amenities.
                                Relax in
                                style with separate living and sleeping areas, a private balcony, and a panoramic view.
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- facilities sect -->
            <div class="facilities-section">
                <h2>Our Hotel Facilities</h2>
                <!-- restaurant-->
                <div class="facility">
                    <div class="image">
                        <img src="../image/restaurant.jpg" alt="Restaurant and Bar" />
                    </div>
                    <div class="description">
                        <h3>Restaurant</h3>
                        <p>
                            Enjoy world-class cuisine and an extensive selection of beverages at our restaurant.
                            Experience the perfect blend of taste and ambiance.
                        </p>
                    </div>
                </div>

                <!--  Swimming Pool -->
                <div class="facility">
                    <div class="image">
                        <img src="../image/swimming-pool.jpeg" alt="Swimming Pool" />
                    </div>
                    <div class="description">
                        <h3>Swimming Pool</h3>
                        <p>
                            Relax and unwind at our luxurious swimming pool, surrounded by beautiful landscapes. Perfect
                            for
                            a refreshing dip or soaking up the sun.
                        </p>
                    </div>
                </div>

                <!-- Gym & Fitness Center -->
                <div class="facility">
                    <div class="image">
                        <img src="../image/gym.jpg" alt="Gym & Fitness Center" />
                    </div>
                    <div class="description">
                        <h3>Gym & Fitness Center</h3>
                        <p>
                            Stay fit during your stay at our fully equipped gym and fitness center, open 24/7 for your
                            convenience.
                        </p>
                    </div>
                </div>
                <div class="booking">
                    <asp:Button ID="btnBook1" runat="server" Text="Book Now" CssClass="btnBook" OnClick="btnBook1_Click" />
                </div>
            </div>
        </main>
        <uc:Footer runat="server" />
    </form>
</body>
<script>
    window.addEventListener('scroll', function () {
        //const navbar = document.getElementById('navbar');
        //if (window.scrollY > 50) {
        //    navbar.classList.add('scrolled');
        //} else {
        //    navbar.classList.remove('scrolled');
        //}

        const sections = document.querySelectorAll('.section');
        sections.forEach(section => {
            const sectionPosition = section.getBoundingClientRect().top;
            const screenPosition = window.innerHeight / 1.3;

            if (sectionPosition < screenPosition) {
                section.classList.add('visible');
            }
        });
    });
</script>
</html>

