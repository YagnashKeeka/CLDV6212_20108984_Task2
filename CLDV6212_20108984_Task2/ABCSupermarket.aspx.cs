using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CLDV6212_20108984_Task2
{
    public partial class ABCSupermarket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //Data Source=LAPTOP-VLEFN8F4\SQLEXPRESS;Initial Catalog=ABCSupermarket20108984;Integrated Security=True
        protected void btnInsert_Click(object sender, EventArgs e)
        {
            try
            {
                string fn = Path.GetFileName(importImage.FileName);
                importImage.SaveAs(Server.MapPath("~/" + fn));

                SqlConnection con = new SqlConnection(@"Data Source=cldv6212server.database.windows.net;Initial Catalog=ABCSupermarket20108984;User ID=Keeka;Password=***********");
                SqlCommand cmd = new SqlCommand(@"INSERT INTO [dbo].[items]
                ([ItemID], [ItemImage]
                ,[ItemName]
                ,[ItemDescription]
                ,[ItemPrice])
                VALUES ('" + txtItemID.Text + "', '" + fn + "', '" + txtItemName.Text + "', '" + txtDescription.Text + "', '" + txtItemPrice.Text + "')", con);
                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Item Created Successfully");
                con.Close();
            }
            catch (Exception)
            {
                Response.Write("Invalid Fields");
            }
        }

        protected void btnGetItem_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=cldv6212server.database.windows.net;Initial Catalog=ABCSupermarket20108984;User ID=Keeka;Password=***********");

                SqlCommand cmdImage = new SqlCommand(@"SELECT [ItemImage] FROM [dbo].[items] WHERE [ItemName] = '" + txtName.Text + "'", con);
                con.Open();

                cmdImage.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmdImage);
                da.Fill(dt);
                imageDisplay.DataSource = dt;
                imageDisplay.DataBind();

                con.Close();


                SqlCommand cmdName = new SqlCommand(@"SELECT [ItemName] FROM [dbo].[items] WHERE [ItemName] = '" + txtName.Text + "'", con);
                con.Open();

                SqlDataReader readName = cmdName.ExecuteReader();
                if (readName.Read())
                {
                    lblName.Text = readName.GetValue(0).ToString();
                }

                con.Close();

                SqlCommand cmdDesc = new SqlCommand(@"SELECT [ItemDescription] FROM [dbo].[items] WHERE [ItemName] = '" + txtName.Text + "'", con);
                con.Open();

                SqlDataReader readDesc = cmdDesc.ExecuteReader();
                if (readDesc.Read())
                {
                    lbldesc.Text = readDesc.GetValue(0).ToString();
                }

                con.Close();

                SqlCommand cmdPrice = new SqlCommand(@"SELECT [ItemPrice] FROM [dbo].[items] WHERE [ItemName] = '" + txtName.Text + "'", con);
                con.Open();

                SqlDataReader readPrice = cmdPrice.ExecuteReader();
                if (readPrice.Read())
                {
                    lblPrice.Text = readPrice.GetValue(0).ToString();
                }

                con.Close();
            }
            catch (Exception)
            {
                Response.Write("Error Retrieving data. Please Try again");
            }

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                string fn = Path.GetFileName(importImage.FileName);
                importImage.SaveAs(Server.MapPath("~/" + fn));

                SqlConnection con = new SqlConnection(@"Data Source=cldv6212server.database.windows.net;Initial Catalog=ABCSupermarket20108984;User ID=Keeka;Password=***********");

                SqlCommand cmd = new SqlCommand(@"UPDATE [dbo].[items]
                SET [ItemID] = '" + txtItemID.Text + "'" +
                ",[ItemImage] = '" + fn + "'" +
                ",[ItemName] = '" + txtItemName.Text + "'" +
                ",[ItemDescription] = '" + txtDescription.Text + "'" +
                ",[ItemPrice] = '" + txtItemPrice.Text + "'" +
                "WHERE [ItemID] = '" + txtItemID.Text + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                Response.Write("Item Has Been Deleted Successfully");
                con.Close();
            }
            catch (Exception)
            {
                Response.Write("Update has not occured. Ivalid Fields");
            }
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                SqlConnection con = new SqlConnection(@"Data Source=cldv6212server.database.windows.net;Initial Catalog=ABCSupermarket20108984;User ID=Keeka;Password=***********");

                SqlCommand cmd = new SqlCommand(@"DELETE FROM [dbo].[items]
                WHERE [ItemID] = '" + txtItemID.Text + "'", con);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {
                Response.Write("!!!Item Has NOT been Deleted. Invalid Fields.");
            }
        }
    }
}