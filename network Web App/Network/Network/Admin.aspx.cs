using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Network
{
    public partial class Contact : Page
    {
        SqlConnection baglanti = new SqlConnection();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAddCard_Click(object sender, EventArgs e)
        {
            try
            {
                // SQL'e bağlanma
                baglanti.ConnectionString = "Data Source=ENES\\MSSQLSERVER2;Initial Catalog=networkLoginDatabase2;Integrated Security=true";

                // Price değerini sayısal bir değere dönüştürme kontrolü
                int price;
                if (!int.TryParse(txtPrice.Text, out price))
                {
                    // Price kutusuna sadece sayısal değerler girilebilir uyarısı
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Price kutusuna sadece sayısal değerler girilebilir.');", true);
                    return;
                }

                // Yeni kayıt ekleme işlemi
                SqlCommand cmdekle = new SqlCommand("INSERT INTO Card (ImageUrl, Brand, Title, Category, Price) VALUES (@ImageUrl, @Brand, @Title, @Category, @Price)", baglanti);
                cmdekle.Parameters.AddWithValue("@ImageUrl", txtImageUrl.Text);
                cmdekle.Parameters.AddWithValue("@Brand", txtBrand.Text);
                cmdekle.Parameters.AddWithValue("@Title", txtTitle.Text);
                cmdekle.Parameters.AddWithValue("@Category", txtCategory.Text);
                cmdekle.Parameters.AddWithValue("@Price", txtPrice.Text);
                baglanti.Open();
                cmdekle.ExecuteNonQuery(); // INSERT INTO cümlesini çalıştırır.

                // Kayıt başarılı olduğunda JavaScript alert mesajı gösterme
                ScriptManager.RegisterStartupScript(this, this.GetType(), "success", "alert('Kayıt başarıyla eklendi.');", true);
            }
            catch (Exception)
            {
                // Kayıt başarısız olduğunda JavaScript alert mesajı gösterme
                ScriptManager.RegisterStartupScript(this, this.GetType(), "error", "alert('Kayıt başarısız oldu.');", true);
            }
            finally
            {
                baglanti.Close();
                txtTitle.Text = "";
                txtBrand.Text = "";
                txtCategory.Text = "";
                txtImageUrl.Text = "";
                txtPrice.Text = "";
            }

        }
    }
}
