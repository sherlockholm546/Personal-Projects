<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationPage.aspx.cs" Inherits="Hotel_Mgnt_System.RegistrationPage" %>

<%@ Register Src="~/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Guest Registration</title>
    <link rel="stylesheet" href="StyleSheet1.css" />
    <link rel="icon" type="image/x-icon" href="../image/Oasis Logo.png" />
    <style>
        main{
            margin: 0;
        }
        .container {
            width: 400px;
            margin: 120px auto 40px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2);
        }

        h2{
            text-align: center;
        }

        .form-group {
            margin-bottom: 10px;
        }

        label {
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .btn {
            background-color: #212932;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            cursor: pointer;
            transition: background 0.3s ease;
        }

            .btn:hover {
                background-color: #2A3B4C;
            }

        .login-link {
            text-align: center;
            margin-top: 15px;
        }

            .login-link a {
                color: #007bff;
                text-decoration: none;
            }

                .login-link a:hover {
                    text-decoration: underline;
                }

    </style>
</head>
<body>
    <form id="form1" runat="server">
              

        <main>
            <div class="container">
                <h2>Guest Registration</h2>
                <div class="form-group">
                    <label>First Name:</label>
                    <asp:TextBox ID="txtFirstName" runat="server" required="true"></asp:TextBox>
                    <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ControlToValidate="txtFirstName"
                            ErrorMessage="First name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revFirstName" runat="server" ControlToValidate="txtFirstName"
                            ErrorMessage="Only alphabets are allowed" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label>Last Name:</label>
                    <asp:TextBox ID="txtLastName" runat="server" required="true"></asp:TextBox>
                     <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ControlToValidate="txtLastName"
                            ErrorMessage="Last name is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revLastName" runat="server" ControlToValidate="txtLastName"
                            ErrorMessage="Only alphabets are allowed" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^[A-Za-z]+$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label>Email:</label>
                    <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" required="true"></asp:TextBox>
                     <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Enter a valid email address" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label>Password:</label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" required="true"></asp:TextBox>
                    <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="txtPassword"
                            ErrorMessage="Password must be at least 5 characters long" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^.{5,}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label>Phone Number:</label>
                    <asp:TextBox ID="txtPhoneNumber" runat="server" TextMode="Phone" required="true"></asp:TextBox>
                    <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhoneNumber"
                            ErrorMessage="Phone number is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revPhone" runat="server" ControlToValidate="txtPhoneNumber"
                            ErrorMessage="Enter a valid 10-digit phone number" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label>Aadhar ID:</label>
                    <asp:TextBox ID="txtAadhar" runat="server" required="true" TextMode="Number"></asp:TextBox>
                    <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvAadhar" runat="server" ControlToValidate="txtAadhar"
                            ErrorMessage="Aadhar ID is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="revAadhar" runat="server" ControlToValidate="txtAadhar"
                            ErrorMessage="Enter a valid 8-digit Aadhar number" ForeColor="Red" Display="Dynamic"
                            ValidationExpression="^\d{8}$"></asp:RegularExpressionValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label>Date of Birth:</label>
                    <asp:TextBox ID="txtDOB" runat="server" TextMode="Date" required="true"></asp:TextBox>
                    <div class="error-container">
                        <asp:RequiredFieldValidator ID="rfvDOB" runat="server" ControlToValidate="txtDOB"
                            ErrorMessage="Date of Birth is required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <asp:Button ID="btnSubmit" runat="server" Text="Register" CssClass="btn" OnClick="btnSubmit_Click" />
                <div class="login-link">
                    <p>Already have an account? <a href="GuestLoginPage.aspx">Login here</a></p>
                </div>
            </div>
    </main>
    </form>
</body>
</html>
