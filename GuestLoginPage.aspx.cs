using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Mgnt_System
{
    public partial class GuestLoginPage : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string gEmail = txtEmail.Text;
            string gPass = txtPassword.Text;

            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            string query = "select count(*) from tblGuest where g_email=@email and password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@email", gEmail);
            cmd.Parameters.AddWithValue("@pass", gPass);

            int i = Convert.ToInt16(cmd.ExecuteScalar());

            if (i == 0)
            {
                lblMessage.Text = "Email or Password is Incorrect";
            }
            else
            {
                Session["gemail"] = txtEmail.Text;
                Response.Redirect("HomePage.aspx");
            }
        }

        
    }
}