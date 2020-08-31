using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace OnlineShopcartapp
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        SqlConnection con = new SqlConnection(@"Data Source=(Localdb)\v11.0;Initial Catalog=cartapp;Integrated Security=true");

        protected void BtnReg_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into Register values(@un,@ps,@cps,@em,@m,@ad,@ct,@st,@pc)", con);
            cmd.Parameters.AddWithValue("un", Txtcustname.Text);
            cmd.Parameters.AddWithValue("ps", Txtpas.Text);
            cmd.Parameters.AddWithValue("cps", Txtcpass.Text);
            cmd.Parameters.AddWithValue("em", Txtemail.Text);
            cmd.Parameters.AddWithValue("m", Txtmob.Text);
            cmd.Parameters.AddWithValue("ad", Txtaddr.Text);
            cmd.Parameters.AddWithValue("ct", dropcity.SelectedItem.Value);
            cmd.Parameters.AddWithValue("st", dropstate.SelectedItem.Value);
            cmd.Parameters.AddWithValue("pc", Txtpin.Text);
            cmd.ExecuteNonQuery();
            lblmsg.Text = "Registration Sucess.." + "\n" + "Thank You for Registering with us";
            
        }
    }
}