using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI.WebControls;

namespace Online_Movie_Ticket_Booking
{
    public partial class Admin : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["OMTBSConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                BindGrid();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string fileName = "";
            string folderPath = Server.MapPath("~/Content/Images");

            if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

            if (fuPoster.HasFile)
            {
                fileName = Path.GetFileName(fuPoster.PostedFile.FileName);
                fuPoster.SaveAs(Path.Combine(folderPath, fileName));
            }

            string relativePath = "/Content/Images/" + fileName;

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Movies(MovieName, Language, MPoster, Price, [Description]) " +
                               "VALUES(@MovieName, @Language, @MPoster, @Price, @Description)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MovieName", txtMovieName.Text);
                cmd.Parameters.AddWithValue("@Language", txtLanguage.Text);
                cmd.Parameters.AddWithValue("@MPoster", relativePath);
                cmd.Parameters.AddWithValue("@Price", Convert.ToDecimal(txtPrice.Text));
                cmd.Parameters.AddWithValue("@Description", txtDescription.Text);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMessage.Text = "Movie Added Successfully!";
            txtMovieName.Text = txtLanguage.Text = txtPrice.Text = txtDescription.Text = "";
            BindGrid();
        }

        private void BindGrid()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Movies", con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvMovies.DataSource = dt;
                gvMovies.DataBind();
            }
        }

        protected void gvMovies_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gvMovies.EditIndex = e.NewEditIndex;
            BindGrid();
        }

        protected void gvMovies_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvMovies.EditIndex = -1;
            BindGrid();
        }

        protected void gvMovies_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvMovies.DataKeys[e.RowIndex].Value.ToString());


            string name = ((TextBox)gvMovies.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string lang = ((TextBox)gvMovies.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string price = ((TextBox)gvMovies.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            string desc = ((TextBox)gvMovies.Rows[e.RowIndex].Cells[5].Controls[0]).Text;

            string posterPath = null;
            FileUpload fuEditPoster = (FileUpload)gvMovies.Rows[e.RowIndex].FindControl("fuEditPoster");

            if (fuEditPoster.HasFile)
            {
                string folderPath = Server.MapPath("~/Content/Images/");
                if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                string fileName = Path.GetFileName(fuEditPoster.PostedFile.FileName);
                fuEditPoster.SaveAs(Path.Combine(folderPath, fileName));
                posterPath = "/Content/Images/" + fileName;
            }

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "UPDATE Movies SET MovieName=@MovieName, Language=@Language, Price=@Price, [Description]=@Description"
                             + (posterPath != null ? ", MPoster=@MPoster" : "")
                             + " WHERE MoviesID=@MovieID";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@MovieID", id);
                cmd.Parameters.AddWithValue("@MovieName", name);
                cmd.Parameters.AddWithValue("@Language", lang);
                cmd.Parameters.AddWithValue("@Price", price);
                cmd.Parameters.AddWithValue("@Description", desc);

                if (posterPath != null)
                    cmd.Parameters.AddWithValue("@MPoster", posterPath);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvMovies.EditIndex = -1;
            BindGrid();
        }

        protected void gvMovies_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvMovies.DataKeys[e.RowIndex].Value.ToString());
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Movies WHERE MoviesID=@MovieID", con);
                cmd.Parameters.AddWithValue("@MovieID", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            BindGrid();
        }
    }
}
