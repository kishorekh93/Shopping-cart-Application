using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using iTextSharp.text;
using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using System.IO;
namespace OnlineShopcartapp
{
    public partial class pdf_generate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Orderid = Session["orderid"].ToString();
            Label1.Text = Orderid;
            findorderdate(Label2.Text);
            string Address = Session["BillingAddress"].ToString();
            Label3.Text = Address;
            showgrid(Label1.Text);

        }
        public override void VerifyRenderingInServerForm(Control control)
        {
            //base.VerifyRenderingInServerForm(control);
        }
      

        protected void Button1_Click(object sender, EventArgs e)
        {
            exportpdf();
           
        }
        private void exportpdf()
        {
           
          using (StringWriter st = new StringWriter())
            {
                using (HtmlTextWriter ht = new HtmlTextWriter(st))
                {
                    Response.ContentType = "Application/pdf";
                    Response.AddHeader("content-disposition", "attachemnt;filename=FileName.pdf");
                    Response.Cache.SetCacheability(HttpCacheability.NoCache);
                    GridView1.AllowPaging = false;

                    this.DataBind();
                    GridView1.RenderControl(ht);

                    StringReader sa = new StringReader(st.ToString());
                    Document pdfdocs = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
                    HTMLWorker htmlparsers = new HTMLWorker(pdfdocs);
                    pdfdocs.PageCount = 1;
                    PdfWriter.GetInstance(pdfdocs, Response.OutputStream);

                    pdfdocs.Open();
                    htmlparsers.Parse(sa);
                    pdfdocs.Close();

                  

                    Response.Write(pdfdocs);

                    Response.End();

                }
            }
        }
        private void findorderdate(String Orderid)
        {
            SqlConnection con = new SqlConnection(@"Data Source=(Localdb)\v11.0;Initial Catalog=cartapp;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select * from OrderDetails where orderid='" + Label1.Text + "'");
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            if(ds.Tables[0].Rows.Count>0)
            {
                Label2.Text=ds.Tables[0].Rows[0]["orderdate"].ToString();
            }
            con.Close();
        }
        public void showgrid(string orderid)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add("sno");
            dt.Columns.Add("productid");
            dt.Columns.Add("productname");
            dt.Columns.Add("quantity");
            dt.Columns.Add("price");
            dt.Columns.Add("totalprice");
            SqlConnection con = new SqlConnection(@"Data Source=(Localdb)\v11.0;Initial Catalog=cartapp;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("select * from OrderDetails where orderid='" + Label1.Text + "'");
            cmd.Connection = con;
            SqlDataAdapter da = new SqlDataAdapter();
            da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            da.Fill(ds);
            int totalrows = ds.Tables[0].Rows.Count;
            int i = 0;
            int grandtotal = 0;
            while(i<totalrows)
            {
                dr = dt.NewRow();
                dr["sno"] = ds.Tables[0].Rows[i]["sno"].ToString();
                dr["productid"] = ds.Tables[0].Rows[i]["productid"].ToString();
                dr["productname"] = ds.Tables[0].Rows[i]["productname"].ToString();
                dr["quantity"] = ds.Tables[0].Rows[i]["quantity"].ToString();
                dr["price"] = ds.Tables[0].Rows[i]["price"].ToString();
                int price = Convert.ToInt32(ds.Tables[0].Rows[i]["price"].ToString());
                int quantity = Convert.ToInt16(ds.Tables[0].Rows[i]["quantity"].ToString());
                int totalprice = price * quantity;
                dr["totalprice"] = totalprice;
                grandtotal = grandtotal + totalprice;
                dt.Rows.Add(dr);
                i = i + 1;
            }
            GridView1.DataSource = dt;
            GridView1.DataBind();
            Label4.Text = grandtotal.ToString();
        }
    }
}