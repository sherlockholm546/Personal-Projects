<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BookingPage.aspx.cs" Inherits="Hotel_Mgnt_System.BookingPage" %>

<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Booking Page</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />

    <style>
        /*        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }*/

        .container {
            width: 100%;
            max-width: 650px;
            margin: 150px auto 80px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h3 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        select, input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

            .btn:hover {
                background-color: #0056b3;
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
            <div class="container">
                <h3>Hotel Booking Form</h3>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Red" Visible="False"></asp:Label>
                <div class="form-group">
                    <label>Room Type</label>
                    <asp:DropDownList ID="ddlRoomType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlRoomType_SelectedIndexChanged">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvRoomType" runat="server" ControlToValidate="ddlRoomType"
                        InitialValue="-- Select Room --" ErrorMessage="Please select a room type." ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div class="form-group">
                    <label>Price Per Night</label>
                    <asp:TextBox ID="txtPricePerNight" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>CheckIn Date</label>
                    <asp:TextBox ID="txtCheckIn" runat="server" TextMode="Date" AutoPostBack="true" OnTextChanged="txtCheckIn_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCheckIn" runat="server" ControlToValidate="txtCheckIn"
                        ErrorMessage="Check-in date is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    </div>
                <div class="form-group">
                    <label>CheckOut Date</label>
                    <asp:TextBox ID="txtCheckOut" runat="server" TextMode="Date" AutoPostBack="true" OnTextChanged="txtCheckOut_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCheckOut" runat="server" ControlToValidate="txtCheckOut"
                        ErrorMessage="Check-out date is required." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cvCheckOut" runat="server" ControlToValidate="txtCheckOut"
                        ControlToCompare="txtCheckIn" Operator="GreaterThan" Type="Date"
                        ErrorMessage="Check-out date must be after check-in date." ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </div>
                <div class="form-group">
                    <label>No of Rooms</label>
                    <asp:TextBox ID="txtNofRoom" runat="server" TextMode="Number" AutoPostBack="True" OnTextChanged="txtNofRoom_TextChanged"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNofRoom" runat="server" ControlToValidate="txtNofRoom"
                        ErrorMessage="Please enter the number of rooms." ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="rvNofRoom" runat="server" ControlToValidate="txtNofRoom"
                        MinimumValue="1" MaximumValue="5" Type="Integer"
                        ErrorMessage="Rooms should be between 1 and 5." ForeColor="Red" Display="Dynamic"></asp:RangeValidator>
                </div>
                <div class="form-group">
                    <label>Total Price</label>
                    <asp:TextBox ID="txtTotalPrice" runat="server" TextMode="Number" ReadOnly="True"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label>Payment Method</label>
                    <asp:DropDownList ID="ddlPaymentMethod" runat="server">
                        <asp:ListItem>-- Select Payment Method --</asp:ListItem>
                        <asp:ListItem Text="UPI" Value="UPI"></asp:ListItem>
                        <asp:ListItem Text="PayPal" Value="PayPal"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvPaymentMethod" runat="server" ControlToValidate="ddlPaymentMethod"
                        InitialValue="-- Select Payment Method --" ErrorMessage="Please select a payment method." ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
                <div>
                    <asp:Button ID="btnPayNow" runat="server" CssClass="btn" Text="Pay Now" OnClick="btnPayNow_Click" />
                </div>
            </div>

        </main>
        <uc:Footer runat="server" />
    </form>
</body>
</html>
