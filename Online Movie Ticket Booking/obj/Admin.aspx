<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="Online_Movie_Ticket_Booking.Admin" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin - Manage Movies</title>
    <style>
    body {
        font-family: 'Segoe UI', sans-serif;
        margin: 0;
        padding: 0;
        background: linear-gradient(135deg, #141E30, #243B55);
        color: #fff;
    }

    .container {
        width: 500px;
        margin: 40px auto;
        padding: 30px;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 20px;
        backdrop-filter: blur(10px);
        box-shadow: 0px 8px 25px rgba(0,0,0,0.5);
        text-align: center;
    }

    h2 {
        margin-bottom: 25px;
        font-size: 28px;
        font-weight: bold;
        color: #FFD700;
        text-shadow: 2px 2px 10px rgba(0,0,0,0.6);
    }

    .form-control {
        width: 100%;
        padding: 12px;
        margin: 12px 0;
        border: none;
        border-radius: 10px;
        outline: none;
        font-size: 16px;
        background: rgba(255,255,255,0.15);
        color: #fff;
    }

    .form-control::placeholder { color: #ddd; }

    .btn {
        width: 100%;
        background: linear-gradient(135deg, #FFD700, #FFA500);
        color: #000;
        padding: 12px;
        border: none;
        border-radius: 12px;
        font-size: 18px;
        font-weight: bold;
        cursor: pointer;
        transition: 0.3s ease;
    }

    .btn:hover {
        background: linear-gradient(135deg, #FFA500, #FFD700);
        transform: scale(1.05);
    }

    #lblMessage {
        display: block;
        margin-top: 15px;
        font-size: 16px;
        font-weight: bold;
    }

    /* Grid Styling */
    .grid {
        margin: 30px auto;
        width: 90%;
        border-collapse: collapse;
        text-align: center;
    }

    .grid th, .grid td {
        padding: 10px;
        border: 1px solid rgba(255,255,255,0.2);
    }

    .grid th {
        background: rgba(255,215,0,0.2);
        color: #FFD700;
    }

    .grid td {
        background: rgba(255,255,255,0.1);
    }

    img.poster-img {
        width: 80px;
        height: 120px;
        object-fit: cover;
        border-radius: 6px;
    }

    /* Style GridView buttons (Edit/Delete/Update/Cancel) */
    .grid input[type=submit] {
        padding: 6px 12px;
        border-radius: 8px;
        font-weight: bold;
        border: none;
        cursor: pointer;
        margin: 2px;
        transition: 0.3s;
    }

    .grid input[type=submit][value='Edit'] {
        background-color: #007bff;
        color: #fff;
    }

    .grid input[type=submit][value='Delete'] {
        background-color: #d9534f;
        color: #fff;
    }

    .grid input[type=submit][value='Update'] {
        background-color: #28a745;
        color: #fff;
    }

    .grid input[type=submit][value='Cancel'] {
        background-color: #ffc107;
        color: #000;
    }

    .grid input[type=submit]:hover {
        opacity: 0.9;
        transform: scale(1.05);
    }
</style>

</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div class="container">
            <h2>🎬 Add New Movie</h2>

            <asp:TextBox ID="txtMovieName" CssClass="form-control" runat="server" placeholder="Movie Name"></asp:TextBox>
            <asp:TextBox ID="txtLanguage" CssClass="form-control" runat="server" placeholder="Language"></asp:TextBox>
            <asp:FileUpload ID="fuPoster" CssClass="form-control" runat="server" />
            <asp:TextBox ID="txtPrice" CssClass="form-control" runat="server" placeholder="Price"></asp:TextBox>
            <asp:TextBox ID="txtDescription" CssClass="form-control" TextMode="MultiLine" runat="server" placeholder="Description"></asp:TextBox>

            <asp:Button ID="btnAdd" CssClass="btn" Text="Add Movie" runat="server" OnClick="btnAdd_Click" />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Lime"></asp:Label>
        </div>

        <div class="container" style="width:90%;">
            <h2>📋 Manage Movies</h2>
            <asp:GridView ID="gvMovies" runat="server" AutoGenerateColumns="False" CssClass="grid"
                DataKeyNames="MoviesID"
                OnRowEditing="gvMovies_RowEditing"
                OnRowUpdating="gvMovies_RowUpdating"
                OnRowCancelingEdit="gvMovies_RowCancelingEdit"
                OnRowDeleting="gvMovies_RowDeleting">

                <Columns>
                    <asp:BoundField DataField="MoviesID" HeaderText="ID" ReadOnly="True" />
                    <asp:BoundField DataField="MovieName" HeaderText="Movie Name" />
                    <asp:BoundField DataField="Language" HeaderText="Language" />

                    <asp:TemplateField HeaderText="Poster">
                        <ItemTemplate>
                            <asp:Image ID="imgPoster" runat="server" ImageUrl='<%# Eval("MPoster") %>' CssClass="poster-img" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:FileUpload ID="fuEditPoster" runat="server" CssClass="form-control" />
                            <asp:Image ID="imgEditPoster" runat="server" ImageUrl='<%# Eval("MPoster") %>' CssClass="poster-img" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Price" HeaderText="Price" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />

                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
    <div class="container" style="width:200px; margin: 20px auto;">
    <asp:HyperLink ID="lnkHome" runat="server" CssClass="btn" NavigateUrl="~/Home.aspx">🏠 Go to Home</asp:HyperLink>
</div>
</body>
</html>
