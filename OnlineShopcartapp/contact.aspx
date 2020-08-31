<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="OnlineShopcartapp.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="text-align:center; width:750px; background-color:cadetblue">
            <tr>
                <th  style="text-align:center;">
                    Contact Form
                </th>
            </tr>
            <tr>
                <td>
                    Name:
                </td>
                <td style="text-align:center; width:188px; height:44px;">
                    <asp:TextBox ID="TextBox1" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="SpringGreen" ></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    Email ID:
                </td>
                <td  style="text-align:center; width:188px; height:44px;">
                   <asp:TextBox ID="TextBox2" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="SpringGreen"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    SUBJECT:
                </td>
                <td  style="text-align:center; width:188px; height:44px;">
                    <asp:TextBox ID="TextBox3" runat="server" Font-Bold="true" Font-Size="Large" ForeColor="SpringGreen"></asp:TextBox>
                </td>
            </tr>
             <tr>
                <td>
                    MESSAGE:
                </td>
                <td  style="text-align:center; width:188px; height:44px;">
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Font-Bold="true" Font-Size="Large" ForeColor="SpringGreen"></asp:TextBox>
                </td>
                 </tr>
            <tr>
                 <td>
                     <asp:Button ID="Button1" runat="server" Text="Submit" Font-Bold="true" Font-Size="Large" ForeColor="SpringGreen" BackColor="#0080FF" OnClick="Button1_Click" />
                 </td>
                <td>
                     <asp:Button ID="Button2" runat="server" Text="Clear" Font-Bold="true" Font-Size="Large" ForeColor="SpringGreen" BackColor="#0080FF" OnClick="Button2_Click" />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label1" runat="server" Text="" ForeColor="#008080"></asp:Label></td>
            </tr>
        </table>
    </div>
</asp:Content>
