<%@ Page Title="" Language="C#" MasterPageFile="~/Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineShopcartapp.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <table style="text-align:center; width:500px; background-color:lightseagreen">
      
                    <h1 style="text-align:center; background-color:lightseagreen">Registration Form</h1>
               
         
            <tr>
                <td>
                   <asp:Label ID="name" runat="server" Text="Name"></asp:Label>
                </td>
                <td>
                       <asp:TextBox ID="Txtcustname" runat="server"  style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large"></asp:TextBox>
                </td>
            </tr>
                    <tr>
                <td>
                   <asp:Label ID="pswd" runat="server" Text="Password"></asp:Label>
            </td>
                <td>
                 <asp:TextBox ID="Txtpas" runat="server" TextMode="Password" style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large"></asp:TextBox>
    
                </td>
            </tr>
            <tr>
                <td>
                <asp:Label ID="confpswd" runat="server" TextMode="Password" Text="Confirm Password"></asp:Label>
    
                </td>
                <td>
                        <asp:TextBox ID="Txtcpass" runat="server" style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="email" runat="server" Text="Email-ID"></asp:Label>
                </td>
                <td>
                       <asp:TextBox ID="Txtemail" runat="server" style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Label ID="Mobile" runat="server" Text="Mobile"></asp:Label>

                </td>
                <td>
                            <asp:TextBox ID="Txtmob" runat="server" style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                      <asp:Label ID="addr" runat="server" Text="Address"></asp:Label>
        

                </td>
                <td>
                    <asp:TextBox ID="Txtaddr" runat="server" style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Label ID="City" runat="server" Text="City:"></asp:Label>
       
                </td>
                <td>
                     <asp:DropDownList ID="dropcity" runat="server" style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large">
            <asp:ListItem Selected="True" Value="SELECT">--SELECT--</asp:ListItem>
            <asp:ListItem>Chennai</asp:ListItem>
            <asp:ListItem>Mumbai</asp:ListItem>
            <asp:ListItem>Bangalore</asp:ListItem>
            <asp:ListItem>Hyderabad</asp:ListItem>
            <asp:ListItem>Vijayawada</asp:ListItem>
            <asp:ListItem>Ahamedabad</asp:ListItem>
            <asp:ListItem>Jaipur</asp:ListItem>
            <asp:ListItem>Indore</asp:ListItem>
            <asp:ListItem>Thrisur</asp:ListItem>
            <asp:ListItem>Cuttack</asp:ListItem>
            <asp:ListItem>Jharkhand</asp:ListItem>
        </asp:DropDownList>
                    </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="State" runat="server" Text="State" ></asp:Label>
        
                </td>
                <td>
                    <asp:DropDownList ID="dropstate" runat="server" style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large" >
            <asp:ListItem Selected="True" Value="SELECT">--SELECT--</asp:ListItem>
            <asp:ListItem>TamilNadu</asp:ListItem>
            <asp:ListItem>Maharastra</asp:ListItem>
            <asp:ListItem>Karnataka</asp:ListItem>
            <asp:ListItem>Telengana</asp:ListItem>
            <asp:ListItem>Andhra Pradesh</asp:ListItem>
            <asp:ListItem>Gujarath</asp:ListItem>
            <asp:ListItem>Rajasthan</asp:ListItem>
            <asp:ListItem>Madhya Pradesh</asp:ListItem>
            <asp:ListItem>Kerala</asp:ListItem>
            <asp:ListItem>Orissa</asp:ListItem>
            <asp:ListItem>Ranchi</asp:ListItem>
        </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                     <asp:Label ID="Pin" runat="server" Text="Pincode"></asp:Label>
        
                </td>
                <td>
                    <asp:TextBox ID="Txtpin" runat="server" style="text-align:center; width:188px;" Font-Bold="true" Font-Names="AgencyFb" Font-Size="Large"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="BtnReg" runat="server"  Text="Register" OnClick="BtnReg_Click" OnClientClick="validateregister()" style="text-align:center; Width:225px; margin-left: 168px;" Font-Bold="true" Font-Size="X-Large"  BackColor="Gold" ForeColor="Red"  BorderColor="SpringGreen" BorderStyle="Ridge" BorderWidth="2px" />
                </td>
                <td>
                    <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="Gold" NavigateUrl="~/Log.aspx">Click here to Login</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td style="text-align:center;background-color:lightseagreen;">
                       <asp:Label ID="lblmsg" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
    <script type="text/javascript">
        function validateregister() {
            if (document.getElementById("<%=Txtcustname.ClientID%>").value == "") {
            alert("Enter the  Name.....?");
            document.getElementById("<%=Txtcustname.ClientID%>").focus();
            return false;
        }

        if (document.getElementById("<%=Txtpas.ClientID%>").value == "") {
            alert('Please fill in your desired password!');
            document.getElementById("<%=Txtpas.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=Txtcpass.ClientID%>").value == "") {
            alert('Please fill in your password again for confirmation!');
            document.getElementById("<%=Txtcpass.ClientID%>").focus();
            return false;
        }
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
        if (document.getElementById("<%=Txtmob.ClientID%>").value == "") {
            alert("Please Enter Mobile Number..");
            document.getElementById("<%=Txtmob.ClientID%>").focus();
            return false;
        }
        var phn3 = document.getElementById("<%=Txtmob.ClientID%>");
        if (phn3.value.length < 10) {
            alert("Please Enter Phone no.10 digits.");
            document.getElementById("<%=Txtmob.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=Txtaddr.ClientID%>").value == "") {
            alert("Please Enter the Address.....?");
            document.getElementById("<%=Txtaddr.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=dropcity.ClientID%>").selectedIndex == "") {
            alert("Please Select City..");
            document.getElementById("<%=dropcity.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=dropstate.ClientID%>").selectedIndex == "") {
            alert("Please Select State..");
            document.getElementById("<%=dropstate.ClientID%>").focus();
            return false;
        }
        if (document.getElementById("<%=Txtpin.ClientID%>").value == "") {
            alert("Please Enter PinCode..");
            document.getElementById("<%=Txtpin.ClientID%>").focus();
            return false;
        }
    }
</script>

</asp:Content>
