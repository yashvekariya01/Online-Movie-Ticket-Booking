<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Online_Movie_Ticket_Booking.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <form id="form1" runat="server">
    <div class="home-page">

        <div class="logout-btn">
            <asp:Button ID="Button2" runat="server" Text="Log Out" 
                PostBackUrl="~/Login.aspx" CssClass="btn-logout" />
        </div>

        <h1 class="home-title">Select your movie!!! 🎥🎬🍿</h1>

        <asp:DataList ID="DataList1" runat="server" 
            DataKeyField="MoviesID" DataSourceID="SqlDataSource1" 
            RepeatDirection="Horizontal" RepeatColumns="5"
            OnItemCommand="DataList1_ItemCommand" CssClass="movie-grid">

            <ItemTemplate>
                <div class="movie-card">
                    <asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("MovieName") %>' CssClass="movie-title"></asp:Label>
                    
                    <asp:ImageButton ID="ImageButton1" runat="server" 
                        CommandName="Img" ImageUrl='<%# Eval("MPoster") %>' 
                        CommandArgument='<%# Eval("MoviesID") %>' 
                        CssClass="movie-poster" />
                </div>
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OMTBSConnection %>" 
            SelectCommand="SELECT * FROM [Movies]"></asp:SqlDataSource>

    </div>
</form>

<style>
    /* Background */
    .home-page {
        min-height: 100vh;
        background: linear-gradient(-45deg, #0d0d0d, #1a1a1a, #0d47a1, #b71c1c);
        background-size: 400% 400%;
        animation: gradientBG 15s ease infinite;
        padding: 40px;
        text-align: center;
    }
    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    /* Logout button */
    .logout-btn {
        text-align: right;
        margin-bottom: 20px;
        padding-right: 5%;
    }
    .btn-logout {
        background: transparent;
        border: none;
        font-family: 'Buxton Sketch', cursive;
        font-size: 24px;
        font-weight: bold;
        color: #ffcc00;
        cursor: pointer;
        text-decoration: underline;
        transition: all 0.3s ease;
    }
    .btn-logout:hover {
        color: #ff4444;
        transform: scale(1.1);
    }

    /* Page Title */
    .home-title {
        font-family: 'Buxton Sketch', cursive;
        font-size: 42px;
        color: #fff;
        font-weight: bold;
        margin: 20px 0 40px;
        text-shadow: 0 0 12px #ffcc00, 0 0 25px #ff6600;
    }

    /* Movies Grid */
    .movie-grid {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 25px;
    }

    /* Movie Card */
    .movie-card {
        background: rgba(255, 255, 255, 0.1);
        border-radius: 18px;
        padding: 15px;
        width: 230px;
        text-align: center;
        box-shadow: 0 6px 15px rgba(0,0,0,0.6);
        transition: transform 0.4s ease, box-shadow 0.4s ease;
    }
    .movie-card:hover {
        transform: scale(1.07);
        box-shadow: 0 0 25px rgba(255, 204, 0, 0.9);
    }

    /* Movie Title */
    .movie-title {
        display: block;
        font-family: 'Buxton Sketch', cursive;
        font-size: 20px;
        font-weight: bold;
        color: #fff;
        margin-bottom: 10px;
    }

    /* Poster */
    .movie-poster {
        width: 200px;
        height: 300px;
        border-radius: 12px;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .movie-poster:hover {
        transform: scale(1.05);
        box-shadow: 0 0 20px rgba(255, 87, 34, 0.8);
    }
</style>

    </asp:Content>
