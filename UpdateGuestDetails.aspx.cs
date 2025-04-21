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
	public partial class UpdateGuestDetails : System.Web.UI.Page
	{

        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
		{

            if (Session["gemail"] == null)
            {
                Response.Redirect("GuestLoginPage.aspx");
            }
            if (!IsPostBack)
            {
			    FetchDetail();
            }


        }

		public void FetchDetail()
		{

			SqlConnection con = new SqlConnection(strCon);
			con.Open();
			string query = "Select f_Name, l_Name, g_email, password, phoneNo, aadhar, DOB from tblGuest where g_email=@email";
			SqlCommand cmd = new SqlCommand(query, con);
			cmd.Parameters.AddWithValue("email", Session["gemail"]);

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.Read())
            {
                txtFirstName.Text = reader["f_Name"].ToString();
                txtLastName.Text = reader["l_Name"].ToString();
                txtEmail.Text = reader["g_email"].ToString();
                txtPass.Text = reader["password"].ToString();
                txtPhoneNumber.Text = reader["phoneNo"].ToString();
                txtAadhar.Text = reader["aadhar"].ToString();
                txtDOB.Text = Convert.ToDateTime(reader["DOB"]).ToString("yyyy-MM-dd");
            }
        }

        

        protected void btnLoginOut_Click(object sender, EventArgs e)
        {
            Session.Remove("gemail");
            //Response.Redirect("GuestLoginPage.aspx");
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);

            string query = "UPDATE tblGuest SET f_Name=@FirstName, l_Name=@LastName, g_email=@email, password=@pass, phoneNo=@PhoneNumber, aadhar=@aadhar, DOB=@DOB WHERE g_email=@sEmail";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName.Text);
            cmd.Parameters.AddWithValue("@LastName", txtLastName.Text);
            cmd.Parameters.AddWithValue("@email", txtEmail.Text);
            cmd.Parameters.AddWithValue("@pass", txtPass.Text);
            cmd.Parameters.AddWithValue("@PhoneNumber", txtPhoneNumber.Text);
            cmd.Parameters.AddWithValue("@aadhar", txtAadhar.Text);
            cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
            cmd.Parameters.AddWithValue("@sEmail", Session["gemail"]);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            FetchDetail();
        }
    }
}
