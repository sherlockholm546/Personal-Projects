<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Hotel_Mgnt_System.ContactUs" %>

<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/js/all.min.js" crossorigin="anonymous"></script>
    <title>Contact Us Page</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />

    <style>
        .container {
            max-width: 900px;
            margin: 120px auto 40px auto;
            padding: 20px;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .hero {
            text-align: center;
            margin-bottom: 20px;
        }

            .hero h1 {
                font-size: 32px;
                font-weight: bold;
                margin-bottom: 10px;
            }

            .hero p {
                font-size: 18px;
                color: #555;
            }

        section {
            margin-bottom: 30px;
            padding: 30px 20px;
            border-bottom: 2px solid #212932;
        }

            section h2 {
                font-size: 24px;
                margin-bottom: 10px;
                font-weight: bold;
            }

        .contact-info {
            font-size: 18px;
            margin-bottom: 10px;
        }

        .form-container {
            margin-top: 20px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 2px solid black;
            border-radius: 4px;
            font-size: 16px;
            background: white;
            color: black;
        }

        .btn {
            width: 100%;
            padding: 14px;
            margin-top: 15px;
            background: #212932;
            color: white;
            border: none;
            cursor: pointer;
            font-size: 18px;
            font-weight: bold;
            border-radius: 4px;
            transition: background 0.3s ease;
        }

            .btn:hover {
                background: #2A3B4C;
            }

        .icon {
            margin-right: 8px;
            color: #212932;
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


        <main class="container">
            <section class="hero">
                <h1>Get In Touch With Us</h1>
                <p>Should you require more information about Oasis Hotel or want to arrange a booking.</p>
            </section>

            <section>
                <h2>How To Find Us</h2>
                <p class="contact-info"><i class="fas fa-map-marker-alt icon"></i>PO Box 391136, Dubai Production City, Dubai</p>
            </section>

            <section>
                <h2>Opening Hours</h2>
                <p class="contact-info"><i class="fas fa-clock icon"></i>1 PM - 10 PM (Tue - Sun)</p>
                <p class="contact-info"><i class="fas fa-calendar-times icon"></i><strong>Closed On:</strong> 25 Dec 2024 and 1 - 2 Jan 2025</p>
                <p>We welcome you from 1 PM to 10 PM, Tuesday through Sunday, ensuring a delightful experience throughout the week.</p>
            </section>

            <section>
                <h2>Contact Us</h2>
                <p><i class="fas fa-phone-alt icon"></i><strong>+971 3 456 789</strong></p>
                <p class="contact-info"><i class="fas fa-envelope icon"></i>info@oasishotel.com</p>
            </section>

            <section>
                <h2><i class="fas fa-paper-plane icon"></i>Send Us a Message</h2>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>

                <div class="form-container">
                    <label for="txtName"><i class="fas fa-user icon"></i>Full Name</label>
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>

                    <label for="txtEmail"><i class="fas fa-envelope icon"></i>Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>

                    <label for="txtMessage"><i class="fas fa-comment icon"></i>Your Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>

                    <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn" />
                </div>
            </section>
        </main>
    </form>
</body>
</html>
