<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Poruci.aspx.cs" Inherits="IvanMiljkovicGLOVO.Poruci" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Govlo</title>
    <link rel="stylesheet" href="Content/GlavnaStranicaCSS.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="FormaCSS.css" />
</head>
<body>
    <nav id="navbar" class="row">
        <div id="GovloNav" class="col col-12 col-md-3">
            <h5 id="Govlo" class="">Govlo</h5>
            <div class="col"><i class="fa fa-bars" id="otvoriMeni"></i></div>

        </div>
       <div class="col linkovi" id="navLinkovi">
                <i class="fa fa-times" id="zatvoriMeni"></i>
                <a href="Default.aspx" class="col-md-3">Pocetna</a>
                <a href="Poruci.aspx" class="col-md-3">Poruci</a>
                <a href="contact" class="col-md-3">Kontakt</a>
                <a href="Account/Login.aspx" class="col-md-3">Uloguj se</a>
                 <a runat="server" id="adminLink" visible="false" href="Admin\UpravljajKorisnicima.aspx">Admin</a>
                <a><h5><%: Context.User.Identity.GetUserName() %></h5></a>
               
                 
            </div>
    </nav>
    <form id="formular" runat="server" method="post">
        <div id="greska"></div>
        <br />
        <br />
        <br />
        <br />
        <div>
            <fieldset class="form-group">
                <legend>Licni podaci</legend>
                <div class="form-group col-6">
                    <label for="ime">Ime i Prezime</label>
                    <input type="text" id="ime" class="form-control col-6" placeholder="Pera Peric" name="ime" />
                    <%--<asp:TextBox ID="ime" runat="server" class="form-control col-6" placeholder="Pera Peric" name="ime"></asp:TextBox>--%>
                    <div class="invalid-feedback">
                        Please provide a valid last name.
               
                    </div>
                    <br />
                    <br />
                </div>
                <div class="form-group col-6">
                    <label for="adresa">Adresa*</label>
                    <%--<asp:TextBox ID="adresa" runat="server" CssClass="form-control col-6" placeholder="Milanka Subotica,4" name="adresa"></asp:TextBox>--%>
                    <input type="text" id="adresa" class="form-control col-6" placeholder="Milanka Subotica,4" name="adresa" />
                    <div class="invalid-feedback">
                        Please provide a valid last name.
               
                    </div>
                    <br />
                    <br />
                </div>
                <div class="form-group col-6">
                    <label for="telefon">Broj Telefona</label>
                    <input type="text" id="telefon" class="form-control col-6" placeholder="0637270185" name="telefon" />
                    <%--<asp:TextBox ID="telefon" runat="server" CssClass="form-control col-6" placeholder="0637270185" name="telefon"></asp:TextBox>--%>
                    <div class="invalid-feedback">
                        Please provide a valid last name.
               
                    </div>
                    <br />
                    <br />
                </div>
            </fieldset>
            <fieldset>
                <legend>Dostava</legend>
                <div class="form-group col-6">
                    <label for="dostava">Izaberi dostavu</label>
                    <select id="dostava" class="form-control col-6" name="dostava">
                        <option value="">Restoran/apoteka/cvecara itd...</option>
                        <%for (int i = 0; i < Objekti.Count; i++)
                          {%>
                        <option value ="<%=Objekti[i]%>"><%=Objekti[i]%></option>
                        <%} %>
                    </select>
                    <%--<asp:DropDownList ID="dostava" runat="server" CssClass="form-control col-6" name="dostava"></asp:DropDownList>--%>
                    <%-- <input type="text" id="dostava" class="form-control col-6" placeholder="Restoran/apoteka/cvecara itd..." name="dostava" />--%>
                    <%-- <asp:TextBox ID="dostava" runat="server" CssClass="form-control col-6" placeholder="Restoran/apoteka/cvecara itd..." name="dostava"></asp:TextBox>--%>
                    <div class="invalid-feedback">
                        Please provide a valid last name.
               
                    </div>
                    <br />
                    <br />
                </div>
                <div class="form-group col-6">
                    <label for="proizvod">Ime proizvoda</label>
                    <input type="text" id="proizvod" class="form-control col-6" placeholder="Proizvod" name="proizvod" />
                    <div class="invalid-feedback">
                        Please provide a valid last name.
               
                    </div>
                    <%-- <asp:TextBox ID="proizvod" runat="server" CssClass="form-control col-6" placeholder="Proizvod" name="proizvod"></asp:TextBox>--%>
                    <br />
                    <br />
                    <br />
                    <br />
                </div>
                <label for="placanje">Nacin placanja:</label>
                <div class="form-group col-6">
                    <div class="form-check-inline">
                        <input type="radio" id="uzivo" class="form-check-input" name="placanje" value="1" checked="checked" />
                        <%--<asp:RadioButton ID="uzivo" runat="server" CssClass="form-check-input" name="placanje" value="1" checked="true"/>--%>
                        <label for="uzivo" class="form-check-label">Placanje uzivo</label>
                    </div>
                    <div class="form-check-inline">
                        <input type="radio" id="online" class="form-check-input" name="placanje" value="0" />
                        <%--<asp:RadioButton ID="online" runat="server" CssClass="form-check-input" name="placanje" value="2"/>--%>
                        <label for="online" class="form-check-label">Placanje online</label>
                    </div>
                    <br />
                    <br />
                    <br />
                    <br />
                    <div class="form-group " id="divOnline">
                        <label for="kreditnaKartica">Kreditna kartica</label>
                        <input type="text" id="kreditnaKartica" placeholder="1234-1234-1234-1234" class="form-control" name="kreditnaKartica" />
                        <%--<asp:TextBox ID="kreditnaKartica" runat="server" placeholder="1234-1234-1234-1234" CssClass="form-control"></asp:TextBox>--%>
                        <div class="invalid-feedback">
                            Please provide a valid last name.
                    
                        </div>
                    </div>
                </div>
            </fieldset>
            <div id="dugmad">
                <div class="form-group text-center">
                    <button id="posalji" type="submit" class="btn-primary btn" runat="server">Potvrdi</button>
                    <%--<asp:Button ID="posalji" runat="server" Text="Potvrdi" type="submit" CssClass="btn-primary btn" OnClick="posalji_Click"/>--%>
                </div>
                <div class="form-group text-center">
                    <button id="obrisi" type="reset" class="btn-danger btn">Obrisi</button>
                </div>
            </div>
        </div>
    </form>
    <footer id="footer">
        <div class="red">
            <h5>Hajde Zajedno da napredujemo</h5>
            <div class="colona">
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/Poruci.aspx">Zaposlenje</asp:HyperLink>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/Poruci.aspx">Glovo za partnere</asp:HyperLink>
                <asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/Poruci.aspx">Dostavljaci</asp:HyperLink>
            </div>
        </div>
        <div class="red">
            <h5>Vazni linkovi</h5>
            <div class="colona">
                <asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/Poruci.aspx">O nama</asp:HyperLink>
                <asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/Poruci.aspx">Cesta pitanja</asp:HyperLink>
                <asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/Poruci.aspx">Blog</asp:HyperLink>
                <asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/Poruci.aspx">Kontaktiraj nas</asp:HyperLink>
                <asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/Poruci.aspx">Bezbednost</asp:HyperLink>
            </div>
        </div>
        <div class="red">
            <h5>Prati nas</h5>
            <div class="colona">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Poruci.aspx">Facebook</asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/Poruci.aspx">Twitter</asp:HyperLink>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Poruci.aspx">Instagram</asp:HyperLink>
            </div>
        </div>
    </footer>
    <script src="FormaJS.js"></script>
</body>
</html>
