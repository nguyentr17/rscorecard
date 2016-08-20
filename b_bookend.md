---
layout: page
title: "Initialize and Get"
---

These commands are used to start and end the data request.

## `sc_init()`

Use `sc_init()` to start the command chain. The only real option is whether you want to use standard variable names (as they are found in IPEDS) or the new developer-friendly variable names developed for the Scorecard API. Unless you have good reason for doing so, I recommend using the default standard names. If you want to use the developer-friendly names, set `dfvars = TRUE`. Whichever you choose, you're stuck with that option for the length of piped command chain; no switching from one type to another.

## `sc_get()`

Use `sc_get()` as the last command in the chain. If you haven't used `sc_key` to store your data.gov API key in the system environment, then you must supply your key as an argument.

