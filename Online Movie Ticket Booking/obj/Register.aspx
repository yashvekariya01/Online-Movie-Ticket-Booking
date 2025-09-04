<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Online_Movie_Ticket_Booking.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
     <div class="register-page">
    <form id="form1" runat="server" class="register-form">
        <h1 class="register-title">📝 New Registration</h1>

        <div class="form-group">
            <asp:Label ID="Label1" runat="server" Text="Email ID :" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="*Required" CssClass="error"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="Label2" runat="server" Text="Password :" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox4" ErrorMessage="*Required" CssClass="error"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="Label3" runat="server" Text="Confirm Password :" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator2" runat="server" 
                ControlToCompare="TextBox4" ControlToValidate="TextBox1" 
                ErrorMessage="Passwords don’t match" CssClass="error"></asp:CompareValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="Label4" runat="server" Text="Full Name :" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="form-input"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBox5" ErrorMessage="*Required" CssClass="error"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="Label5" runat="server" Text="Mobile No :" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server" CssClass="form-input" TextMode="Phone"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ControlToValidate="TextBox6" ErrorMessage="Enter valid number" 
                ValidationExpression="^([6-9]{1})([0-9]{9})$" CssClass="error"></asp:RegularExpressionValidator>
        </div>

        <asp:Button ID="Button1" runat="server" CssClass="btn-register" Text="Register" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" CssClass="btn-reset" Text="Reset" 
            OnClientClick="this.form.reset();return false;" CausesValidation="false" />

        <div class="login-link">
            Already have an account? 
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="Login.aspx">Log in here</asp:HyperLink>
        </div>
    </form>
</div>


<style>
    /* Background same as login */
    .register-page {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background: linear-gradient(-45deg, #000000, #1a1a1a, #0d47a1, #b71c1c);
        background-size: 400% 400%;
        animation: gradientBG 14s ease infinite;
        padding: 20px;
    }
    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    /* Card */
    .register-form {
        background: rgba(20, 20, 20, 0.7);
        padding: 35px;
        border-radius: 20px;
        backdrop-filter: blur(14px);
        box-shadow: 0px 8px 25px rgba(0,0,0,0.6);
        text-align: center;
        width: 100%;
        max-width: 500px;
        animation: fadeInUp 1s ease;
    }

    .register-title {
        font-family: 'Trebuchet MS', sans-serif;
        font-size: 38px;
        font-weight: bold;
        color: #ffcc00;
        margin-bottom: 25px;
        text-shadow: 0 0 12px #ffcc00, 0 0 25px #ff9900;
    }

    .form-group {
        margin-bottom: 20px;
        text-align: left;
    }

    .form-label {
        font-size: 16px;
        font-weight: 600;
        color: #fff;
        display: block;
        margin-bottom: 6px;
    }

    .form-input {
        width: 100%;
        padding: 12px;
        font-size: 16px;
        border: none;
        border-radius: 10px;
        outline: none;
        background: rgba(255,255,255,0.15);
        color: #fff;
        transition: all 0.3s ease;
    }
    .form-input:focus {
        background: rgba(255,255,255,0.25);
        box-shadow: 0px 0px 12px #ff4081;
    }

    /* Buttons */
    .btn-register, .btn-reset {
        background: linear-gradient(90deg, #e50914, #ff5722);
        border: none;
        color: white;
        font-size: 18px;
        font-weight: bold;
        padding: 12px;
        border-radius: 50px;
        cursor: pointer;
        transition: transform 0.3s, box-shadow 0.3s;
        margin-top: 10px;
        margin-right: 10px;
        width: 48%;
        box-shadow: 0 0 15px rgba(229, 9, 20, 0.6);
    }
    .btn-register:hover, .btn-reset:hover {
        transform: scale(1.07);
        box-shadow: 0 0 30px rgba(255, 87, 34, 0.9);
    }

    /* Error */
    .error {
        color: #ff5252;
        font-size: 13px;
        display: block;
        margin-top: 4px;
    }

    /* Link */
    .login-link {
        margin-top: 18px;
        font-size: 15px;
        color: #ccc;
    }
    .login-link a {
        color: #ffcc00;
        text-decoration: none;
        font-weight: bold;
    }
    .login-link a:hover {
        text-decoration: underline;
    }

    @keyframes fadeInUp {
        from { transform: translateY(60px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }
</style>
+
</asp:Content>
