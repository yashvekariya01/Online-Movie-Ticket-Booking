<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Summary.aspx.cs" Inherits="Online_Movie_Ticket_Booking.Thnks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <form id="form1" runat="server">
    <div style=" height: 595px; background-color: white; padding-left:5%" >
        <br />
        <label style="font-family: 'Buxton Sketch'; font-size: 50px" >Thank you for choosing us...</label>
        <label style="font-size:30px">🥰😊🤗</label>
        <br />
        <label style="font-family: 'Buxton Sketch'; font-size: x-large; padding-left: 10%" >See your ticket summary here,</label>
        <asp:TextBox ID="txtidvalue" runat="server" Visible="False"></asp:TextBox>
    
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" BackColor="White" BorderColor="#CCCCCC" CellPadding="4" ForeColor="Black" GridLines="Horizontal" HorizontalAlign="Center" RepeatColumns="3" RepeatDirection="Horizontal" BorderStyle="None" BorderWidth="1px" DataKeyField="MoviesID" >
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <ItemTemplate>
                MoviesID:
                <asp:Label ID="MoviesIDLabel" runat="server" Text='<%# Eval("MoviesID") %>' />
                <br />
                MovieName:
                <asp:Label ID="MovieNameLabel" runat="server" Text='<%# Eval("MovieName") %>' />
                <br />
                Language:
                <asp:Label ID="LanguageLabel" runat="server" Text='<%# Eval("Language") %>' />
                <br />
                MPoster:
                <asp:Label ID="MPosterLabel" runat="server" Text='<%# Eval("MPoster") %>' />
                <br />
                Price:
                <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' />
                <br />
                Description:
                <asp:Label ID="DescriptionLabel" runat="server" Text='<%# Eval("Description") %>' />
                <br />
                <br />
            </ItemTemplate>
            <SelectedItemStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        </asp:DataList>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:OMTBSConnectionString %>" ProviderName="<%$ ConnectionStrings:OMTBSConnectionString.ProviderName %>" SelectCommand="SELECT * FROM [Movies]"></asp:SqlDataSource>
        <br />
        
        <div class="text-center" style="font-family:'Buxton Sketch'; font-size:large">
            And your selected seat(s) are/is <asp:Label ID="seatno" runat="server" Text="Label"></asp:Label>
        </div>
        <div class="text-right" style="padding-right:10%">
        ||&nbsp;<asp:HyperLink runat="server" ID="hyperlink1" Font-Bold="True" Font-Names="Buxton Sketch" Font-Size="X-Large" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/Home.aspx" >Book More...</asp:HyperLink>
            &nbsp;||&nbsp;
        <asp:HyperLink runat="server" ID="hyperlink2" Font-Bold="True" Font-Names="Buxton Sketch" Font-Size="X-Large" Font-Underline="True" ForeColor="Blue" NavigateUrl="~/Default.aspx" >Logout</asp:HyperLink>
        &nbsp;||</div>
    </div>
    </form>

</asp:Content>
