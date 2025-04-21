<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaymentMgnt.aspx.cs" Inherits="Hotel_Mgnt_System.Payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Payment</title>
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

            .form input {
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">

            <div class="sidebar">
                <h2>Oasis Hotel Management</h2>
                <nav>
                    <a href="Dashboard.aspx">Dashboard</a>
                    <a href="GuestMgnts.aspx">Guests</a>
                    <a href="BookingMgnt.aspx">Booking</a>
                    <a href="RoomsMgnt.aspx">Rooms</a>
                    <a href="PaymentMgnt.aspx">Payment</a>
                </nav>
            </div>

            <div class="main-content">
                <h1>Payment Management</h1>
                <div class="gridview-container">
                    <asp:GridView ID="gvPay" runat="server" AutoGenerateColumns="True" CssClass="gridview" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>
