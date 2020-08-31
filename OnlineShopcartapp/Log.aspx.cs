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
    public partial class Log : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            HyperLink1.Visible = false;

        }

        protected void BtnLog_Click(object sender, EventArgs e)
        {
          SqlConnection con= new SqlConnection(@"Data Source=(Localdb)\v11.0;Initial Catalog=cartapp;Integrated Security=true;");
          SqlDataAdapter da = new SqlDataAdapter("Select* from Register where email='"+Txtemail.Text+"' and pass='"+Txtpass.Text+"'",con);
          DataTable dt = new DataTable();
          da.Fill(dt);
          if (Txtemail.Text == "Admin" & Txtpass.Text == "123")
          {
              Label1.Text = "Admin Login Sucessful";
              Label1.ForeColor = System.Drawing.Color.DarkGreen;
     
              HyperLink1.Visible = true;

          }
          else if (dt.Rows.Count == 1)
          {
              Session["custname"] = Txtemail.Text;
              Response.Redirect("Default.aspx");
           
              HyperLink1.Visible = false;
          }
          else
          {
              Label1.ForeColor = System.Drawing.Color.Red;
              Label1.Text = "Login Failed..";
          }
           
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(Localdb)\v11.0;Initial Catalog=cartapp;Integrated Security=true;");
            con.Open();
            SqlDataAdapter da = new SqlDataAdapter("Select* from  Record where email='" + Txtemail.Text + "' and pas='" + Txtpass.Text + "'", con);
 
            DataTable dt = new DataTable();
            da.Fill(dt);
          
           
        }
    }
}