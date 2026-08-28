# DNG Mart — GitHub-ready cross-device sync

## Files
- `Storefront live.html` — customer storefront
- `adminlive.html` — admin dashboard
- `dng-cloud-config.js` — Supabase URL + anon/public key
- `dng_mart_supabase_setup.sql` — database + realtime setup

## Before publishing
1. Create a Supabase project.
2. Open `dng-cloud-config.js`.
3. Replace `YOUR_SUPABASE_PROJECT_URL` and `YOUR_SUPABASE_ANON_KEY`.
4. In Supabase SQL Editor, run `dng_mart_supabase_setup.sql`.
5. Upload all four files to the same GitHub Pages/site directory.
6. Keep the filenames exactly as shown, or update your links if you rename them.

The anon/public key is intended for browser use. Do NOT use the service_role key in frontend code.

## What is fixed
Orders, products, customers, referrals and online settings use the shared `dng_sync` table when Supabase is configured. The admin subscribes to realtime order changes, so an order placed on a phone can appear on an already-open laptop dashboard without a page refresh.

LocalStorage remains as a local cache/fallback. It is no longer the cross-device source of truth when cloud sync is enabled.
