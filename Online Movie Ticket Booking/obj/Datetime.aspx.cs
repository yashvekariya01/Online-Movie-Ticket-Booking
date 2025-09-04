using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Movie_Ticket_Booking
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["OMTBSConnectionString"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                 TextBox2.Text = Request.QueryString["id"];
            }
        }

        protected void Calender1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox1.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Calendar1.Visible = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection sqlCon = new SqlConnection(connString);
            {
                sqlCon.Open();
                SqlCommand sql = new SqlCommand("Sample_Proc", sqlCon);
                sql.CommandType = CommandType.StoredProcedure;
                sql.Parameters.AddWithValue("@Date", TextBox1.Text);
                sql.Parameters.AddWithValue("@Time", DropDownList2.Text);
                sql.Parameters.AddWithValue("@Theatres", DropDownList3.Text);
                sql.Parameters.AddWithValue("@MoviesID", TextBox2.Text);
                sql.Parameters.AddWithValue("@LoginID", Session["LoginID"]);
                sql.Parameters.AddWithValue("@ID", SqlDbType.Int).Direction = ParameterDirection.Output;
                sql.ExecuteNonQuery();
                string id = sql.Parameters["@ID"].Value.ToString();
                sqlCon.Close();
                Session["ShowDate"] = TextBox1.Text;
                Session["ShowTime"] = DropDownList2.Text;
                Session["TheatreName"] = DropDownList3.Text;
                Response.Redirect("SeatSelection.aspx?id=" + id);

            }
        }        
    }
}