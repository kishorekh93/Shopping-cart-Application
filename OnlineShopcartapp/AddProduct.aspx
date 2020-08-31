<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="OnlineShopcartapp.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 61%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="height:510px;">
        <table  style="width:802px; height:390px; background-color:sandybrown; margin-left: 197px;">
            <tr>
                <td style="text-align:center; " colspan="2">
                    <h1>Adding Product</h1><hr />
                </td>
           
            </tr>
              <tr>
                <td style="text-align:center; width:50%;">
                    <h3>Product ID:</h3>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox> </td>
            </tr>
              <tr>
                <td style="text-align:center; width:50%;"> <h3>Product Name:</h3></td>
                <td class="auto-style1"> <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> </td>
            </tr>
              <tr>
                <td style="text-align:center; width:50%;"> <h3>Product Description:</h3></td>
                <td class="auto-style1"><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
            </tr>
              <tr>
                <td style="text-align:center; width:50%;"><h3>Image</h3></td>
                <td class="auto-style1">
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
            </tr>
              <tr>
                <td style="text-align:center; width:50%;"> <h3>Product Price</h3></td>
                <td class="auto-style1"><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
            </tr>
              <tr>
                <td style="text-align:center; " colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Add" Font-Bold="True" ForeColor="Black" Height="36px" OnClick="Button1_Click" Width="88px" /></td>
              
            </tr>
              <tr>
                <td style="text-align:center; " colspan="2">
                  
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
            
            </tr>
        </table>
    </div>
</asp:Content>
