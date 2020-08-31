<%@ Page Language="C#" AutoEventWireup="true"  CodeBehind="cartadd.aspx.cs" Inherits="OnlineShopcartapp.cartadd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
     <div style=" text-align:center; margin: 0 auto ;">
    <h2 style="text-decoration:underline overline ; color:#ff006e">You Have Following Product in Your Cart</h2>
        <br /> <br />
        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Agency FB" Font-Size="X-Large" NavigateUrl="~/Default.aspx">Continue Shopping</asp:HyperLink>
        <br /><br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="#009933" BorderColor="#660066" BorderWidth="5px" EmptyDataText="No Product Available in Shopping Cart" Font-Bold="True" Height="257px" ShowFooter="True" Width="1100px" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="sno" HeaderText="Sr No.">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pid" HeaderText="Product ID">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:ImageField DataImageUrlField="pimage" HeaderText="Product Image">
                    <ControlStyle Height="300px" Width="340px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:ImageField>
                <asp:BoundField DataField="pname" HeaderText="Product Name">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pprice" HeaderText="Product Price">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="pquantity" HeaderText="Quantity">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="ptotalprice" HeaderText="Total Price">
                <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:CommandField DeleteText="Remove" ShowDeleteButton="True" />
            </Columns>
            <FooterStyle BackColor="#6666FF" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#0080FF" ForeColor="White" />
        </asp:GridView>
        <br /><br />
        <asp:Button ID="Button1" runat="server" Text="Button" BackColor="#FF6699" BorderColor="#F940AA" BorderStyle="Ridge" Font-Bold="True" Font-Size="Larger" Height="46px" Width="135px" OnClick="Button1_Click" />
         <br />
         <br />
    </div>
    </form>
</body>
</html>
