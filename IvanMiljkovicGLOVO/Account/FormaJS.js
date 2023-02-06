const forma = document.querySelector("#formular");
const greska = document.querySelector("#greska");

function Greska(tekst, ev, polje) {
    greska.textContent = tekst;
    ev.preventDefault();
    polje.focus();
}
function containsNumbers(str) {
    return /\d/.test(str);
}
function containsOnlyNumbers(str) {
    return /^\d+$/.test(str);
}
forma.addEventListener("submit", function (ev)
{
    let polje;

    polje = document.querySelector("#ime");
    const imeiprezime = polje.value.trim();
    if (imeiprezime === "")
    {
        Greska("Unesi ime i prezime", ev, polje);
        return false;
    }
    const imePrezime = polje.value.split(' ');
    if (imePrezime.length === 1)
    {
        Greska("Unesi prezime", ev, polje);
        return false;
    }
    const ime = imePrezime[0];
    const prezime = imePrezime[1];
    //ImePrezime
    if (containsNumbers(ime))
    {
        Greska("Ime ne sme imati specijalne znakove i brojeve", ev, polje);

        return false;
    }
    if (containsNumbers(prezime))
    {
        Greska("Prezime ne sme imati specijalne znakove i brojeve", ev, polje);
        return false;
    }

    //Adresa
    polje = document.querySelector("#adresa");
    const adresa = polje.value.trim();

    if (adresa === "")
    {
        Greska("Unesi ulicu", ev, polje);
        return false;
    }

    const adresa1 = adresa.split(',');
    const ulica = adresa[0];
    const brojKuce = adresa1[1];

    if (adresa1.length === 1)
    {
        Greska("Unesi broj kuce", ev, polje);
        return false;
    }
    if (containsNumbers(ulica))
    {

        Greska("Ulica ne sme imati broj", ev, polje);
        return false;
    }
    if (!containsOnlyNumbers(brojKuce))
    {
        Greska("Broj kuce mora biti broj", ev, polje);
        return false;
    }

    //Broj telefona
    polje = document.querySelector("#telefon");
    const telefon = polje.value;

    if (telefon === "") {
        Greska("Unesi telefon", ev, polje);
        return false;
    }
    if (!containsOnlyNumbers(telefon))
    {
        Greska("Telefon ne sme imati slova ili specijalne znakove", ev, polje);
        return false;
    }
    if (telefon.length != 10)
    {
        Greska("Telefon mora imati deset cifara", ev, polje);
        return false;
    }

    polje = document.querySelector("#dostava");
    const dostava = polje.value.trim();
    if (dostava === "")
    {
        Greska("Izaberi dostavu", ev, polje);
        return false;
    }

    polje = document.querySelector("#proizvod");
    const proizvod = polje.value.trim();

    if (proizvod === "")
    {
        Greska("Izaberi proizvod", ev, polje);
        return false;
    }

    if (online.checked) {
        polje = document.querySelector("#kreditnaKartica");
        kartica = polje.value.split('-');

        if (kartica.length != 4) Greska("Kartica mora imati 4 odeljka brojeva", ev, polje);
        for (const odeljak of kartica) {
            if (odeljak.length != 4) Greska("Svaki odeljak kartice mora imati 4 broja", ev, polje);
            if (!containsOnlyNumbers(odeljak)) Greska("Kreditna kartica sme da sadrzi samo brojeve", ev, polje);
        }
    }
    return true;
});
forma.addEventListener('reset', function (ev) {
    const treba_resetovati = window.confirm('Da li zelite da ponistite unos?');

    if (!treba_resetovati) {
        ev.preventDefault();
        return false;
    }
    return true;
});

const divOnline = document.querySelector("#divOnline");
const online = document.querySelector("#online");

setInterval(() => {
    if (!online.checked)
    {
        divOnline.style.display = "none";
    }
    else
    {
        divOnline.style.display = "block";
    }
}, 100);