<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Online_Movie_Ticket_Booking.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <form>
        <div class="welcome-container">
            <h1 class="title">🍿 Welcome to Movie World</h1>
            <p class="subtitle">Book tickets for your favourite blockbuster in seconds!</p>

            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Login.aspx" CssClass="btn-login">
                🎟 Book Now
            </asp:HyperLink>

            <div class="image-container">
                <asp:Image ID="Image1" runat="server" 
                    ImageUrl="~/Models/Contents/e48ee6e89d67af5e685225cf49b59bfc_technology-movie-film-buildings-cinema-building-icon_512-512.png" 
                    CssClass="cinema-img" />
            </div>
        </div>
    </form>

    <style>
        /* Landing Container */
        .welcome-container {
            min-height: 600px;
            text-align: center;
            padding: 60px 20px;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;

            background: radial-gradient(circle at top, #0d0d0d, #1a1a1a, #000);
            color: #fff;
            animation: fadeIn 1.5s ease-in-out;
        }

        /* Title */
        .title {
            font-family: 'Trebuchet MS', sans-serif;
            font-size: 64px;
            font-weight: 700;
            color: #ffcc00;
            text-shadow: 0 0 15px #ffcc00, 0 0 30px #ff9900;
            margin-bottom: 20px;
            animation: slideDown 1.2s ease-out;
        }

        /* Subtitle */
        .subtitle {
            font-size: 26px;
            font-weight: 300;
            color: #ccc;
            margin-bottom: 50px;
            animation: fadeInUp 1.4s ease-in-out;
        }

        /* Button */
        .btn-login {
            display: inline-block;
            padding: 18px 40px;
            font-size: 24px;
            font-weight: bold;
            color: #fff;
            background: linear-gradient(90deg, #e50914, #b81d24);
            border-radius: 50px;
            text-decoration: none;
            box-shadow: 0 0 20px rgba(229, 9, 20, 0.7);
            transition: transform 0.3s, box-shadow 0.3s;
            animation: pulse 2.5s infinite;
        }

        .btn-login:hover {
            transform: scale(1.1);
            box-shadow: 0 0 40px rgba(255, 20, 60, 0.9);
        }

        /* Image */
        .image-container {
            margin-top: 50px;
        }

        .cinema-img {
            width: 280px;
            height: auto;
            border-radius: 20px;
            box-shadow: 0 0 25px rgba(255, 255, 255, 0.3);
            animation: bounceIn 1.6s ease;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        @keyframes slideDown {
            from { transform: translateY(-80px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes fadeInUp {
            from { transform: translateY(60px); opacity: 0; }
            to { transform: translateY(0); opacity: 1; }
        }

        @keyframes bounceIn {
            0% { transform: scale(0.3); opacity: 0; }
            60% { transform: scale(1.2); opacity: 1; }
            100% { transform: scale(1); }
        }

        @keyframes pulse {
            0% { transform: scale(1); box-shadow: 0 0 20px rgba(229,9,20,0.6); }
            50% { transform: scale(1.05); box-shadow: 0 0 35px rgba(229,9,20,0.9); }
            100% { transform: scale(1); box-shadow: 0 0 20px rgba(229,9,20,0.6); }
        }
    </style>
</asp:Content>
