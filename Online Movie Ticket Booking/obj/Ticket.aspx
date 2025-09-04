<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Ticket.aspx.cs" Inherits="Online_Movie_Ticket_Booking.Ticket" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Ticket</title>
    <style>
        body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: #121212; /* Dark theme background */
    margin: 0;
    padding: 0;
    color: #f1f1f1;
}

.ticket {
    width: 550px;
    margin: 60px auto;
    background: linear-gradient(145deg, #1e1e1e, #2a2a2a);
    padding: 25px;
    border-radius: 16px;
    box-shadow: 0px 6px 20px rgba(0,0,0,0.7);
    border: 1px solid #333;
    position: relative;
    overflow: hidden;
}

.ticket::before {
    content: "";
    position: absolute;
    top: 0; left: 0; right: 0; bottom: 0;
    border-radius: 16px;
    border: 2px dashed rgba(255,255,255,0.1); /* like a real ticket cut-line */
    pointer-events: none;
}

.ticket h2 {
    text-align: center;
    color: #ffcc00; /* Golden headline */
    font-size: 28px;
    margin-bottom: 15px;
    letter-spacing: 1px;
}

.ticket p, .ticket asp\:Label {
    font-size: 17px;
    margin: 12px 0;
    color: #ddd;
}

.highlight {
    display: block;
    font-size: 20px;
    font-weight: bold;
    color: #4caf50; /* Green for Ticket Number */
    text-align: center;
    margin-top: 12px;
}

hr {
    border: none;
    border-top: 1px dashed #555;
    margin: 20px 0;
}

.footer {
    text-align: center;
    margin-top: 25px;
}

.btn-home {
    display: inline-block;
    padding: 12px 26px;
    background: linear-gradient(to right, #ff6f00, #ff9800);
    color: white;
    text-decoration: none;
    font-size: 16px;
    border-radius: 10px;
    font-weight: bold;
    box-shadow: 0 4px 12px rgba(0,0,0,0.5);
    transition: all 0.3s ease;
}

.btn-home:hover {
    background: linear-gradient(to right, #e65100, #ff8f00);
    transform: scale(1.07);
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="ticket">
            <h2>🎟 Movie Ticket</h2>
            <asp:Label ID="lblDetails" runat="server"></asp:Label>
            <asp:Label ID="lblTicketNo" runat="server" CssClass="highlight"></asp:Label>
            <hr />
            <p style="text-align:center; font-size:14px; color:gray;">
                Please show this ticket at the theatre entrance
            </p>
            <div class="footer">
                <asp:HyperLink ID="lnkHome" runat="server" CssClass="btn-home" NavigateUrl="~/Home.aspx">🏠 Go Back Home</asp:HyperLink>
            </div>
        </div>
    </form>
</body>