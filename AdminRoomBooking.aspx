<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminRoomBooking.aspx.cs" Inherits="Hotel_Mgnt_System.AdminRoomBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Room booking</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 70%;
            max-width: 700px;
            margin: 80px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        select, input[type="text"], input[type="date"], input[type="number"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        .radio-group {
            margin-bottom: 15px;
        }

        .radio-group label {
            margin-right: 15px;
        }

        #btnBook {
            width: 100%;
            padding: 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        #btnBook:hover {
            background-color: #0056b3;
        }

    </style>
</head>
<body>
     <form id="form1" runat="server">
    <div class="container">
            <h2>Room Booking Form</h2>

            <label>Room Type:</label>
            <asp:DropDownList ID="ddlRoomType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRoomType_SelectedIndexChanged" >
            </asp:DropDownList><br /><br />

            <label>Price per Night:</label>
            <asp:TextBox ID="txtPricePerNight" runat="server" ReadOnly="true" TextMode="Number"></asp:TextBox><br /><br />

            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox><br /><br />

            <label>Room No:</label>
            <asp:TextBox ID="txtRoomNo" runat="server" ReadOnly="True" TextMode="Number"></asp:TextBox><br /><br />

            <label>Check-in Date:</label>
            <asp:TextBox ID="txtCheckInDate" runat="server" TextMode="Date" AutoPostBack="True" OnTextChanged="txtCheckInDate_TextChanged"></asp:TextBox><br /><br />

            <label>Check-out Date:</label>
            <asp:TextBox ID="txtCheckOutDate" runat="server" TextMode="Date" AutoPostBack="True" OnTextChanged="txtCheckOutDate_TextChanged"></asp:TextBox>
            <asp:Label ID="lblMessage" runat="server" Text="Label" Visible="False" ForeColor="Red"></asp:Label>
            <br /><br />

            <label>No of Rooms:</label>
            <asp:TextBox ID="txtNoOfRooms" runat="server" ReadOnly="true" Text="1"></asp:TextBox><br /><br />

            <label>Total Price:</label>
            <asp:TextBox ID="txtTotalPrice" runat="server" ReadOnly="true" TextMode="Number"></asp:TextBox><br /><br />

            <label>Payment Method:</label><asp:DropDownList ID="ddlPayment" runat="server">
                <asp:ListItem>UPI</asp:ListItem>
                <asp:ListItem>PayPal</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br /><br />

            <asp:Button ID="btnBook" runat="server" Text="Book" OnClick="btnBook_Click"  />
            <br />
            <br />
            <asp:Label ID="lblbookingMassage" runat="server" ForeColor="Green"></asp:Label>
        </div>
 </form>
</body>
</html>
