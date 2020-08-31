<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Log.aspx.cs" Inherits="OnlineShopcartapp.Log" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align:center">
    
        <table style="text-align:center; height: 402px; margin-left: 263px;  background-color:#0094ff" >
            <tr>
                <td colspan="3"style="text-align:center; width:100%; ">
                <asp:ImageButton ID="ImageButton1" runat="server" ImageAlign="Middle" ImageUrl="~/IMAGES/login logo.jpg" OnClick="ImageButton1_Click" />
                    </td>
       
            </tr>
            <tr>
                <td style="width:50%; text-align:center;"><b>Email-ID: </b></td>
                <td ><asp:TextBox ID="Txtemail" runat="server" style="margin-left: 16px" Width="279px" BackColor="#0094FF" Height="40px" TextMode="Email"></asp:TextBox>
                   </td>
        
            </tr>
            <tr>
                <td style="width:50%; text-align:center;"><b>Password:</b></td>
                <td><asp:TextBox ID="Txtpass" runat="server" style="margin-left: 16px" Width="279px" BackColor="#0094FF" Height="40px" TextMode="Password"></asp:TextBox>
                  </td>
             
            </tr>
            <tr>
                <td colspan="2" align:"center"><asp:Button ID="BtnLog" runat="server" Height="36px" Text="Login" Width="152px" style="margin-left: 37px" BackColor="#0094FF" Font-Bold="True" Font-Size="Large" OnClick="BtnLog_Click" OnClientClick="validatelog()"/></td>
               
            </tr>
            <tr >
                <td>
                    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Register.aspx">Click Here To Register</asp:HyperLink></td>
      
               
            </tr>
        </table>
    
    </div>
        
    </form>
    </body>
</html>
<script type="text/javascript">
    function validatelog() {
        if (document.getElementById("<%=Txtemail.ClientID%>").value == "") {
            alert("Please Enter Email ID..");
            document.getElementById("<%=Txtemail.ClientID%>").focus();
            return false;
        }
        var x = document.getElementById("<%=Txtemail.ClientID%>").value;
        var atpos = x.indexOf("@");
        var dotpos = x.lastIndexOf(".");
        if (atpos < 1 || dotpos < atpos + 2 || dotpos + 2 >= x.length) {
            alert("Please enter valid mail address.");
            document.getElementById("<%=Txtemail.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=Txtpass.ClientID%>").value == "") {
            alert('Please Enter password!');
            document.getElementById("<%=Txtpass.ClientID%>").focus();
            return false;
        }
    }
</script>
