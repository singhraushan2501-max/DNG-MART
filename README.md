# DNG Mart — GitHub Pages

This repository is prepared for GitHub Pages and the custom domain **dngmart.in**.

## Site
- Storefront: `https://dngmart.in/`
- Admin: `https://dngmart.in/admin/`

## Deploy
1. Create a GitHub repository and upload this project to the `main` branch.
2. In **Settings → Pages**, select **GitHub Actions** as the source.
3. The included workflow `.github/workflows/pages.yml` deploys the site automatically on pushes to `main`.
4. The included `CNAME` file configures the custom domain `dngmart.in`.
5. At your DNS provider, point the domain to GitHub Pages using GitHub's current Pages custom-domain instructions. Enable HTTPS after DNS is verified.

## Important data note
The supplied storefront/admin implementation uses browser `localStorage` for products, orders, customers, referrals, cart, and settings. GitHub Pages hosts the files but does not provide a shared backend database. Therefore, the current admin data is browser/device-specific. A real shared database/API should be added before using this as a production multi-device ordering system.
