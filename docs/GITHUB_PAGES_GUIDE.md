---
layout: default
title: "GitHub Pages Guide - dac"
---

# GitHub Pages Complete Guide

## 📖 What is GitHub Pages?

**GitHub Pages** is a **free static website hosting service** provided by GitHub. It automatically takes files from your GitHub repository and publishes them as a live website.

**Key Fact:** Your website code lives in your GitHub repo—no separate hosting account needed!

---

## 🎯 The Basics

### What it does:
- ✅ Hosts HTML, CSS, JavaScript files from your repo
- ✅ Generates websites from Markdown using Jekyll (optional)
- ✅ Automatically rebuilds when you push changes
- ✅ Free forever for public repositories
- ✅ Provides a live URL for your site

### What it doesn't do:
- ❌ **No server-side code** (no PHP, Ruby, Python backends)
- ❌ **No databases** (must be static content)
- ❌ **No server-side rendering** (except Jekyll build time)

### Who uses it?
- 📚 Project documentation sites
- 👤 Portfolio websites
- 📰 Blogs (with Jekyll)
- 🏢 Organization/company websites
- 📖 Open-source project home pages

---

## 🔗 Two Types of GitHub Pages Sites

### 1️⃣ **User/Organization Site** (Account-level)
- **Repository name must be:** `username.github.io`
- **Live URL:** `https://username.github.io`
- **Limit:** 1 per user/organization
- **Example:** `nosahama.github.io` = your personal site

### 2️⃣ **Project Site** (Repository-level) ← **This is what you're using!**
- **Repository name:** Any name (e.g., `dac`)
- **Live URL:** `https://username.github.io/repository-name`
- **Limit:** 1 per repository
- **Your URL:** `https://nosahama.github.io/dac`
- **Example:** Project documentation, README website

---

## 🚀 How It Works

### Step 1: You create files in `/docs` folder
```
your-repo/
├── docs/
│   ├── _config.yml      # Jekyll configuration
│   ├── index.md         # Homepage
│   └── about.md         # Another page
├── src/                 # Your actual project files
└── README.md
```

### Step 2: You push to GitHub
```bash
git add .
git commit -m "Update documentation"
git push origin main
```

### Step 3: GitHub Pages builds automatically
- Reads your files from `/docs`
- Optionally processes Markdown through Jekyll
- Publishes to `https://username.github.io/repo-name`

### Step 4: Site goes live
- Website is now live and accessible
- Rebuilds automatically on every push

---

## 🔧 How to Enable GitHub Pages

### For your `dac` repo:

1. **Go to Settings:**
   - Repository → Settings tab
   - Scroll down to "Pages" section (or click Pages in left sidebar)

2. **Configure Source:**
   - **Source:** "Deploy from a branch"
   - **Branch:** `main`
   - **Folder:** `/docs`
   - Click **Save**

3. **GitHub builds it:**
   - Takes 1-2 minutes
   - You'll see a green checkmark
   - Message: "Your site is live at https://nosahama.github.io/dac"

4. **Visit your site:**
   - Go to `https://nosahama.github.io/dac`
   - Your content from `docs/index.md` is now live!

---

## 📝 File Types GitHub Pages Accepts

| File Type | Processed By | Example |
|-----------|-------------|---------|
| `.html` | Served as-is | `index.html` |
| `.md` | Jekyll → HTML | `index.md` |
| `.css` | Served as-is | `style.css` |
| `.js` | Served as-is | `script.js` |
| `.json` | Served as-is | `data.json` |
| `.txt` | Served as-is | `notes.txt` |

### Special files:
- **`index.md` or `index.html`** — Homepage of your site
- **`_config.yml`** — Jekyll configuration (theme, title, etc.)
- **`.nojekyll`** — Tells GitHub to skip Jekyll processing

---

## 🎨 Using Jekyll with GitHub Pages

**Jekyll** is a static site generator that GitHub Pages supports natively.

### What Jekyll does:
- Converts Markdown (`.md`) to HTML
- Applies themes automatically
- Processes templates and layouts
- Generates your final website

### Your current setup:
```yaml
# docs/_config.yml
theme: jekyll-theme-minimal      # Beautiful minimal theme
title: dac - Diagrams as Code     # Site title
description: ...                  # Site subtitle
show_downloads: true              # Show clone button
```

### How it works:
1. You write in Markdown
2. Jekyll converts to HTML
3. GitHub serves the HTML
4. Visitors see a beautiful website

