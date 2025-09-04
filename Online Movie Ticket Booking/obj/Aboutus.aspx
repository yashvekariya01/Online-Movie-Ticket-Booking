<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Aboutus.aspx.cs" Inherits="Online_Movie_Ticket_Booking.Aboutus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
    .about-wrapper {
        background: linear-gradient(135deg, #141E30, #243B55);
        padding: 60px 10%;
        color: #f5f5f5;
        font-family: 'Buxton Sketch', cursive;
        text-align: center;
    }

    .about-title {
        font-size: 70px;
        font-weight: bold;
        margin-bottom: 15px;
        color: #FFD700;
        text-shadow: 3px 3px 12px rgba(0,0,0,0.6);
        letter-spacing: 2px;
    }

    .about-subtitle {
        font-size: 38px;
        margin-bottom: 40px;
        color: #eee;
        text-shadow: 1px 1px 8px rgba(0,0,0,0.4);
    }

    .about-card {
        background: rgba(255,255,255,0.08);
        border-radius: 20px;
        padding: 40px;
        margin-bottom: 40px;
        box-shadow: 0 8px 20px rgba(0,0,0,0.4);
        text-align: justify;
        font-size: 22px;
        line-height: 1.8;
        color: #f0f0f0;
    }

    .about-card b {
        color: #FFD700;
    }

    .about-section-title {
        font-size: 30px;
        margin-top: 20px;
        color: #FFD700;
        font-weight: bold;
    }

    .about-footer {
        margin-top: 50px;
        font-size: 26px;
        color: #fff;
    }

    .about-heart {
        font-size: 30px;
        color: crimson;
        margin-left: 8px;
    }
</style>

<div class="about-wrapper">
    <h1 class="about-title">About Us</h1>
    <h2 class="about-subtitle">Hello Everyone 👋</h2>

    <div class="about-card">
        Welcome to our <b>Online Movie Ticket Booking System</b> – a project created with passion and teamwork by 
        <b>Jalpit, Yash, and Jiya</b>.
        <br /><br />
        We are enthusiastic <b>BCA students from Marwadi University</b>, working together on our Final Year Project. 
        Our goal is to make the movie ticket booking experience <b>simple, fast, and user-friendly</b>.
        <br /><br />
        With this system, you can browse the <b>latest movies</b>, check <b>showtimes</b>, and book your favorite <b>seats hassle-free</b>.  
        We’ve designed it with <b>reliability, accuracy, and convenience</b> in mind, so you can enjoy the magic of cinema with just a few clicks.
    </div>

    <div class="about-card">
        <div class="about-section-title">✨ Our Mission</div>
        <p>To provide an <b>easy and efficient</b> way for users to book tickets online, ensuring a smooth experience from selection to confirmation.</p>
        
        <div class="about-section-title">✨ Our Vision</div>
        <p>To bring <b>technology and entertainment</b> together, making movie nights more enjoyable and stress-free.</p>
    </div>

    <div class="about-footer">
        I hope you liked this!! Thank You So Much!! <span class="about-heart">❤</span>
    </div>
</div>
</asp:Content>
