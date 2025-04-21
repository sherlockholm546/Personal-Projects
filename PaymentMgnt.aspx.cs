using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Mgnt_System
{
    public partial class Payment : System.Web.UI.Page
    {
        string strCon = ConfigurationManager.ConnectionStrings["connStr"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            BindGrid();

        }

        private void BindGrid()
        {
            using (SqlConnection conn = new SqlConnection(strCon))
            {
                string query = "SELECT * FROM tblPayment";
                SqlDataAdapter sda = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                gvPay.DataSource = dt;
                gvPay.DataBind();
            }
        }
    }
}