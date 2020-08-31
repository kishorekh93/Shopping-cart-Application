using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineShopcartapp
{
    public partial class cartadd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["buyitems"] == null)
                {
                    Button1.Enabled = false;
                }
                else
                {
                    Button1.Enabled = true;
                }
                Session["addproduct"] = "false";
                DataTable dt = new DataTable();
                DataRow dr;
                dt.Columns.Add("sno");
                dt.Columns.Add("pid");
                dt.Columns.Add("pname");
                dt.Columns.Add("pimage");
                dt.Columns.Add("pprice");
                dt.Columns.Add("pquantity");
                dt.Columns.Add("ptotalprice");
                if (Request.QueryString["id"] != null)
                {
                    if (Session["buyitems"] == null)
                    {
                        dr = dt.NewRow();
                        SqlConnection con = new SqlConnection(@"Data Source=(Localdb)\v11.0;Initial Catalog=cartapp;Integrated Security=true");
                        SqlDataAdapter da = new SqlDataAdapter("select * from productlist where pid=" + Request.QueryString["id"], con);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["pid"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["pprice"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];
                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["ptotalprice"] = totalprice;
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("cartadd.aspx");
                    }
                    else
                    {
                        dt = (DataTable)Session["buyitems"];
                        int sr;
                        sr = dt.Rows.Count;
                        dr = dt.NewRow();
                        SqlConnection cons = new SqlConnection(@"Data Source=(Localdb)\v11.0;Initial Catalog=cartapp;Integrated Security=true");
                        SqlDataAdapter da = new SqlDataAdapter("select * from productlist where pid=" + Request.QueryString["id"], cons);
                        DataSet ds = new DataSet();
                        da.Fill(ds);
                        dr["sno"] = sr + 1;
                        dr["pid"] = ds.Tables[0].Rows[0]["pid"].ToString();
                        dr["pname"] = ds.Tables[0].Rows[0]["pname"].ToString();
                        dr["pimage"] = ds.Tables[0].Rows[0]["pimage"].ToString();
                        dr["pprice"] = ds.Tables[0].Rows[0]["pprice"].ToString();
                        dr["pquantity"] = Request.QueryString["quantity"];
                        int price = Convert.ToInt32(ds.Tables[0].Rows[0]["pprice"].ToString());
                        int quantity = Convert.ToInt16(Request.QueryString["quantity"].ToString());
                        int totalprice = price * quantity;
                        dr["ptotalprice"] = totalprice;
                        dt.Rows.Add(dr);
                        GridView1.DataSource = dt;
                        GridView1.DataBind();
                        Session["buyitems"] = dt;
                        Button1.Enabled = true;
                        GridView1.FooterRow.Cells[5].Text = "Total Amount";
                        GridView1.FooterRow.Cells[6].Text = grandtotal().ToString();
                        Response.Redirect("cartadd.aspx");
                    }
                }
                else
                {
                    dt = (DataTable)Session["buyitems"];
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
                    if (GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.Cells[6].Text = "Total Amount";
                        GridView1.FooterRow.Cells[7].Text = grandtotal().ToString();
                    }
                }
            }
            string OrderDate = DateTime.Now.ToShortDateString();
            Session["Orderdate"] = OrderDate;
            OrderId();
        }
        public int grandtotal()
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            int nrow = dt.Rows.Count;
            int i = 0;
            int totalprice = 0;
            while (i < nrow)
            {
                totalprice = totalprice + Convert.ToInt32(dt.Rows[i]["pprice"].ToString());
                i = i + 1;
            }
            return totalprice;
        }
        public void OrderId()
        {
            string alpha = "abCdefghIjklmNopqrStuvwXyz123456789";
            Random r = new Random();
            char[] myarray = new char[5];
            for (int i = 0; i < 5; i++)
            {
                myarray[i] = alpha[(int)(35 * r.NextDouble())];

            }
            string orderid;
            orderid = "Order_Id" + DateTime.Now.Hour.ToString() + DateTime.Now.Second.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Month.ToString() + DateTime.Now.Year.ToString() + new string(myarray) + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();
            Session["OrderID"] = orderid;
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable dt = new DataTable();
            dt = (DataTable)Session["buyitems"];
            for (int i = 0; i <= dt.Rows.Count - 1; i++)
            {
                int sr;
                int sr1;
                string qdata;
                string dtdata;
                sr = Convert.ToInt32(dt.Rows[i]["sno"].ToString());
                TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
                qdata = cell.Text;
                dtdata = sr.ToString();
                sr1 = Convert.ToInt32(qdata);
                if (sr == sr1)
                {
                    dt.Rows[i].Delete();
                    dt.AcceptChanges();
                    break;
                }
            }
            for (int i = 1; i <= dt.Rows.Count; i++)
            {
                dt.Rows[i - 1]["sno"] = i;
                dt.AcceptChanges();
            }
            Session["buyitems"] = dt;
            Response.Redirect("cartadd.aspx");
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
              DataTable dt;
            dt = (DataTable)Session["buyitems"];
            for(int i=0;i<=dt.Rows.Count-1;i++)
            {
                SqlConnection con = new SqlConnection(@"Data Source=(Localdb)\v11.0; Initial Catalog=cartapp;Integrated Security=true");
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into OrderDetails(orderid,sno,productid,productname,price,quantity,orderdate)values('" + Session["OrderID"] + "'," + dt.Rows[i]["sno"] + "," + dt.Rows[i]["pid"] + ",'" + dt.Rows[i]["pname"] + "'," + dt.Rows[i]["pprice"] + "," + dt.Rows[i]["pquantity"] + ",'" + Session["Orderdate"] + "')",con);
                cmd.ExecuteNonQuery();
                con.Close();

            }
            if(Session["custname"]==null)
            {
                Response.Redirect("Log.aspx");

            }
            else
            {
                if(GridView1.Rows.Count.ToString()=="0")
                {
                    Response.Write("<script>alert('Your Cart Is Empty. You cannot Place an Order');</script>");
                }
                else
                {
                    Response.Redirect("placeorder.aspx");
                }
            }
        }
        
    }
}