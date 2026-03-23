const themeToggle = document.getElementById("themeToggle");
const themeToggleLabel = document.querySelector(".theme-toggle-label");
const themeColorMeta = document.querySelector('meta[name="theme-color"]');
const savedTheme = localStorage.getItem("theme");
const preferredTheme = window.matchMedia("(prefers-color-scheme: light)").matches ? "light" : "dark";
const activeTheme = savedTheme || preferredTheme;

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
// SMOOTH SCROLL (with offset fix)
// ==============================
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();

        const targetId = this.getAttribute('href');
        const target = document.querySelector(targetId);

        if (target) {
            const offset = 80; // adjust for sticky header
            const targetPosition = target.offsetTop - offset;

            window.scrollTo({
                top: targetPosition,
                behavior: 'smooth'
            });
        }
    });
});


// ==============================
// PAGE FADE-IN
// ==============================
window.addEventListener("load", () => {
    document.body.classList.add("loaded");
});


// ==============================
// SCROLL REVEAL (Optimized)
// ==============================
const observer = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add("show");
            observer.unobserve(entry.target); // improves performance
        }
    });
}, {
    threshold: 0.15
});

document.querySelectorAll("section, .project-card, .next-step-card").forEach(el => {
    el.classList.add("hidden");
    observer.observe(el);
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

// 🔥 NEW: CLICK IMAGE TO CLOSE
modalImg.onclick = () => {
    modal.style.display = "none";
};

document.addEventListener("keydown", (e) => {
    if (e.key === "Escape") {
        modal.style.display = "none";
    }
});
