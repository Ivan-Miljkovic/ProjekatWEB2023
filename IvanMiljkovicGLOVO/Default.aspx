<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="IvanMiljkovicGLOVO._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <section class="col-12" id="zaglavlje">
        <div id="naslov">
            <h1>Vi Zovete,<br>&nbsp;&nbsp;&nbsp;&nbsp;Mi Dostavljamo.</h1>
            <h1>Najbolji Sajt Za <br> Narucivanje Hrane <br> </h1>
        </div>
        <div id="slika">
            <img src="Slike/Logo.png" alt="pljeskavica" />
        </div>
    </section>
    <div id="bojaOpisa">
        <section id="opis" class="col-12">
            <h1>Kako funkcionise dostava?</h1>
            <div class="row">
                <div class="col">
                    <h3>Naruci hranu</h3>
                    <p>
                        Kako naruciti? Lako, samo kliknite <a href="Poruci.html">ovde</a> ili
                        kliknite gore na dugme poruci
                        i ispunite formu kako biste poslali porudzbinu nasem kuriru.
                        Uz veliki izbor restorana mozete naruciti omiljenu hranu ili naci nove
                        restorane u blizini.
                    </p>
                </div>
                <div class="col">
                    <h3>Brza dostava</h3>
                    <p>
                        Brzina nasih kurira je nenadmasiva. Narucite bilo sto u svom gradu
                        i nasi kuriri ce momentalno preuzeti vasu porudzbinu i dostaviti na vasu lokaciju.
                    </p>
                </div>
                <div class="col">
                    <h3>Dostava bilo cega</h3>
                    <p>
                        Niste ograniceni na samo hranu, mozete naruciti bilo sta, od gotove hrane,
                        namirnica, pa cak i do apoteke i cvecare, ako je u tvom gradu,
                        mozete racunati da cemo vam dostaviti.
                    </p>
                </div>
            </div>
        </section>
    </div>
    <div id="bojaUsluge">
        <section id="usluge">
            <h1>Hajde da zajedno da napredujemo!</h1>
            <div class="row">
                <div class="col radiSaNama klikniMe" id="Kurir">
                    <img src="Slike/kurir.jpg" alt="kurir">
                    <h3>Postani kurir!</h3>
                    <p>
                        Da li zelite da postanete kurir, ali ne znate kako?
                        Zapravo je vrlo jednostavno, svako moze postati nas kurir.
                        Ispunite formular,
                        pa cemo vam se javiti
                    </p>
                </div>
                <div class="col radiSaNama" id="Saradjuj">
                    <img src="Slike/sef.jpg" alt="sef">
                    <h3>Saradjuj sa nama!</h3>
                    <p>
                        Ako ste vlasnik restorana ili blio cega sto moze
                        da se dostavlja, mozete napredovati sa nama. Nasa
                        ogromna korisnicka baza vam mogu pomoci da napredujete.
                    </p>
                </div>
                <div class="col radiSaNama" id="Zaposlenje">
                    <img src="Slike/zaposlenje.jpg" alt="zaposlenje">
                    <h3>Zaposlenje!</h3>
                    <p>
                        Govlo takodje nudi mnogo poslova, od marketinga pa i
                        do IT sektora. Radujemo se vasem dolasku.
                    </p>
                </div>
            </div>
        </section>
    </div>
</asp:Content>
