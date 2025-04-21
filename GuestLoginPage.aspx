<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GuestLoginPage.aspx.cs" Inherits="Hotel_Mgnt_System.GuestLoginPage" %>

<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guest Login Page</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />

    <style>
        main {
            margin: 0;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            height: 100vh;
        }

        .login-box {
            background: rgba(255, 255, 255, 0.8);
            padding: 25px;
            width: 350px;
            border-radius: 8px;
            text-align: left;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.3);
        }


        h2 {
            margin-bottom: 20px;
            color: #212932;
            text-align: center;
        }


        .form-control {
            width: 100%;
            padding: 12px;
            margin-top: 5px;
            border: 1.5px solid black;
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


        .register-link {
            margin-top: 10px;
            font-size: 14px;
        }

            .register-link a {
                color: #007bff;
                text-decoration: none;
                font-weight: bold;
            }

                .register-link a:hover {
                    text-decoration: underline;
                }

        .error-message {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <main>
            <div class="login-container">
                <div class="login-box">
                    <h2>Guest Login</h2>

                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Enter a valid email address" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                    </div>

                    <label for="txtPassword">Password</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                    <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password must be at least 5 characters long" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^.{5,}$"></asp:RegularExpressionValidator>
                    </div>

                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn" OnClick="btnLogin_Click" />

                    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

                    <p class="register-link">Don't have an account? <a href="RegistrationPage.aspx">Register here</a></p>
                </div>
            </div>
        </main>
    </form>
</body>
</html>
