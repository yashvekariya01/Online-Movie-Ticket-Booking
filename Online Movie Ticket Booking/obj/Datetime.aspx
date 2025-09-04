<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Datetime.aspx.cs" Inherits="Online_Movie_Ticket_Booking.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style>
        /* Page background */
        .dt-page {
          min-height: 610px;
          background: linear-gradient(120deg, #0b0b0b, #141414 35%, #1a237e 70%, #880e4f);
          background-size: 200% 200%;
          animation: dtGradient 18s ease infinite;
          display: flex;
          align-items: flex-start;
          justify-content: center;
          padding: 30px 5%;
          box-sizing: border-box;
          font-family: 'Segoe UI', sans-serif;
        }
        @keyframes dtGradient {
          0% { background-position: 0% 50%; }
          50% { background-position: 100% 50%; }
          100% { background-position: 0% 50%; }
        }

        /* Form container (glass) */
        .dt-form {
          width: 100%;
          max-width: 1100px;
          background: rgba(255, 255, 255, 0.06);
          backdrop-filter: blur(10px);
          border-radius: 20px;
          padding: 28px;
          box-shadow: 0 12px 40px rgba(0,0,0,0.6);
        }

        /* Heading */
        .dt-heading {
          display: block;
          font-family: 'Buxton Sketch', cursive;
          font-size: 40px;
          color: #FFD54F;
          text-shadow: 0 0 16px rgba(255, 213, 79, 0.65);
          margin-bottom: 18px;
        }

        /* Layout */
        .dt-layout {
          display: grid;
          grid-template-columns: 1.2fr 0.8fr;
          gap: 28px;
          align-items: start;
        }
        .dt-left {
          background: rgba(255, 255, 255, 0.08);
          border: 1px solid rgba(255,255,255,0.08);
          border-radius: 16px;
          padding: 20px;
          box-shadow: 0 8px 24px rgba(0,0,0,0.5);
        }

        /* Calendar */
        .dt-calendar {
          width: 100%;
          max-width: 380px;
          margin: 0 auto 16px;
          border-collapse: separate !important;
          border-spacing: 0 !important;
          background: rgba(0,0,0,0.35);
          color: #fff;
          border-radius: 14px;
          overflow: hidden;
          box-shadow: 0 6px 18px rgba(0,0,0,0.6);
        }
        .dt-calendar td, .dt-calendar th {
          padding: 10px;
          text-align: center;
          border: 1px solid rgba(255,255,255,0.06);
        }
        .dt-calendar th {
          background: rgba(255,255,255,0.06);
          color: #e0e0e0;
          font-weight: 600;
        }
        .dt-calendar .today {
          background: rgba(255, 214, 79, 0.15) !important;
          outline: 1px solid rgba(255, 214, 79, 0.4);
        }
        .dt-calendar .selected {
          background: linear-gradient(135deg, #ff6f00, #ffd54f) !important;
          color: #111 !important;
          font-weight: 700;
        }

        /* Labels & Inputs */
        .dt-label {
          font-family: 'Buxton Sketch', cursive;
          font-size: 22px;
          color: #fff;
        }
        .dt-input {
          flex: 1 1 auto;
          min-width: 200px;
          padding: 10px 12px;
          border-radius: 12px;
          border: 1px solid rgba(255,255,255,0.15);
          background: rgba(255,255,255,0.12);
          color: #fff;
          outline: none;
        }
/* Dropdowns */
.dt-selects {
  display: grid;
  grid-template-columns: 1fr 1fr;
  gap: 12px;
  margin: 14px 0;
}
.dt-select {
  width: 100%;
  padding: 12px 14px;
  border-radius: 12px;
  border: 1px solid rgba(255,255,255,0.25);
  background: #222;        /* solid dark bg */
  color: #fff;             /* always visible text */
  font-size: 16px;
  appearance: none;        /* remove default arrow (optional) */
}
.dt-select option {
  background: #222;        /* background inside dropdown */
  color: #fff;             /* text color inside dropdown */
}
.dt-select:focus {
  outline: none;
  border-color: #FFD54F;   /* highlight when focused */
}
.dt-img {
  width: 520px;      /* medium size */
  max-width: 100%;   /* responsive on small screens */
  height: auto;      /* keep aspect ratio */
  border-radius: 12px; /* smooth premium corners */
  box-shadow: 0 4px 12px rgba(0,0,0,0.4); /* rich look */
  transition: transform 0.3s ease;
}
.dt-img:hover {
  transform: scale(1.05); /* subtle hover zoom */
}


        /* Responsive */
        @media (max-width: 900px) {
          .dt-layout { grid-template-columns: 1fr; }
        }
    </style>
<body>
  <div class="dt-page">
    <form id="form1" runat="server" class="dt-form">

      <asp:Label ID="Label1" runat="server" Text="Select Your Day :" CssClass="dt-heading"></asp:Label>

      <div class="dt-layout">
        <!-- Left: Calendar + controls -->
        <div class="dt-left">

          <asp:Calendar ID="Calendar1" runat="server" CssClass="dt-calendar"
            OnSelectionChanged="Calender1_SelectionChanged"></asp:Calendar>

          <div style="display:flex;align-items:center;gap:10px;margin:14px 0 6px;">
            <asp:Label ID="Label3" runat="server" Text="Selected date is :" CssClass="dt-label"></asp:Label>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="dt-input"></asp:TextBox>
          </div>

          <asp:Label ID="Label2" runat="server" Text="Select Time &amp; Theatre :" CssClass="dt-label"></asp:Label>

          <div class="dt-selects">
            <asp:DropDownList ID="DropDownList2" runat="server" CssClass="dt-select">
              <asp:ListItem>9:00 AM</asp:ListItem>
              <asp:ListItem>12:00 PM</asp:ListItem>
              <asp:ListItem>3:00 PM</asp:ListItem>
              <asp:ListItem>6:00 PM</asp:ListItem>
              <asp:ListItem>9:00 PM</asp:ListItem>
            </asp:DropDownList>

            <asp:DropDownList ID="DropDownList3" runat="server" CssClass="dt-select">
              <asp:ListItem>PVR Xperia</asp:ListItem>
              <asp:ListItem>Madhuban Talkies</asp:ListItem>
              <asp:ListItem>Tilak Talkies</asp:ListItem>
              <asp:ListItem>Gopi Talkies</asp:ListItem>
              <asp:ListItem>Anand Multiplex</asp:ListItem>
              <asp:ListItem>Hindamata Talkies</asp:ListItem>
            </asp:DropDownList>
          </div>

          <asp:Button ID="Button1" runat="server" Text="Book" CssClass="dt-btn" OnClick="Button1_Click" />

          <!-- Hidden -->
          <asp:TextBox ID="TextBox2" runat="server" Visible="False"></asp:TextBox>
        </div>

        <!-- Right: image -->
        <div class="dt-right">
          <img src="Models/Contents/5ef0fhb0zd_4rv9f70ht_vc009552.png" alt="Cinema" class="dt-img" />
        </div>
      </div>
    </form>
  </div>
</body>
</html>

</asp:Content>
