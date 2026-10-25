-- Removes the team passcode (2026-10-26): nobody could remember it.
--
-- Every handover_* function calls private.handover_require first, so making
-- it accept anything opens them all. The functions keep their p_passcode
-- argument so the app that was live before this change keeps working; it is
-- simply ignored. The tables stay closed to the publishable key: reads and
-- writes still go only through these functions.
--
-- To bring a passcode back, re-run the handover_require definition from
-- 20260929_handovers.sql and set one with private.handover_set_passcode.
create or replace function private.handover_require(p_passcode text)
returns void language plpgsql security definer set search_path = '' as $$
begin
  -- No passcode any more.
end $$;
revoke all on function private.handover_require(text) from public, anon, authenticated;
