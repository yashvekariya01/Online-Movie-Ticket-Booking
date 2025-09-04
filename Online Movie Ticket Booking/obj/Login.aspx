<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Online_Movie_Ticket_Booking.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     
   <div class="login-page">
    <form id="form2" runat="server" class="login-form">
        <h1 class="login-title">🎬 Log In</h1>

        <div class="form-group">
            <asp:Label ID="Label6" runat="server" Text="Email ID :" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="*Required Field" CssClass="error"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox3" ErrorMessage="Enter valid Email ID." 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="error"></asp:RegularExpressionValidator>
        </div>

        <div class="form-group">
            <asp:Label ID="Label7" runat="server" Text="Password :" CssClass="form-label"></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox4" ErrorMessage="*Required Field" CssClass="error"></asp:RequiredFieldValidator>
        </div>

        <asp:Button ID="Button2" runat="server" Text="Log In" CssClass="btn-login" OnClick="Button2_Click" />

        <div class="signup-link">
            <asp:Label ID="Label9" runat="server" Text="New User ?"></asp:Label>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Sign Up</asp:HyperLink>
        </div>

        <asp:Label ID="Label11" runat="server" CssClass="error-msg" Visible="false">Invalid Credentials!</asp:Label>

        <div class="image-box">
            <img src="Models/Contents/PicsArt_03-06-07.15.35.png" alt="Cinema" />
        </div>
    </form>
</div>

<style>
    /* Background animation */
    .login-page {
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

    /* Login Card */
    .login-form {
        background: rgba(20, 20, 20, 0.7);
        padding: 35px;
        border-radius: 20px;
        backdrop-filter: blur(14px);
        box-shadow: 0px 8px 25px rgba(0,0,0,0.6);
        text-align: center;
        width: 100%;
        max-width: 420px;
        animation: fadeInUp 1s ease;
    }

    .login-title {
        font-family: 'Trebuchet MS', sans-serif;
        font-size: 42px;
        font-weight: bold;
        color: #ffcc00;
        margin-bottom: 25px;
        text-shadow: 0 0 12px #ffcc00, 0 0 25px #ff9900;
    }

    /* Form */
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

    /* Login Button */
    .btn-login {
        background: linear-gradient(90deg, #e50914, #ff5722);
        border: none;
        color: white;
        font-size: 20px;
        font-weight: bold;
        padding: 14px;
        border-radius: 50px;
        cursor: pointer;
        transition: transform 0.3s, box-shadow 0.3s;
        margin-top: 15px;
        width: 100%;
        box-shadow: 0 0 15px rgba(229, 9, 20, 0.6);
    }

    .btn-login:hover {
        transform: scale(1.07);
        box-shadow: 0 0 30px rgba(255, 87, 34, 0.9);
    }

    /* Error Messages */
    .error {
        color: #ff5252;
        font-size: 13px;
        display: block;
        margin-top: 4px;
    }

    .error-msg {
        color: #ff1744;
        font-size: 16px;
        margin-top: 12px;
        font-weight: 600;
    }

    /* Sign Up Link */
    .signup-link {
        margin-top: 18px;
        font-size: 15px;
        color: #ccc;
    }

    .signup-link a {
        color: #ffcc00;
        text-decoration: none;
        font-weight: bold;
    }

    .signup-link a:hover {
        text-decoration: underline;
    }

    /* Image */
    .image-box {
        margin-top: 25px;
    }

    .image-box img {
        width: 120px;
        animation: bounceIn 1.5s ease;
        filter: drop-shadow(0 0 12px rgba(255, 255, 255, 0.4));
    }

    /* Animations */
    @keyframes fadeInUp {
        from { transform: translateY(60px); opacity: 0; }
        to { transform: translateY(0); opacity: 1; }
    }

    @keyframes bounceIn {
        0% { transform: scale(0.5); opacity: 0; }
        60% { transform: scale(1.2); opacity: 1; }
        100% { transform: scale(1); }
    }

    /* ✅ Responsive */
    @media (max-width: 480px) {
        .login-form {
            padding: 25px;
        }
        .login-title {
            font-size: 32px;
        }
        .form-input {
            font-size: 14px;
        }
        .btn-login {
            font-size: 18px;
        }
    }
</style>


    
</asp:Content>