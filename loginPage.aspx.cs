using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace Hotel_Mgnt_System
{
    public partial class loginPage : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            fnConnectDB();
        }

        public void fnConnectDB()
        {
            SqlConnection conn = new SqlConnection(strCon);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
                //Response.Write("DB Connected");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string aEmail = txtEmail.Text;
            string aPass = txtPass.Text;

            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            string query = "select count(*) from tblAdmin where email=@email and password=@pass";
            SqlCommand cmd = new SqlCommand(query, con);

            cmd.Parameters.AddWithValue("@email", aEmail);
            cmd.Parameters.AddWithValue("@pass", aPass);

            int i = Convert.ToInt16(cmd.ExecuteScalar());

            if (i == 0)
            {
                lblLogin.Text = "Email or Password is Incorrect";
            }
            else
            {
                Response.Redirect("Dashboard.aspx");
            }


        }
    }
}