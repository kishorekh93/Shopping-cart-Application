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
    public partial class PlaceOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(Localdb)\v11.0;Initial Catalog=cartapp;Integrated Security=True");
            con.Open();
            SqlCommand cmd = new SqlCommand("insert into carddetails(fname,lname,cardno,ExpiryDate,Cvv,BillingAddr) values(@fname,@lname,@cardno,@ExpiryDate,@Cvv,@BillingAddr)", con);
            cmd.Parameters.AddWithValue("@fname", TextBox1.Text);
            cmd.Parameters.AddWithValue("@lname", TextBox2.Text);
            cmd.Parameters.AddWithValue("@cardno", TextBox3.Text);
            cmd.Parameters.AddWithValue("ExpiryDate", TextBox4.Text);
            cmd.Parameters.AddWithValue("@Cvv", TextBox5.Text);
            cmd.Parameters.AddWithValue("@BillingAddr", TextBox6.Text);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Payment Made Successful')</script");
            Session["BillingAddress"] = TextBox6.Text;
           Response.Redirect("pdf_generate.aspx");
        }
       
    }
}