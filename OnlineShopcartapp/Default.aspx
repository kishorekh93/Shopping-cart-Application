<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="OnlineShopcartapp.Default1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="width:1150px;height:30px;">
      <tr style="background-color:#7525d0">
          <td colspan="2" style="text-align:right;">
              <asp:Label ID="Label4" runat="server" style="text-align:center;" Font-Bold="true" Font-Italic="true" Font-Names="Arial Black"></asp:Label>
                  <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" Font-Names="Agency FB" NavigateUrl="~/Log.aspx">Click To Login</asp:HyperLink>
              <asp:Button ID="Button1" runat="server" Text="Logout" BackColor="#996633" BorderColor="#FF6666" Font-Bold="True" Font-Names="Times New Roman" ForeColor="#009933" Height="27px" Width="105px" OnClick="Button1_Click" />
          </td>
          <td style="text-align:right;">
              <asp:TextBox ID="TextBox1" runat="server" Height="21px" Width="174px"></asp:TextBox>
                    <asp:ImageButton ID="ImageButton2" runat="server" Height="23px" ImageUrl="~/IMAGES/searchingicon.png" Width="25px" OnClick="ImageButton2_Click" />
          </td>
      </tr>

  </table>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Height="293px"  Width="310px" RepeatColumns="4" RepeatDirection="Horizontal" OnItemCommand="DataList1_ItemCommand">
        <ItemTemplate>
           <table>
             <tr>
                 <td style="text-align:center; background-color:#5f98f3">
                     <asp:Label ID="Label1" runat="server" Text='<%#Eval("pname") %>' Font-Bold="True" Font-Names="Times New Roman" ForeColor="White"></asp:Label>
                 </td>
             </tr>
               <tr>
                 <td style="text-align:center;">
                     <asp:Image ID="Image1" runat="server" BorderColor="#5F98F3" BorderWidth="1px" Height="279px" Width="278px" ImageUrl='<%#Eval("pimage") %>' />
                 </td>
             </tr>
               <tr>
                 <td style="text-align:center;">
                     <asp:Label ID="Label2" runat="server" Text="Price:Rs" Font-Bold="True" Font-Names="Times New Roman" ForeColor="lime" style="text-align:center;"></asp:Label>
                               <asp:Label ID="Label3" runat="server" Text='<%#Eval("pprice") %>' Font-Bold="True" Font-Names="Times New Roman" ForeColor="lime" style="text-align:center;"></asp:Label>
                 </td>
             </tr>
               <tr>
                 <td style="text-align:center;">Quantity
                     <asp:DropDownList ID="DropDownList1" runat="server">
                         <asp:ListItem>1</asp:ListItem>
                         <asp:ListItem>2</asp:ListItem>
                         <asp:ListItem>3</asp:ListItem>
                         <asp:ListItem>4</asp:ListItem>
                         <asp:ListItem>5</asp:ListItem>
                     </asp:DropDownList>
                 </td>
             </tr>
               <tr>
                 <td style="text-align:center;">
                     <asp:ImageButton ID="ImageButton1" runat="server" Height="70px" ImageUrl="~/IMAGES/AddCart.png" Width="160px" CommandArgument='<%#Eval("pid") %>' CommandName="AddToCart" />
                 </td>
             </tr>
         </table>
            <br />
            <br />
         

        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:cartappConnectionString %>" SelectCommand="SELECT [pname], [pid], [pimage], [pprice] FROM [productlist]"></asp:SqlDataSource>
</asp:Content>
