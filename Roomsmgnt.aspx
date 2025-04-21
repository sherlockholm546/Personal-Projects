<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Roomsmgnt.aspx.cs" Inherits="Hotel_Mgnt_System.Rooms" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Rooms</title>
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f3f4f6;
        }

        .container {
            display: flex;
            height: 100vh;
        }

        .sidebar {
            width: 15rem;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 1rem;
            display: flex;
            flex-direction: column;
        }

            .sidebar h1 {
                font-size: 2rem;
                font-weight: bold;
                margin-bottom: 1.5rem;
            }

            .sidebar nav {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }

                .sidebar nav a {
                    font-size: 20px;
                    color: black;
                    text-decoration: none;
                    padding: 0.5rem;
                    transition: background 0.3s;
                }

                    .sidebar nav a:hover {
                        background-color: rgba(0, 0, 0, 0.05);
                    }

        .main-content {
            flex: 1;
            padding: 1.5rem;
            overflow-y: auto;
        }

            .main-content h1 {
                font-size: 2.5rem;
                margin-bottom: 2rem;
            }

        .gridview-container {
            margin-top: 20px;
            background-color: white;
            border-radius: 10px;
        }

            .gridview-container table {
                width: 100%;
                border-collapse: collapse;
            }

            .gridview-container th, .gridview-container td {
                padding: 10px;
                border: 1px solid #ddd;
                text-align: left;
            }

            .gridview-container th {
                background-color: #f2f2f2;
            }

        .form {
            max-width: 600px;
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        }

            .form h2 {
                margin-bottom: 15px;
                font-size: 1.5rem;
            }

            .form table {
                width: 100%;
            }

            .form td {
                padding: 10px;
            }

            .form input, #ddlRoomType {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .form .buttons {
                display: flex;
                gap: 10px;
                margin-top: 15px;
            }

                .form .buttons input {
                    background-color: #28a745;
                    color: white;
                    border: none;
                    padding: 10px 15px;
                    cursor: pointer;
                    border-radius: 4px;
                }

                    .form .buttons input:hover {
                        background-color: #218838;
                    }

        select {
            padding: 8px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #fff;
            cursor: pointer;
        }

            select:focus {
                border-color: #007bff;
                outline: none;
                box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            }

        select {
            margin-right: 10px;
            min-width: 180px;
        }
        .filter{
            padding: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <div class="sidebar">
                <h2>Oasis Hotel Management</h2>
                <nav>
                    <a href="Dashboard.aspx">Dashboard</a>
                    <a href="GuestsMgnt.aspx">Guests</a>
                    <a href="BookingMgnt.aspx">Booking</a>
                    <a href="RoomsMgnt.aspx">Rooms</a>
                    <a href="PaymentMgnt.aspx">Payment</a>
                </nav>
            </div>

            <div class="main-content">
                <h1>Rooms Management</h1>
                <div class="gridview-container">
                 
                    <div class="filter">
                        Room-Type
                    <asp:DropDownList ID="ddlFilterRtype" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFilterRtype_SelectedIndexChanged">
                    </asp:DropDownList>
                        &nbsp;&amp; Status
                    <asp:DropDownList ID="ddlFilterStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlFilterStatus_SelectedIndexChanged">
                        <asp:ListItem>--Select Status--</asp:ListItem>
                        <asp:ListItem>Available</asp:ListItem>
                        <asp:ListItem>Booked</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                    <br />
                    <asp:Label ID="txtLabel" runat="server" Font-Bold="True" Font-Overline="False" Font-Size="Medium" ForeColor="Red" Visible="False"></asp:Label>
                    <br />
                    <br />
                    <asp:GridView ID="gvRoom" runat="server" CssClass="gridview"
                        DataKeyNames="room_no" OnRowCommand="gvRoom_RowCommand1">
                        <Columns>
                            <asp:CommandField ButtonType="Button" HeaderText="allocate room" ShowHeader="True" ShowSelectButton="True" />
                        </Columns>
                    </asp:GridView>
                </div>

                <br />
                <br />
                <br />
                <div class="form">
                    <h2>Add / Update Rooms</h2>
                    <table>
                        <tr>
                            <td>Room No :</td>
                            <td>
                                <asp:TextBox ID="txtRoomNo" runat="server" TextMode="Number"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td>Room Type :</td>
                            <td>
                                <asp:DropDownList ID="ddlRoomType" runat="server">
                                    <asp:ListItem>-- Select Room Type --</asp:ListItem>
                                    <asp:ListItem Value="1">Delux</asp:ListItem>
                                    <asp:ListItem Value="2">Super Deluxe</asp:ListItem>
                                    <asp:ListItem Value="3">Grand Suite</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>Status :</td>
                            <td>
                                <asp:TextBox ID="txtStatus" runat="server"></asp:TextBox></td>
                        </tr>
                    </table>
                    <div class="buttons">
                        <asp:Button ID="btnAdd" runat="server" Text="Add" OnClick="btnAdd_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
