# custom_wordcloud

No worries! Let’s fix that together. Below is a **full checklist** to help you push your R package or any project to your GitHub repository.

---

## 🧠 Before we begin, a quick summary of what we need:

* You created a GitHub repo (e.g., `custom_wordcloud2`)
* You have code locally (e.g., a folder called `custom_wordcloud2/`)
* You want to push your local code to that GitHub repo

---

## ✅ Full Step-by-Step Checklist

### 🔁 1. Go to Your Local Project Folder (via Terminal or Git Bash)

```bash
cd path/to/custom_wordcloud2
```

---

### 🔍 2. Check Git Status & Branch

```bash
git status
git branch
```

If Git is not initialized:

```bash
git init
```

---

### 🔄 3. Fix remote (if you got “remote origin already exists”)

#### A. Check what it's currently pointing to:

```bash
git remote -v
```

#### B. If it’s wrong, set it to your GitHub repo:

```bash
git remote set-url origin https://github.com/cheitra07/custom_wordcloud2.git
```

---

### ✅ 4. Add Files and Commit

```bash
git add .
git commit -m "Initial commit: add custom wordcloud package"
```

---

### 📤 5. Push to GitHub

#### If your local branch is `main`:

```bash
git push -u origin main
```

#### If your local branch is `master`:

```bash
git push -u origin master
```

You can rename to `main` if needed:

```bash
git branch -M main
git push -u origin main
```

---

## 🧪 Common Errors and Fixes

| Error Message                                  | Fix                                                                |
| ---------------------------------------------- | ------------------------------------------------------------------ |
| `remote origin already exists`                 | Use `git remote set-url origin NEW_URL`                            |
| `fatal: not a git repository`                  | Run `git init` first                                               |
| `fatal: refusing to merge unrelated histories` | Use `git pull origin main --allow-unrelated-histories` (once only) |
| `Permission denied (publickey)`                | Set up SSH key or use HTTPS URL and log in using PAT token         |

---

## 👀 Final Check

* Go to: [https://github.com/cheitra07/custom\_wordcloud2](https://github.com/cheitra07/custom_wordcloud2)
* You should see your code pushed ✅

---

If you want me to review your Git config, paste the output of:

```bash
git remote -v
git branch
git status
```

Great question! Here's a **simple step-by-step guide** to push your R package (or any local project) to a **GitHub repository you already created** manually.

---

## ✅ Scenario

You already created a GitHub repo, for example:

```
https://github.com/yourusername/wordcloudplus
```

You now want to push your local project (e.g., `wordcloudplus/` folder on your machine) to this GitHub repo.

---

## 🔧 Step-by-Step Guide

### ✅ Step 1: Open Terminal (or Git Bash or use RStudio Terminal)

Navigate to your local project directory:

```bash
cd path/to/wordcloudplus
```

### ✅ Step 2: Initialize Git (if not already initialized)

```bash
git init
```

### ✅ Step 3: Add all files and commit

```bash
git add .
git commit -m "Initial commit: custom wordcloud package"
```

### ✅ Step 4: Add your GitHub remote repo URL

```bash
git remote add origin https://github.com/yourusername/wordcloudplus.git
```

> Replace `yourusername` with your actual GitHub username.

### ✅ Step 5: Push to GitHub

If it's your first push:

```bash
git branch -M main
git push -u origin main
```

After that, just:

```bash
git push
```

---

## 📌 Optional: Use RStudio to do it

If you're in RStudio and using the Git tab:

1. Click **"Commit"** → select all files → write a commit message → click **"Commit"**.
2. Click **"Push"**.

If it's your first time using Git from RStudio, make sure you:

* Configure your Git (use `usethis::use_git_config()`).
* Set your GitHub PAT via `usethis::create_github_token()` and `gitcreds::gitcreds_set()`.

---

## 🧪 You can now verify

Visit:
➡️ `https://github.com/yourusername/wordcloudplus`
You’ll see your code live!

---
Perfect! Let's go step-by-step to **modify the wordcloud R package**, add a **custom function**, document it, check it, and **push it to GitHub**. I’ll also show you how to add **GitHub Actions for CI**.

---

## 🧱 Step 0: Setup

### ✅ Prerequisites

* R, RStudio installed
* `devtools`, `roxygen2`, `usethis`, `testthat`, `remotes` packages installed
* Git and GitHub account

---

## 🚀 Step 1: Create a New R Package (or Clone wordcloud)

```r
usethis::create_package("wordcloudplus")
```

OR clone and rename the wordcloud package manually:

```bash
git clone https://github.com/cran/wordcloud.git wordcloudplus
```

Then open the `wordcloudplus` folder in RStudio.

---

## ✍️ Step 2: Add `custom_wordcloud()` Function

Inside the `R/` folder, create a file called `custom_wordcloud.R`:

```r
#' Custom Word Cloud with Color Palette
#'
#' This function generates a word cloud with a selected color palette.
#'
#' @param words Vector of words
#' @param freq Vector of frequencies
#' @param palette RColorBrewer palette (default is "Set3")
#' @return A word cloud plot
#' @export
custom_wordcloud <- function(words, freq, palette = "Set3") {
  if (!requireNamespace("RColorBrewer", quietly = TRUE)) {
    stop("RColorBrewer package is required.")
  }
  
  colors <- RColorBrewer::brewer.pal(min(length(freq), 8), palette)
  wordcloud::wordcloud(words, freq, colors = colors)
}
```

---

## 📝 Step 3: Document Your Package

### Add `roxygen2` documentation and generate help files:

```r
devtools::document()
```

This creates `man/custom_wordcloud.Rd` and updates the `NAMESPACE`.

---

## 🔍 Step 4: Run Package Check

```r
devtools::check()
```

Fix any warnings or errors. If clean, you're good!

---

## 🧪 Step 5: (Optional) Add Unit Test

In `tests/testthat/test-custom_wordcloud.R`:

```r
test_that("custom_wordcloud works", {
  expect_error(custom_wordcloud(c("a", "b"), c(10, 20)), NA)
})
```

---

## 🌐 Step 6: Push to GitHub

### A. Create GitHub repo manually (e.g., `wordcloudplus`)

### B. Link local project to GitHub:

```r
usethis::use_git()
usethis::use_github()  # Log in via PAT when prompted
```

---

## ⚙️ Step 7: Add GitHub Actions for R CMD Check (CI)

```r
usethis::use_github_action_check_standard()
```

This adds a workflow in `.github/workflows/R-CMD-check.yaml`

It checks the package on Linux, macOS, and Windows automatically after each push.

---

## ✅ Final Structure

```
wordcloudplus/
├── .github/workflows/R-CMD-check.yaml
├── R/custom_wordcloud.R
├── man/custom_wordcloud.Rd
├── tests/testthat/test-custom_wordcloud.R
├── DESCRIPTION
├── NAMESPACE
├── README.md
```

---

## 🚀 To Install Your Package From GitHub

```r
remotes::install_github("yourusername/wordcloudplus")
```

---



