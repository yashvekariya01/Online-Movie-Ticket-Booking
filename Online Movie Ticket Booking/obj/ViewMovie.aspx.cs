using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Movie_Ticket_Booking
{
    public partial class ViewMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "btnbook")
            {
                // Match IDs with ASPX file
                System.Web.UI.WebControls.Label lblMovieName = (System.Web.UI.WebControls.Label)e.Item.FindControl("lblMovieName");
                System.Web.UI.WebControls.Label lblLanguage = (System.Web.UI.WebControls.Label)e.Item.FindControl("lblLanguage");

                // Null check (safety)
                if (lblMovieName != null && lblLanguage != null)
                {
                    Session["MovieName"] = lblMovieName.Text;
                    Session["Language"] = lblLanguage.Text;
                }

                Response.Redirect("Datetime.aspx?id=" + e.CommandArgument.ToString());
            }
        }
    }
}