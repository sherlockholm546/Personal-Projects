<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Hotel_Mgnt_System.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard</title>
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

        .cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 1.5rem;
        }

        .card {
            background-color: white;
            padding: 1rem;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border-radius: 5px;
            flex: 1 1 calc(25% - 1.5rem);
            min-width: 200px;
        }

            .card h3 {
                margin-top: 0;
                font-size: 1.5rem;
                margin-bottom: 0.5rem;
            }

            .card p {
                font-size: 1.25rem;
                margin: 0;
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
                <h1>Dashboard</h1>
                <div class="cards-container">
                    <div class="card">
                        <h3>Total Guests</h3>
                        <p>
                            <asp:Label ID="lblTotalGuests" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                    <div class="card">
                        <h3>Total Bookings</h3>
                        <p>
                            <asp:Label ID="lblTotalBookings" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                    <div class="card">
                        <h3>Total Rooms</h3>
                        <p>
                            <asp:Label ID="lblTotalRooms" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                    <div class="card">
                        <h3>Available Rooms</h3>
                        <p>
                            <asp:Label ID="lblAvailableRooms" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                    <div class="card">
                        <h3>Occupied Rooms</h3>
                        <p>
                            <asp:Label ID="lblOccupiedRooms" runat="server" Text="0"></asp:Label>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
