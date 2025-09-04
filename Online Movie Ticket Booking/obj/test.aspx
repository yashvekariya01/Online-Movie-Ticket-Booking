<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="test.aspx.cs" Inherits="Online_Movie_Ticket_Booking.test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="MoviesID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="MoviesID" HeaderText="MoviesID" InsertVisible="False" ReadOnly="True" SortExpression="MoviesID" />
                <asp:BoundField DataField="MovieName" HeaderText="MovieName" SortExpression="MovieName" />
                <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" />
                <asp:BoundField DataField="MPoster" HeaderText="MPoster" SortExpression="MPoster" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:OMTBSConnectionString %>" ProviderName="<%$ ConnectionStrings:OMTBSConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Movies]"></asp:SqlDataSource>
    </form>
</body>
</html>
