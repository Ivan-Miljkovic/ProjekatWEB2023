using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WEBSAJT_IVAN_MILJKOVIC_IV_4.Account
{
    public partial class UpravljajKorisnicima : System.Web.UI.Page
    {
        static string cs = @"Data Source=DESKTOP-15674DJ\IVANSQL;Initial Catalog=Glovo;Integrated Security=True";
        SqlConnection con = new SqlConnection(cs);
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                con.Open();
                SelectKorisnike(con);
                con.Close();
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(ex.StackTrace);
                ErrLabel.Text = "Greska";
            }
        }
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;

            int id = int.Parse(row.Cells[1].Text);
            string imePrezime = row.Cells[2].Text;
            string adresa = row.Cells[3].Text;
            string telefon = row.Cells[4].Text;
            string kartica = row.Cells[5].Text;

            TextBox1.Text = id.ToString();
            TextBox2.Text = imePrezime;
            TextBox3.Text = adresa;
            TextBox4.Text = telefon;
            TextBox5.Text = kartica;
        }

        protected void Unesi_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Proveri(false))
                {
                    Kontrola.Text = "Unesi sve podatke";
                    return;
                }

                con.Open();
                UnesiKorisnika(con);
                con.Close();
            }
            catch(Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(ex.StackTrace);
                ErrLabel.Text = "Greska";
            }
        }
       
        protected void Promeni_Click(object sender, EventArgs e)
        {
            try
            {
                if (!Proveri(true))
                {
                    Kontrola.Text = "Unesi sve podatke";
                    return;
                }

                con.Open();
                PromeniKorisnika(con);
                con.Close();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(ex.StackTrace);
                ErrLabel.Text = "Greska";
            }
        }
        void SelectKorisnike(SqlConnection con)
        {
            string upit = "SELECT * FROM Korisnici";
            SqlCommand cmd = new SqlCommand(upit, con);
            SqlDataReader reader = cmd.ExecuteReader();

            GridView1.DataSource = reader;
            GridView1.DataBind();

            reader.Close();
        }
        bool Proveri(bool id)
        {
            if (id)
            {
                if (TextBox1.Text.Trim() == "") return false;
            }
            if (TextBox2.Text.Trim() == "" || TextBox3.Text.Trim() == "" || TextBox4.Text.Trim() == "" || TextBox5.Text.Trim() == "")
            {
                return false;
            }
            return true;
        }
        void UnesiKorisnika(SqlConnection con)
        {
            SqlParameter imePrezime = new SqlParameter();
            SqlParameter adresa = new SqlParameter();
            SqlParameter telefon = new SqlParameter();
            SqlParameter kartica = new SqlParameter();
            imePrezime.Value = TextBox2.Text;
            adresa.Value = TextBox3.Text;
            telefon.Value = TextBox4.Text;
            kartica.Value = TextBox5.Text;
            imePrezime.ParameterName = "@IMEPREZIME";
            adresa.ParameterName = "@ADRESA";
            telefon.ParameterName = "@TELEFON";
            kartica.ParameterName = "@KARTICA";
            string upit = "INSERT INTO Korisnici VALUES(@IMEPREZIME, @ADRESA, @TELEFON, @KARTICA)";
            SqlCommand cmd = new SqlCommand(upit, con);
            cmd.Parameters.Add(imePrezime);
            cmd.Parameters.Add(adresa);
            cmd.Parameters.Add(telefon);
            cmd.Parameters.Add(kartica);

            cmd.ExecuteNonQuery();

            SelectKorisnike(con);
        }

        void PromeniKorisnika(SqlConnection con)
        {
            SqlParameter id = new SqlParameter();
            SqlParameter imePrezime = new SqlParameter();
            SqlParameter adresa = new SqlParameter();
            SqlParameter telefon = new SqlParameter();
            SqlParameter kartica = new SqlParameter();
            id.Value = TextBox1.Text;
            imePrezime.Value = TextBox2.Text;
            adresa.Value = TextBox3.Text;
            telefon.Value = TextBox4.Text;
            kartica.Value = TextBox5.Text;
            id.ParameterName = "@ID";
            imePrezime.ParameterName = "@IMEPREZIME";
            adresa.ParameterName = "@ADRESA";
            telefon.ParameterName = "@TELEFON";
            kartica.ParameterName = "@KARTICA";

            string upit = "UPDATE Korisnici " +
                        "SET IMEPREZIME = @IMEPREZIME, ADRESA = @ADRESA, TELEFON = @TELEFON, KREDITNA_KARTICA = @KARTICA " +
                        "WHERE KORISNIKID = @ID";

            SqlCommand cmd = new SqlCommand(upit, con);
            cmd.Parameters.Add(id);
            cmd.Parameters.Add(imePrezime);
            cmd.Parameters.Add(adresa);
            cmd.Parameters.Add(telefon);
            cmd.Parameters.Add(kartica);

            cmd.ExecuteNonQuery();

            SelectKorisnike(con);
        }
    }
}