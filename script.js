const themeToggle = document.getElementById("themeToggle");
const themeToggleLabel = document.querySelector(".theme-toggle-label");
const themeColorMeta = document.querySelector('meta[name="theme-color"]');
const savedTheme = localStorage.getItem("theme");
const activeTheme = savedTheme || "dark";

document.body.setAttribute("data-theme", activeTheme);

const syncThemeToggle = (theme) => {
    const isLight = theme === "light";

    themeToggle.setAttribute("aria-pressed", String(isLight));
    themeToggleLabel.textContent = isLight ? "Dark" : "Light";

    if (themeColorMeta) {
        themeColorMeta.setAttribute("content", isLight ? "#f5f7fb" : "#0d1117");
    }
};

syncThemeToggle(activeTheme);

themeToggle.addEventListener("click", () => {
    const nextTheme = document.body.getAttribute("data-theme") === "light" ? "dark" : "light";

    document.body.setAttribute("data-theme", nextTheme);
    localStorage.setItem("theme", nextTheme);
    syncThemeToggle(nextTheme);
});

// ==============================
// MOBILE NAVIGATION
// ==============================
const menuToggle = document.querySelector(".menu-toggle");
const primaryNavMenu = document.getElementById("primaryNavMenu");
const primaryNavLinks = primaryNavMenu ? primaryNavMenu.querySelectorAll("a") : [];
const mobileNavQuery = window.matchMedia("(max-width: 768px)");

const setMobileNavState = (isOpen) => {
    if (!menuToggle || !primaryNavMenu) return;

    document.body.classList.toggle("nav-open", isOpen);
    menuToggle.setAttribute("aria-expanded", String(isOpen));
    menuToggle.setAttribute("aria-label", isOpen ? "Close primary navigation" : "Open primary navigation");

    primaryNavLinks.forEach(link => {
        if (mobileNavQuery.matches && !isOpen) {
            link.setAttribute("tabindex", "-1");
        } else {
            link.removeAttribute("tabindex");
        }
    });
};

if (menuToggle && primaryNavMenu) {
    setMobileNavState(false);

    menuToggle.addEventListener("click", () => {
        setMobileNavState(!document.body.classList.contains("nav-open"));
    });

    primaryNavLinks.forEach(link => {
        link.addEventListener("click", () => setMobileNavState(false));
    });

    document.addEventListener("keydown", (e) => {
        if (e.key === "Escape") {
            setMobileNavState(false);
        }
    });

    mobileNavQuery.addEventListener("change", () => setMobileNavState(false));
}

// ==============================
// SMOOTH SCROLL
// ==============================

document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        const targetId = this.getAttribute('href');

        if (targetId === "#") return;

        const target = document.querySelector(targetId);

        if (!target) return;

        e.preventDefault();

        target.scrollIntoView({
            behavior: "smooth",
            block: "start"
        });
    });
});

// ==============================
// ACTIVE NAV LINK (Improved)
// ==============================
const sections = document.querySelectorAll("section[id]");
const navLinks = document.querySelectorAll("nav a");

window.addEventListener("scroll", () => {
    let currentSection = "";

    sections.forEach(section => {
        const sectionTop = section.offsetTop - 120;
        const sectionHeight = section.offsetHeight;

        if (window.scrollY >= sectionTop &&
            window.scrollY < sectionTop + sectionHeight) {
            currentSection = section.getAttribute("id");
        }
    });

    navLinks.forEach(link => {
        link.classList.remove("active");

        if (link.getAttribute("href") === `#${currentSection}`) {
            link.classList.add("active");
        }
    });
});

// IMAGE PREVIEW MODAL
const modal = document.getElementById("imageModal");
const modalImg = document.getElementById("modalImg");
const images = document.querySelectorAll(".preview-img");
const closeBtn = document.querySelector(".close");

// OPEN MODAL
images.forEach(img => {
    img.addEventListener("click", () => {
        modal.style.display = "flex";
        modalImg.src = img.src;
        modalImg.alt = img.alt;
    });
});

// CLOSE BUTTON
closeBtn.onclick = () => {
    modal.style.display = "none";
};

// CLICK OUTSIDE IMAGE
modal.onclick = (e) => {
    if (e.target === modal) {
        modal.style.display = "none";
    }
};

modalImg.onclick = () => {
    modal.style.display = "none";
};

document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
        modal.style.display = "none";
    }
});
