const zatvoriMeni = document.querySelector("#zatvoriMeni");
const otvoriMeni = document.querySelector("#otvoriMeni");
const navLinkovi = document.getElementById("navLinkovi");
const navBar = document.getElementById("navbar");

otvoriMeni.addEventListener("click", function () {
    navLinkovi.style.display = "block";
});

zatvoriMeni.addEventListener("click", function () {
    navLinkovi.style.display = "none";
})

setInterval(function () {
    navBar.style.width = screen.width;
    if (screen.width > 767) {
        navLinkovi.style.display = "block";
    }
}, 100);

const navbar = document.getElementById("navbar");
const sticky = navbar.offsetTop;

window.onscroll = () => {
    if (window.pageYOffset >= sticky) {
        navbar.classList.add("sticky")
    } else {
        navbar.classList.remove("sticky");
    }
}

const kurir = document.querySelector("#Kurir");
const saradjuj = document.querySelector("#Saradjuj");
const zaposlenje = document.querySelector("#Zaposlenje");

kurir.addEventListener("click", () => {
    window.location.href = "Poruci.html"
});
saradjuj.addEventListener("click", () => {
    window.location.href = "Poruci.html"
});
zaposlenje.addEventListener("click", () => {
    window.location.href = "Poruci.html"
});