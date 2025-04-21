<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="Hotel_Mgnt_System.loginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login Page</title>
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
/*            background-color: #f4f4f4;*/
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            margin-top: 50px;
            background: white;
        }

            .container h1 {
                margin-bottom: 20px;
                font-size: 36px;
                color: #2c3e50;
            }

        form {
            width: 300px;
            display: flex;
            flex-direction: column;
        }

            form label {
                margin-bottom: 5px;
                font-size: 14px;
                color: #555;
            }

        .input-field {
            margin-bottom: 15px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
/*            width: 100%;*/
        }

        .btn-login {
            background-color: #1abc9c;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

            .btn-login:hover {
                background-color: #16a085;
            }

        .label {
            color: red;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Admin Login Page</h1>
        <form id="form1" runat="server">
            
                <asp:Label ID="lblEmail" runat="server" Text="Email : " ></asp:Label>
                
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="input-field"  Placeholder="Email"></asp:TextBox>
                
                <asp:Label ID="lblPass" runat="server" Text="Password : "></asp:Label>
                
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="input-field" Placeholder="Password"></asp:TextBox>
                
                <asp:Label ID="lblLogin" runat="server" CssClass="label"></asp:Label>
                <br />
                
                <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-login" OnClick="btnLogin_Click" />
           
        </form>
    </div>
</body>
</html>
