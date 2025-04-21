using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Mgnt_System
{
    public partial class BookingPage : System.Web.UI.Page
    {

        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["gemail"] == null)
            {
                Response.Redirect("GuestLoginPage.aspx");
            }
            else if (!IsPostBack)  
            {
                FnBindRoomType();
            }
        }

        protected void btnLoginOut_Click(object sender, EventArgs e)
        {
            Session.Remove("gemail");
            //Response.Redirect("GuestLoginPage.aspx");
        }

        public void FnBindRoomType()
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            string query = "SELECT * FROM tblRoomType";
            SqlDataAdapter sda = new SqlDataAdapter(query, con);
            DataSet ds = new DataSet();
            sda.Fill(ds);

            ddlRoomType.DataSource = ds;
            ddlRoomType.DataTextField = "roomType";
            ddlRoomType.DataValueField = "type_id";
            ddlRoomType.DataBind();

            ddlRoomType.Items.Insert(0, new ListItem("-- Select Room --"));
        }

        protected void ddlRoomType_SelectedIndexChanged(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(strCon);
            con.Open();

            string query = "SELECT price FROM tblRoomType where type_id = @id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("id", ddlRoomType.SelectedValue);

            txtPricePerNight.Text = cmd.ExecuteScalar().ToString();

            lblMessage.Text = "";
            CalcTotalPrice();
        }

        protected void CalcTotalPrice()
        {
            if (DateTime.TryParse(txtCheckIn.Text, out DateTime checkIn) &&
                DateTime.TryParse(txtCheckOut.Text, out DateTime checkOut) &&
                int.TryParse(txtPricePerNight.Text, out int price) &&
                int.TryParse(txtNofRoom.Text, out int numOfRooms) && numOfRooms > 0)
            {
                if (checkOut > checkIn)
                {
                    int totalDays = (checkOut - checkIn).Days;
                    txtTotalPrice.Text = (totalDays * price * numOfRooms).ToString();
                }
                else
                {
                    lblMessage.Text = "Invalid Dates";
                    lblMessage.Visible = true;
                }
            }
        }



        protected void txtCheckIn_TextChanged(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            CalcTotalPrice();
        }

        protected void txtCheckOut_TextChanged(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            CalcTotalPrice();
        }
        protected void txtNofRoom_TextChanged(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            CalcTotalPrice();
        }

        protected void btnPayNow_Click(object sender, EventArgs e)
        {
            string userEmail = Session["gemail"].ToString();
            int noOfRooms = int.Parse(txtNofRoom.Text);

            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();

                //string getRoomQuery = "SELECT TOP 1 room_no FROM tblRoom WHERE type_id = @typeId AND status = 'Available'";
                //SqlCommand cmdRoom = new SqlCommand(getRoomQuery, con);
                //cmdRoom.Parameters.AddWithValue("@typeId", ddlRoomType.SelectedValue);

                //object roomObj = cmdRoom.ExecuteScalar();
                //if (roomObj == null)
                //{
                //    lblMessage.Text = "No available rooms for the selected type.";
                //    lblMessage.ForeColor = System.Drawing.Color.Red;
                //    lblMessage.Visible = true;
                //    return;
                //}
                //int roomNo = Convert.ToInt32(roomObj);


                //string getRoomsQuery = "SELECT TOP (@roomCount) room_no FROM tblRoom WHERE type_id = @typeId AND status = 'Available'";
                //SqlCommand cmdRooms = new SqlCommand(getRoomsQuery, con);
                //cmdRooms.Parameters.AddWithValue("@typeId", ddlRoomType.SelectedValue);
                //cmdRooms.Parameters.AddWithValue("@roomCount", Convert.ToInt32(txtNofRoom.Text));
                //List<int> roomNumbers = new List<int>();
                //using (SqlDataReader reader = cmdRooms.ExecuteReader())
                //{
                //    while (reader.Read())
                //    {
                //        roomNumbers.Add(reader.GetInt32(0));
                //    }
                //}
                ////reader.Close();
                //if (roomNumbers.Count < Convert.ToInt32(txtNofRoom.Text))
                //{
                //    lblMessage.Text = "Not enough available rooms.";
                //    lblMessage.ForeColor = System.Drawing.Color.Red;
                //    lblMessage.Visible = true;
                //    return;
                //}


                DataTable dtRooms = new DataTable();
                string getRoomQuery = "SELECT TOP (@noOfRooms) room_no FROM tblRoom WHERE type_id = @typeId AND status = 'Available'";
                SqlDataAdapter sda = new SqlDataAdapter(getRoomQuery, con);
                sda.SelectCommand.Parameters.AddWithValue("@typeId", ddlRoomType.SelectedValue);
                sda.SelectCommand.Parameters.AddWithValue("@noOfRooms", noOfRooms);
                sda.Fill(dtRooms);

                if (dtRooms.Rows.Count < noOfRooms)
                {
                    lblMessage.Text = "Not enough rooms available for the selected type.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    lblMessage.Visible = true;
                    return;
                }



                string insertPaymentQuery = "INSERT INTO tblPayment (payMethod, amountPaid) OUTPUT INSERTED.p_id VALUES (@payMethod, @amountPaid)";
                SqlCommand cmdPayment = new SqlCommand(insertPaymentQuery, con);
                cmdPayment.Parameters.AddWithValue("@payMethod", ddlPaymentMethod.SelectedValue);
                cmdPayment.Parameters.AddWithValue("@amountPaid", Convert.ToInt32(txtTotalPrice.Text));

                int paymentId = Convert.ToInt32(cmdPayment.ExecuteScalar());


                //string insertBookingQuery = "INSERT INTO tblBooking (g_email, room_no, p_id, checkInDate, checkOutDate, nofRoom, totalAmount) VALUES (@g_email, @room_no, @p_id, @checkIn, @checkOut, @nofRoom, @totalAmount)";

                //SqlCommand cmdBooking = new SqlCommand(insertBookingQuery, con);
                //cmdBooking.Parameters.AddWithValue("@g_email", userEmail);
                //cmdBooking.Parameters.AddWithValue("@room_no", roomNo);
                //cmdBooking.Parameters.AddWithValue("@p_id", paymentId);
                //cmdBooking.Parameters.AddWithValue("@checkIn", txtCheckIn.Text);
                //cmdBooking.Parameters.AddWithValue("@checkOut", txtCheckOut.Text);
                //cmdBooking.Parameters.AddWithValue("@nofRoom", Convert.ToInt32(txtNofRoom.Text));
                //cmdBooking.Parameters.AddWithValue("@totalAmount", Convert.ToInt32(txtTotalPrice.Text));

                //cmdBooking.ExecuteNonQuery();


                //string updateRoomQuery = "UPDATE tblRoom SET status = 'Booked' WHERE room_no = @roomNo";
                //SqlCommand cmdUpdateRoom = new SqlCommand(updateRoomQuery, con);
                //cmdUpdateRoom.Parameters.AddWithValue("@roomNo", roomNo);
                //cmdUpdateRoom.ExecuteNonQuery();

                //foreach (int roomNo in roomNumbers)
                //{
                //    string insertBookingQuery = "INSERT INTO tblBooking (g_email, room_no, p_id, checkInDate, checkOutDate, nofRoom, totalAmount) VALUES (@g_email, @room_no, @p_id, @checkIn, @checkOut, @nofRoom, @totalAmount)";

                //    SqlCommand cmdBooking = new SqlCommand(insertBookingQuery, con);
                //    cmdBooking.Parameters.AddWithValue("@g_email", userEmail);
                //    cmdBooking.Parameters.AddWithValue("@room_no", roomNo);
                //    cmdBooking.Parameters.AddWithValue("@p_id", paymentId);
                //    cmdBooking.Parameters.AddWithValue("@checkIn", txtCheckIn.Text);
                //    cmdBooking.Parameters.AddWithValue("@checkOut", txtCheckOut.Text);
                //    cmdBooking.Parameters.AddWithValue("@nofRoom", 1);
                //    cmdBooking.Parameters.AddWithValue("@totalAmount", Convert.ToInt32(txtTotalPrice.Text) / Convert.ToInt32(txtNofRoom.Text));

                //    cmdBooking.ExecuteNonQuery();


                //    string updateRoomQuery = "UPDATE tblRoom SET status = 'Booked' WHERE room_no = @roomNo";
                //    SqlCommand cmdUpdateRoom = new SqlCommand(updateRoomQuery, con);
                //    cmdUpdateRoom.Parameters.AddWithValue("@roomNo", roomNo);
                //    cmdUpdateRoom.ExecuteNonQuery();
                //}


                foreach (DataRow row in dtRooms.Rows)
                {
                    int roomNo = Convert.ToInt32(row["room_no"]);

                    string insertBookingQuery = "INSERT INTO tblBooking (g_email, room_no, p_id, checkInDate, checkOutDate, nofRoom, totalAmount) " +
                                                "VALUES (@g_email, @room_no, @p_id, @checkIn, @checkOut, @nofRoom, @totalAmount)";

                    SqlCommand cmdBooking = new SqlCommand(insertBookingQuery, con);
                    cmdBooking.Parameters.AddWithValue("@g_email", userEmail);
                    cmdBooking.Parameters.AddWithValue("@room_no", roomNo);
                    cmdBooking.Parameters.AddWithValue("@p_id", paymentId);
                    cmdBooking.Parameters.AddWithValue("@checkIn", txtCheckIn.Text);
                    cmdBooking.Parameters.AddWithValue("@checkOut", txtCheckOut.Text);
                    cmdBooking.Parameters.AddWithValue("@nofRoom", 1); 
                    cmdBooking.Parameters.AddWithValue("@totalAmount", Convert.ToInt32(txtTotalPrice.Text) / noOfRooms); 
                    cmdBooking.ExecuteNonQuery();

                    
                    string updateRoomQuery = "UPDATE tblRoom SET status = 'Booked' WHERE room_no = @roomNo";
                    SqlCommand cmdUpdateRoom = new SqlCommand(updateRoomQuery, con);
                    cmdUpdateRoom.Parameters.AddWithValue("@roomNo", roomNo);
                    cmdUpdateRoom.ExecuteNonQuery();
                }



                lblMessage.Text = "Booking Successful! Redirecting...";
                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Visible = true;

                Response.AddHeader("REFRESH", "2;URL=HomePage.aspx");
            }

        }

    }
}