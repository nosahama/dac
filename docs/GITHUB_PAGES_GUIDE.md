- `jekyll-theme-architect` — Professional
- `jekyll-theme-leap-day` — Colorful
- [See all themes](https://github.com/collections/github-pages-themes)

---

## 🌐 Custom Domain (Optional)

Want `https://dac.example.com` instead of `https://nosahama.github.io/diagrams-as-code`?

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
- 🌐 **Website URL:** `https://nosahama.github.io/diagrams-as-code`
- 📄 **Homepage from:** `docs/index.md`
- 🎨 **Theme from:** `docs/_config.yml`
- ✅ **Status:** Live and auto-updating

---

## 🚀 Advanced Features

### Add multiple pages:

Create new Markdown files:
```
docs/
├── index.md           → https://nosahama.github.io/diagrams-as-code/
├── installation.md    → https://nosahama.github.io/diagrams-as-code/installation.html
├── examples/
│   └── python.md      → https://nosahama.github.io/diagrams-as-code/examples/python.html
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
```
