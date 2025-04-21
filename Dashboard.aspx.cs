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
    public partial class Dashboard : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            FetchGuest();
            FetchBooking();
            FetchTotalRooms();
            FetchAvailableRooms();
            FetchOccupiedRooms();
        }

        public void FetchGuest()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "select count(*) from tblGuest";
            SqlCommand cmd = new SqlCommand(query, con);
            lblTotalGuests.Text = cmd.ExecuteScalar().ToString();
        }

        public void FetchBooking()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "select count(*) from tblBooking";
            SqlCommand cmd = new SqlCommand(query, con);
            lblTotalBookings.Text = cmd.ExecuteScalar().ToString();
        }

        public void FetchTotalRooms()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();
            string query = "select count(*) from tblRoom";
            SqlCommand cmd = new SqlCommand(query, con);
            lblTotalRooms.Text = cmd.ExecuteScalar().ToString();
        }

        public void FetchAvailableRooms()
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM tblRoom WHERE status = 'Available'";
                SqlCommand cmd = new SqlCommand(query, con);
                lblAvailableRooms.Text = cmd.ExecuteScalar().ToString();
            }
        }

        public void FetchOccupiedRooms()
        {
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();
                string query = "SELECT COUNT(*) FROM tblRoom WHERE status = 'Booked'";
                SqlCommand cmd = new SqlCommand(query, con);
                lblOccupiedRooms.Text = cmd.ExecuteScalar().ToString();
            }
        }

    }
}