-- DNG MART cross-device order synchronization
-- Run this once in Supabase SQL Editor.

create table if not exists public.dng_sync (
  key text primary key,
  data jsonb not null,
  updated_at timestamptz not null default now()
);

alter table public.dng_sync enable row level security;

-- This matches the current frontend architecture, which has client-side admin auth.
-- For production, replace these broad policies with authenticated/admin policies.
drop policy if exists "dng_sync_select" on public.dng_sync;
drop policy if exists "dng_sync_insert" on public.dng_sync;
drop policy if exists "dng_sync_update" on public.dng_sync;

create policy "dng_sync_select" on public.dng_sync for select using (true);
create policy "dng_sync_insert" on public.dng_sync for insert with check (true);
create policy "dng_sync_update" on public.dng_sync for update using (true) with check (true);

-- Enable Realtime for the table.
alter table public.dng_sync replica identity full;
do $$
begin
  alter publication supabase_realtime add table public.dng_sync;
exception
  when duplicate_object then null;
end $$;
