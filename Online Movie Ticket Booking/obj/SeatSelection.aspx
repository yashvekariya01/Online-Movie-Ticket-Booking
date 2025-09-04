<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="SeatSelection.aspx.cs" Inherits="Online_Movie_Ticket_Booking.SeatSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <form id="form1" runat="server">
        <style>
            .page-container {
    min-height: 595px;
    background: #121212;  /* Dark background */
    padding: 30px;
    text-align: center;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    color: #f1f1f1;
}

.title {
    font-size: 36px;
    font-weight: bold;
    margin-bottom: 20px;
    color: #ffcc00;   /* golden title to pop */
    letter-spacing: 1px;
}

.screen {
    font-size: 18px;
    font-weight: bold;
    margin: 20px auto;
    width: 65%;
    padding: 12px;
    border-radius: 8px;
    background: linear-gradient(to right, #333, #555);
    color: #f1f1f1;
    text-transform: uppercase;
    letter-spacing: 3px;
    box-shadow: 0 3px 6px rgba(0,0,0,0.5);
}

.seats-container {
    display: grid;
    grid-template-columns: repeat(11, 1fr);
    gap: 12px;
    justify-content: center;
    margin: 20px auto;
    width: 85%;
}

.seat-btn {
    width: 45px;
    height: 45px;
    border: none;
    border-radius: 8px;
    background: #2c2c2c;
    color: #bbb;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    box-shadow: 0 2px 5px rgba(0,0,0,0.4);
    transition: all 0.25s ease;
}

.seat-btn:hover {
    background: #1976d2;
    color: #fff;
    transform: scale(1.08);
}

/* Selected Seat */
.seat-selected {
    background: #4caf50 !important;
    color: #fff !important;
    box-shadow: 0 3px 8px rgba(0,0,0,0.6);
}

/* Book Button */
.book-btn {
    margin-top: 30px;
    width: 220px;
    height: 55px;
    font-size: 22px;
    font-weight: bold;
    border-radius: 10px;
    background: linear-gradient(to right, #ff6f00, #ff9800);
    color: white;
    border: none;
    cursor: pointer;
    box-shadow: 0 4px 12px rgba(0,0,0,0.6);
    transition: all 0.3s ease;
}

.book-btn:hover {
    background: linear-gradient(to right, #e65100, #ff8f00);
    transform: scale(1.07);
}

.exit-label {
    font-size: 18px;
    font-weight: bold;
    color: #ff4444;
    margin-top: 15px;
}


        </style>

        <div class="page-container">
            <div class="title">Select your seats... 🪑🪑🪑</div>

            <div class="screen">SCREEN</div>

            <div class="seats-container">
                <!-- First Row -->
                <asp:Button ID="Button1" runat="server" Text="01" CssClass="seat-btn" OnClick="Button1_Click" />
                <asp:Button ID="Button2" runat="server" Text="02" CssClass="seat-btn" OnClick="Button2_Click" />
                <asp:Button ID="Button3" runat="server" Text="03" CssClass="seat-btn" OnClick="Button3_Click" />
                <asp:Button ID="Button4" runat="server" Text="04" CssClass="seat-btn" OnClick="Button4_Click" />
                <asp:Button ID="Button5" runat="server" Text="05" CssClass="seat-btn" OnClick="Button5_Click" />
                <asp:Button ID="Button6" runat="server" Text="06" CssClass="seat-btn" OnClick="Button6_Click" />
                <asp:Button ID="Button7" runat="server" Text="07" CssClass="seat-btn" OnClick="Button7_Click" />
                <asp:Button ID="Button8" runat="server" Text="08" CssClass="seat-btn" OnClick="Button8_Click" />
                <asp:Button ID="Button9" runat="server" Text="09" CssClass="seat-btn" OnClick="Button9_Click" />
                <asp:Button ID="Button10" runat="server" Text="10" CssClass="seat-btn" OnClick="Button10_Click" />
                <asp:Button ID="Button11" runat="server" Text="11" CssClass="seat-btn" OnClick="Button11_Click" />

                <!-- Second Row -->
                <asp:Button ID="Button12" runat="server" Text="12" CssClass="seat-btn" OnClick="Button12_Click" />
                <asp:Button ID="Button13" runat="server" Text="13" CssClass="seat-btn" OnClick="Button13_Click" />
                <asp:Button ID="Button14" runat="server" Text="14" CssClass="seat-btn" OnClick="Button14_Click" />
                <asp:Button ID="Button15" runat="server" Text="15" CssClass="seat-btn" OnClick="Button15_Click" />
                <asp:Button ID="Button16" runat="server" Text="16" CssClass="seat-btn" OnClick="Button16_Click" />
                <asp:Button ID="Button17" runat="server" Text="17" CssClass="seat-btn" OnClick="Button17_Click" />
                <asp:Button ID="Button18" runat="server" Text="18" CssClass="seat-btn" OnClick="Button18_Click" />
                <asp:Button ID="Button19" runat="server" Text="19" CssClass="seat-btn" OnClick="Button19_Click" />
                <asp:Button ID="Button20" runat="server" Text="20" CssClass="seat-btn" OnClick="Button20_Click" />
                <asp:Button ID="Button21" runat="server" Text="21" CssClass="seat-btn" OnClick="Button21_Click" />
                <asp:Button ID="Button22" runat="server" Text="22" CssClass="seat-btn" OnClick="Button22_Click" />

                <!-- Third Row -->
                <asp:Button ID="Button23" runat="server" Text="23" CssClass="seat-btn" OnClick="Button23_Click" />
                <asp:Button ID="Button24" runat="server" Text="24" CssClass="seat-btn" OnClick="Button24_Click" />
                <asp:Button ID="Button25" runat="server" Text="25" CssClass="seat-btn" OnClick="Button25_Click" />
                <asp:Button ID="Button26" runat="server" Text="26" CssClass="seat-btn" OnClick="Button26_Click" />
                <asp:Button ID="Button27" runat="server" Text="27" CssClass="seat-btn" OnClick="Button27_Click" />
                <asp:Button ID="Button28" runat="server" Text="28" CssClass="seat-btn" OnClick="Button28_Click" />
                <asp:Button ID="Button29" runat="server" Text="29" CssClass="seat-btn" OnClick="Button29_Click" />
                <asp:Button ID="Button30" runat="server" Text="30" CssClass="seat-btn" OnClick="Button30_Click" />
                <asp:Button ID="Button31" runat="server" Text="31" CssClass="seat-btn" OnClick="Button31_Click" />
                <asp:Button ID="Button32" runat="server" Text="32" CssClass="seat-btn" OnClick="Button32_Click" />
                <asp:Button ID="Button33" runat="server" Text="33" CssClass="seat-btn" OnClick="Button33_Click" />

                <!-- Fourth Row -->
                <asp:Button ID="Button34" runat="server" Text="34" CssClass="seat-btn" OnClick="Button34_Click" />
                <asp:Button ID="Button35" runat="server" Text="35" CssClass="seat-btn" OnClick="Button35_Click" />
                <asp:Button ID="Button36" runat="server" Text="36" CssClass="seat-btn" OnClick="Button36_Click" />
                <asp:Button ID="Button37" runat="server" Text="37" CssClass="seat-btn" OnClick="Button37_Click" />
                <asp:Button ID="Button38" runat="server" Text="38" CssClass="seat-btn" OnClick="Button38_Click" />
                <asp:Button ID="Button39" runat="server" Text="39" CssClass="seat-btn" OnClick="Button39_Click" />
                <asp:Button ID="Button40" runat="server" Text="40" CssClass="seat-btn" OnClick="Button40_Click" />
                <asp:Button ID="Button41" runat="server" Text="41" CssClass="seat-btn" OnClick="Button41_Click" />
                <asp:Button ID="Button42" runat="server" Text="42" CssClass="seat-btn" OnClick="Button42_Click" />
                <asp:Button ID="Button43" runat="server" Text="43" CssClass="seat-btn" OnClick="Button43_Click" />
                <asp:Button ID="Button44" runat="server" Text="44" CssClass="seat-btn" OnClick="Button44_Click" />

                <!-- Fifth Row -->
                <asp:Button ID="Button45" runat="server" Text="45" CssClass="seat-btn" OnClick="Button45_Click" />
                <asp:Button ID="Button46" runat="server" Text="46" CssClass="seat-btn" OnClick="Button46_Click" />
                <asp:Button ID="Button47" runat="server" Text="47" CssClass="seat-btn" OnClick="Button47_Click" />
                <asp:Button ID="Button48" runat="server" Text="48" CssClass="seat-btn" OnClick="Button48_Click" />
                <asp:Button ID="Button49" runat="server" Text="49" CssClass="seat-btn" OnClick="Button49_Click" />
                <asp:Button ID="Button50" runat="server" Text="50" CssClass="seat-btn" OnClick="Button50_Click" />
                <asp:Button ID="Button51" runat="server" Text="51" CssClass="seat-btn" OnClick="Button51_Click" />
                <asp:Button ID="Button52" runat="server" Text="52" CssClass="seat-btn" OnClick="Button52_Click" />
                <asp:Button ID="Button53" runat="server" Text="53" CssClass="seat-btn" OnClick="Button53_Click" />
                <asp:Button ID="Button54" runat="server" Text="54" CssClass="seat-btn" OnClick="Button54_Click" />
                <asp:Button ID="Button55" runat="server" Text="55" CssClass="seat-btn" OnClick="Button55_Click" />
            </div>

            <asp:Button runat="server" Text="Book Now" ID="btnbook" CssClass="book-btn" OnClick="btnbook_Click" />

            <div class="exit-label">Exit ⬇</div>
        </div>
    </form>
</asp:Content>
