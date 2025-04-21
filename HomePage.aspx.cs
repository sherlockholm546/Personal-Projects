using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.FriendlyUrls;

namespace Hotel_Mgnt_System
{
    public partial class HomePage : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["gemail"] == null)
            {
                //Response.Write("<script>alert('Please Login to Continue!');</script>");
                //Response.Redirect("GuestLoginPage.aspx");

                //Session["gemail"] = null;

            }
            
            //string gemail = Session["gemail"].ToString();

        }

        protected void btnLoginOut_Click(object sender, EventArgs e)
        {
            Session.Remove("gemail");
            //Response.Redirect("GuestLoginPage.aspx");
        }

        protected void btnBook1_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookingPage.aspx");
        }

        protected void btnBook_Click(object sender, EventArgs e)
        {
            Response.Redirect("BookingPage.aspx");
        }
    }
}