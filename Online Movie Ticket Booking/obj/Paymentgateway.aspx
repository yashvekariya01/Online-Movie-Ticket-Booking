<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Paymentgateway.aspx.cs" Inherits="Online_Movie_Ticket_Booking.WebForm4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<style>
        body {
            background: linear-gradient(135deg, #0f0f0f, #1e1e2f);
            font-family: 'Segoe UI', sans-serif;
            color: #fff;
        }

        .payment-container {
            width: 500px;
            margin: 60px auto;
            padding: 35px;
            background: rgba(25, 25, 40, 0.95);
            border-radius: 18px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.7);
            backdrop-filter: blur(10px);
            text-align: center;
            animation: fadeIn 0.8s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .payment-title {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 25px;
            color: #ffcc00;
            letter-spacing: 1px;
        }

        .form-group {
            text-align: left;
            margin-bottom: 20px;
        }

        .form-label {
            font-size: 15px;
            font-weight: 600;
            color: #ccc;
            display: block;
            margin-bottom: 6px;
        }

        .form-input {
            width: 100%;
            padding: 12px;
            border: 1px solid #444;
            border-radius: 12px;
            font-size: 15px;
            background: #121222;
            color: #fff;
            transition: all 0.3s ease;
        }

        .form-input:focus {
            border-color: #ffcc00;
            box-shadow: 0 0 8px rgba(255, 204, 0, 0.6);
            outline: none;
        }

        .btn-pay {
            width: 100%;
            padding: 14px;
            margin-top: 10px;
            background: linear-gradient(90deg, #ffcc00, #ff9900);
            border: none;
            border-radius: 12px;
            font-size: 18px;
            font-weight: bold;
            color: #000;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.3s;
        }

        .btn-pay:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 15px rgba(255, 204, 0, 0.4);
        }

        .card-logos {
            display: flex;
            justify-content: center;
            margin-top: 20px;
            gap: 25px;
        }

        .card-logos img {
            height: 45px;
            filter: brightness(0.8);
            transition: transform 0.3s, filter 0.3s;
        }

        .card-logos img:hover {
            transform: scale(1.15);
            filter: brightness(1);
        }

        .error-msg {
            font-size: 13px;
            color: #ff4444;
        }
    </style>

    <form id="form1" runat="server">
        <div class="payment-container">
            <h2 class="payment-title">💳 Secure Payment</h2>

            <div class="form-group">
                <label class="form-label">Card Number</label>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-input" placeholder="xxxx xxxx xxxx xxxx"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*Required Field" ForeColor="Red" CssClass="error-msg"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Enter valid 16-digit card number." ForeColor="Red" ValidationExpression="^[\d]{16}$" CssClass="error-msg"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label class="form-label">Expiry Date (MM/YYYY)</label>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="form-input" placeholder="MM/YYYY"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="*Required Field" ForeColor="Red" CssClass="error-msg"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <label class="form-label">CVV</label>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-input" placeholder="123"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="*Required Field" ForeColor="Red" CssClass="error-msg"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Enter valid 3-digit CVV." ForeColor="Red" ValidationExpression="^[\d]{3}$" CssClass="error-msg"></asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <label class="form-label">Cardholder Name</label>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="form-input" placeholder="Full Name"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox4" ErrorMessage="*Required Field" ForeColor="Red" CssClass="error-msg"></asp:RequiredFieldValidator>
            </div>

            <asp:Button ID="Button1" runat="server" CssClass="btn-pay" Text="Pay Now" OnClick="Button1_Click" />

            <div class="card-logos">
                <asp:Image runat="server" ImageUrl="~/Models/Contents/Rupay-Logo.png" />
                <asp:Image runat="server" ImageUrl="~/Models/Contents/Visa_Logo.png" />
                <asp:Image runat="server" ImageUrl="~/Models/Contents/1280px-Mastercard-logo.svg.png" />
            </div>
        </div>
    </form>

</asp:Content>
