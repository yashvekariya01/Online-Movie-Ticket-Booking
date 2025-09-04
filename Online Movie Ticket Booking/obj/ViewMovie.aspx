<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="ViewMovie.aspx.cs" Inherits="Online_Movie_Ticket_Booking.ViewMovie" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="booking-page">
    <form id="form1" runat="server" class="booking-form">
        
        <h1 class="booking-title">Want to book this movie ?</h1>

        <asp:DataList ID="DataList1" runat="server" 
            DataKeyField="MoviesID" DataSourceID="SqlDataSource1" 
            RepeatDirection="Horizontal" 
            OnItemCommand="DataList1_ItemCommand" 
            CssClass="movie-detail-box">

            <ItemTemplate>
                <div class="movie-detail-card">
                    <!-- Movie Title -->
                    <asp:Label ID="lblMovieName" runat="server" 
    Text='<%# Eval("MovieName") %>' CssClass="movie-name" />


                    <div class="movie-info">
                        <!-- Poster -->
                        <asp:Image ID="Image1" runat="server" 
                            CssClass="movie-poster" 
                            ImageUrl='<%# Eval("MPoster") %>' />

                        <!-- Details -->
                        <div class="movie-description">
                            <p><%# Eval("Description") %></p>
                            <asp:Label ID="lblLanguage" runat="server" 
    Text='<%# Eval("Language") %>' CssClass="movie-value" />

                        </div>
                    </div>

                    <!-- Price & Book Button -->
                    <div class="movie-footer">
                        <span class="movie-price">₹ <%# Eval("Price") %></span>
                        <asp:Button ID="btnbooknow" runat="server" 
                            CommandName="btnbook" 
                            CommandArgument='<%# Eval("MoviesID") %>' 
                            Text="Book Now" CssClass="btn-book"/>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:OMTBSConnection %>" 
            SelectCommand="SELECT * FROM [Movies] WHERE ([MoviesID] = @MoviesID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MoviesID" QueryStringField="ID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</div>

<style>
    /* Page background */
    .booking-page {
        min-height: 100vh;
        background: linear-gradient(-45deg, #0d0d0d, #1a1a1a, #0d47a1, #880e4f);
        background-size: 400% 400%;
        animation: gradientBG 15s ease infinite;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        padding: 40px;
    }
    @keyframes gradientBG {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    .booking-form {
        width: 80%;
        background: rgba(255, 255, 255, 0.08);
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0 6px 25px rgba(0,0,0,0.7);
    }

    /* Title */
    .booking-title {
        font-family: 'Buxton Sketch', cursive;
        font-size: 38px;
        font-weight: bold;
        color: #fff;
        text-align: center;
        margin-bottom: 30px;
        text-shadow: 0 0 12px #ffcc00, 0 0 20px #ff6600;
    }

    /* Movie Card */
    .movie-detail-card {
        background: rgba(255, 255, 255, 0.15);
        border-radius: 16px;
        padding: 25px;
        color: #fff;
        box-shadow: 0 4px 15px rgba(0,0,0,0.5);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .movie-detail-card:hover {
        transform: scale(1.02);
        box-shadow: 0 0 20px rgba(255, 204, 0, 0.8);
    }

    /* Movie Title */
    .movie-name {
        font-family: 'Buxton Sketch', cursive;
        font-size: 28px;
        text-align: center;
        margin-bottom: 20px;
        color: #ffcc00;
        text-shadow: 0 0 8px #000;
    }

    /* Layout for poster + details */
    .movie-info {
        display: flex;
        gap: 20px;
        align-items: flex-start;
        justify-content: center;
        margin-bottom: 20px;
    }

    .movie-poster {
        width: 230px;
        height: 340px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.6);
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .movie-poster:hover {
        transform: scale(1.05);
        box-shadow: 0 0 25px rgba(255,87,34,0.9);
    }

    .movie-description {
        font-family: 'Buxton Sketch', cursive;
        font-size: 20px;
        line-height: 1.6;
        max-width: 500px;
        color: #f2f2f2;
    }

    /* Footer with price + button */
    .movie-footer {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-top: 15px;
    }

    .movie-price {
        font-size: 26px;
        font-weight: bold;
        color: #00e676;
        text-shadow: 0 0 8px #000;
    }

    .btn-book {
        background: linear-gradient(135deg, #ff4444, #ffcc00);
        border: none;
        padding: 12px 30px;
        border-radius: 12px;
        font-size: 22px;
        font-weight: bold;
        color: #000;
        cursor: pointer;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }
    .btn-book:hover {
        transform: scale(1.1);
        box-shadow: 0 0 20px rgba(255,255,255,0.8);
    }
</style>


</asp:Content>
