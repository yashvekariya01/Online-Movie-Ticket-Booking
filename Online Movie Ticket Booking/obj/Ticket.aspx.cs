using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Online_Movie_Ticket_Booking
{
    public partial class Ticket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["MovieName"] != null && Session["Language"] != null &&
                    Session["ShowDate"] != null && Session["ShowTime"] != null &&
                    Session["TheatreName"] != null)
                {
                    // Ticket Details
                    lblDetails.Text = "<p><span class='highlight'>Movie:</span> " + Session["MovieName"] + " (" + Session["Language"] + ")</p>" +
                                      "<p><span class='highlight'>Date:</span> " + Session["ShowDate"] + "</p>" +
                                      "<p><span class='highlight'>Time:</span> " + Session["ShowTime"] + "</p>" +
                                      "<p><span class='highlight'>Theatre:</span> " + Session["TheatreName"] + "</p>";

                    // Generate Random Ticket Number
                    Random rnd = new Random();
                    int ticketNo = rnd.Next(100000, 999999); // 6-digit ticket number
                    lblTicketNo.Text = "<p><span class='highlight'>Ticket No:</span> " + ticketNo + "</p>";
                }
                else
                {
                    lblDetails.Text = "<p style='color:red;'>⚠ Ticket details not found. Please book again.</p>";
                }
            }
        }
    }
}