using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace IvanMiljkovicGLOVO
{
    public partial class Poruci : System.Web.UI.Page
    {
        public List<string> Objekti = new List<string>();
        static string cs = @"Data Source=DESKTOP-15674DJ\IVANSQL;Initial Catalog=Glovo;Integrated Security=True";
        SqlConnection con = new SqlConnection(cs);
        protected void Page_Load(object sender, EventArgs e)
        {
                try
                {
                con.Open();
                PopulateDropDown(con);

                if (Request.HttpMethod == "POST")
                    {
                    string ImePrezime = Request.Form["ime"];
                    string Adresa = Request.Form["adresa"];
                    string Telefon = Request.Form["telefon"];
                    string KreditnaKartica = Request.Form["kreditnaKartica"];
                    string Dostava = Request.Form["dostava"];
                    string Proizvod = Request.Form["proizvod"];
                    int Placanje = int.Parse(Request.Form["placanje"]);

                    if (KreditnaKartica.Trim() == "")
                    {
                        KreditnaKartica = "NULL";
                    }
                    
                    System.Diagnostics.Debug.WriteLine("Uneto Ime: " + ImePrezime);
                    System.Diagnostics.Debug.WriteLine("Uneta adresa: " + Adresa);
                    System.Diagnostics.Debug.WriteLine("Unet telefon: " + Telefon);
                    System.Diagnostics.Debug.WriteLine("Uneta dostava: " + Dostava);
                    System.Diagnostics.Debug.WriteLine("Unet proizvod: " + Proizvod);
                    System.Diagnostics.Debug.WriteLine("Uneta kartica: " + KreditnaKartica);
                    if(ProveriDaLiKorisnikPostoji(con,ImePrezime,Adresa,Telefon,KreditnaKartica))
                    {
                        System.Diagnostics.Debug.WriteLine("Korisnik Postoji");
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine("Korisnik ne postoji");
                        UbaciKorisnika(con, ImePrezime, Adresa, Telefon, KreditnaKartica);
                    }
                    NapraviPorudzbinu(con, ImePrezime, Adresa, Telefon, KreditnaKartica,Dostava, Proizvod, Placanje);
                }
                
                    con.Close();
                }
                catch (Exception ex)
                {
                System.Diagnostics.Debug.WriteLine(ex.Message);
                System.Diagnostics.Debug.WriteLine(ex.StackTrace);
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            
        }

        protected void posalji_Click(object sender, EventArgs e)
        {
            
        }
        bool ProveriDaLiKorisnikPostoji(SqlConnection con, string ImePrezime, string Adresa, string Telefon, string Kartica)
        {    
            SqlDataReader reader = NadjiKorisnika(con, ImePrezime, Adresa, Telefon, Kartica);

            if (reader.HasRows)
            {
                reader.Close();
                return true;               
            }
            reader.Close();
            return false;
        }
        void UbaciKorisnika(SqlConnection con, string ImePrezime, string Adresa, string Telefon, string Kartica)
        {
            SqlParameter imePrezime = new SqlParameter();
            SqlParameter adresa = new SqlParameter();
            SqlParameter telefon = new SqlParameter();
            SqlParameter kartica = new SqlParameter();
            imePrezime.Value = ImePrezime;
            adresa.Value = Adresa;
            telefon.Value = Telefon;
            kartica.Value = Kartica;
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

            System.Diagnostics.Debug.WriteLine("Uspesno ubacen korisnik");
        }
        void NapraviPorudzbinu(SqlConnection con, string ImePrezime, string Adresa, string Telefon, string Kartica, string Objekat,string Proizvod,int placanje)
        {
            SqlDataReader reader = NadjiKorisnika(con, ImePrezime, Adresa, Telefon, Kartica);
            reader.Read();

            int korisnikID = int.Parse(reader[0].ToString());
            reader.Close();
            int kurirID = SelectRandomKurirID(con);
            int objekatID = SelectObjekatID(con, Objekat);

            SqlParameter KorisnikID = new SqlParameter();
            SqlParameter KurirID = new SqlParameter();
            SqlParameter ObjekatID = new SqlParameter();
            SqlParameter PlacanjeUzivo = new SqlParameter();

            KorisnikID.Value = korisnikID;
            KurirID.Value = kurirID;
            ObjekatID.Value = objekatID;
            PlacanjeUzivo.Value = placanje;

            KorisnikID.ParameterName = "@KorisnikID";
            KurirID.ParameterName = "@KurirID";
            ObjekatID.ParameterName = "@ObjekatID";
            PlacanjeUzivo.ParameterName = "@PlacanjeUzivo";

            string upit = "INSERT INTO Porudzbina VALUES (@KorisnikID, @ObjekatID, @KurirID,  @PlacanjeUzivo)";
            SqlCommand cmd = new SqlCommand(upit, con);
            cmd.Parameters.Add(KorisnikID);
            cmd.Parameters.Add(ObjekatID);
            cmd.Parameters.Add(KurirID);
            cmd.Parameters.Add(PlacanjeUzivo);
            cmd.ExecuteNonQuery();

            System.Diagnostics.Debug.WriteLine("Uspesno napravljena porudzbina!");
        }
        int SelectRandomKurirID(SqlConnection con)
        {
            List<int> kurirIDs = new List<int>();
            Random r = new Random();
            string upit = "SELECT KURIRID FROM Kurir";
            SqlCommand cmd = new SqlCommand(upit, con);
            SqlDataReader reader = cmd.ExecuteReader();

            while(reader.Read())
            {
                int id = int.Parse(reader[0].ToString());
                kurirIDs.Add(id);
            }
            int a = r.Next(0, kurirIDs.Count);
            System.Diagnostics.Debug.WriteLine(kurirIDs[a]);
            reader.Close();
            return kurirIDs[a];
        }
        int SelectObjekatID(SqlConnection con,string Objekat)
        {
            SqlParameter objekat = new SqlParameter();
            objekat.Value = Objekat;
            objekat.ParameterName = "@Naziv";
            string upit = "SELECT OBJEKATID FROM Objekat WHERE NAZIV = @Naziv";
            SqlCommand cmd = new SqlCommand(upit, con);
            cmd.Parameters.Add(objekat);  
            SqlDataReader reader = cmd.ExecuteReader();
            reader.Read();
            int id = int.Parse(reader[0].ToString());
            System.Diagnostics.Debug.WriteLine(id);
            reader.Close();
            return id;
            
            
        }
        SqlDataReader NadjiKorisnika(SqlConnection con, string ImePrezime, string Adresa, string Telefon, string Kartica)
        {
        SqlParameter imePrezime = new SqlParameter();
        SqlParameter adresa = new SqlParameter();
        SqlParameter telefon = new SqlParameter();
        SqlParameter kartica = new SqlParameter();
        imePrezime.Value = ImePrezime;
            adresa.Value = Adresa;
            telefon.Value = Telefon;
            kartica.Value = Kartica;
            imePrezime.ParameterName = "@IMEPREZIME";
            adresa.ParameterName = "@ADRESA";
            telefon.ParameterName = "@TELEFON";
            kartica.ParameterName = "@KARTICA";
            string upit = "SELECT * FROM Korisnici " +
                        "WHERE IMEPREZIME = @IMEPREZIME " +
                        "AND ADRESA = @ADRESA " +
                        "AND TELEFON = @TELEFON " +
                        "AND KREDITNA_KARTICA = @KARTICA";
        SqlCommand cmd = new SqlCommand(upit, con);
        cmd.Parameters.Add(imePrezime);
            cmd.Parameters.Add(adresa);
            cmd.Parameters.Add(telefon);
            cmd.Parameters.Add(kartica);
            SqlDataReader reader = cmd.ExecuteReader();
            return reader;
        }
        void PopulateDropDown(SqlConnection con)
        {
            string upit = "SELECT * FROM Objekat";
            SqlCommand cmd = new SqlCommand(upit, con);
            SqlDataReader reader = cmd.ExecuteReader();

            if(reader.HasRows)
            {
                while(reader.Read())
                {
                    Objekti.Add(reader[3].ToString());
                }
            }
            reader.Close();
        }
    }
}