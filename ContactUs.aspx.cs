using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Mgnt_System
{
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLoginOut_Click(object sender, EventArgs e)
        {
            Session.Remove("gemail");
            //Response.Redirect("GuestLoginPage.aspx");
        }
    }
}