### Popular themes:
- `jekyll-theme-minimal` (yours) — Clean, minimal
- `jekyll-theme-slate` — Dark with contrast
- `jekyll-theme-architect` — Professional
- `jekyll-theme-leap-day` — Colorful
- [See all themes](https://github.com/collections/github-pages-themes)

---

## 🌐 Custom Domain (Optional)

Want `https://dac.example.com` instead of `https://nosahama.github.io/dac`?

1. **Buy a domain** (GoDaddy, Namecheap, etc.)
2. **Go to repo Settings → Pages**
3. **Enter domain:** `dac.example.com`
4. **Update DNS records** at your registrar
5. **GitHub handles SSL certificate** (HTTPS) automatically

---

## 🔄 How Updates Work

### When you make changes:

```bash
# You edit docs/index.md
nano docs/index.md

# You push to GitHub
git add docs/index.md
git commit -m "Update docs"
git push origin main
```

### GitHub automatically:
1. ✅ Detects your push
2. ✅ Runs Jekyll build
3. ✅ Deploys to live URL
4. ✅ **Site updates in 1-2 minutes**

---

## 🐛 Troubleshooting

### Site won't load?

**Check 1:** Settings configured correctly
- Go to: Settings → Pages
- Verify: Branch = `main`, Folder = `/docs`

**Check 2:** Files exist
```bash
# In your repo root:
ls -la docs/
# Should show: _config.yml, index.md
```

**Check 3:** Check build status
- Settings → Pages
- Look for green checkmark or red error
- Click error to see build log

**Check 4:** Wait longer
- GitHub needs 1-2 minutes to build
- Try hard-refresh: `Ctrl+Shift+R`

**Check 5:** Fix Jekyll errors
- Most common: YAML syntax in `_config.yml`
- Must be valid YAML format
- Use this [YAML validator](https://www.yamllint.com/)

---

## 📊 Your dac Setup Breakdown

```
nosahama/dac (your repository)
│
├── docs/ ← GitHub Pages source
│   ├── _config.yml      ← Jekyll config (theme, title)
│   ├── index.md         ← Homepage content (Markdown)
│   └── SETTINGS_GUIDE.md ← Another page
│
└── diagrams/            ← Your actual project (ignored by Pages)
    ├── py/
    ├── uml/
    └── ...
```

### Result:
- 🌐 **Website URL:** `https://nosahama.github.io/dac`
- 📄 **Homepage from:** `docs/index.md`
- 🎨 **Theme from:** `docs/_config.yml`
- ✅ **Status:** Live and auto-updating

---

## 🚀 Advanced Features

### Add multiple pages:

Create new Markdown files:
```
docs/
├── index.md           → https://nosahama.github.io/dac/
├── installation.md    → https://nosahama.github.io/dac/installation.html
├── examples/
│   └── python.md      → https://nosahama.github.io/dac/examples/python.html
```

### Add navigation menu:

Edit `_config.yml`:
```yaml
title: dac - Diagrams as Code
theme: jekyll-theme-minimal
nav:
  - title: Home
    url: /
  - title: Installation
    url: /installation.html
  - title: Examples
    url: /examples/python.html
```

### Custom styling:

Create `docs/assets/css/style.scss`:
```scss
---
---
@import "{{ site.theme }}";
// Add your custom CSS here
```

---

## 📈 GitHub Pages Statistics

For your repo:
- **Domain:** `nosahama.github.io/dac`
- **Hosting cost:** Free
- **Bandwidth:** Unlimited
- **HTTPS:** Automatic (free)
- **Uptime:** 99.9%+ (GitHub's servers)
- **Updates:** Automatic on every push

---

## ✅ Next Steps for Your `dac` Project

1. ✅ **Files created** (`_config.yml`, `index.md`)
2. ✅ **GitHub Pages enabled** in Settings
3. ⏳ **Site should be live** at `https://nosahama.github.io/dac`
4. 📝 **Update repository description** (to help with GitHub Pages discovery)
5. 🎯 **Add homepage link** in repo settings

---

## 📚 Resources

- [Official GitHub Pages Docs](https://docs.github.com/en/pages/getting-started-with-github-pages/what-is-github-pages)
- [Jekyll Documentation](https://jekyllrb.com/)
- [GitHub Pages Themes](https://pages.github.com/themes/)
- [Markdown Cheatsheet](https://www.markdownguide.org/)

---

## 🎉 You now have:

1. ✅ Free website hosting (GitHub Pages)
2. ✅ Professional documentation site
3. ✅ Live URL for your project
4. ✅ Auto-updating on every git push
5. ✅ Beautiful theme applied automatically

**That's the power of GitHub Pages!** 🚀
