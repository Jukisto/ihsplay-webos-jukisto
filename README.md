```
    ______  _______       __
   /  _/ / / / ___/____  / /___ ___  __      In-Home
   / // /_/ /\__ \/ __ \/ / __ `/ / / /     Streaming
 _/ // __  /___/ / /_/ / / /_/ / /_/ /     Player
/___/_/ /_//____/ .___/_/\__,_/\__, /     For Steam
               /_/            /____/
```

IHSplay is an SDL2 based Steam Link Client, primarily targeting webOS TV
and Raspberry Pi.

## IHSplay Fixed fork

This fork adds:

* working webOS Back, Exit, Channel Up and Channel Down key handling;
* visible Back buttons in the computer selection and Support views;
* a spinner and “Searching for computers...” status while Steam hosts are being discovered;
* a separate `fi.jukisto.ihsplay` application ID, so it can coexist with the upstream build.

Tagged releases automatically build an ARM webOS `.ipk`, its Homebrew manifest, and an
`apps.json` repository index. Add this stable URL in Homebrew Channel under
**Settings → Add repository**:

```text
https://github.com/Jukisto/ihsplay-webos-jukisto/releases/latest/download/apps.json
```

### Computer discovery and firewalls

IHSplay discovers Steam hosts by broadcasting UDP packets to port 27036. If the spinner
keeps running even though Steam Remote Play works from a phone using **Other Computer**,
check the PC firewall first: that phone option uses a direct connection and does not prove
that broadcast discovery replies are allowed. Temporarily disabling UFW is a useful test;
turn it back on immediately after testing and then add rules restricted to the TV's IP.

The application will be providing a TV remote / gamepad friendly UI, and
low latency video / audio output, as well as generic mouse / keyboard /
gamepad support.

---

![Home UI](https://user-images.githubusercontent.com/830358/219081008-e5eb646a-76fa-4683-9869-35e3923618ce.png)

![Streaming Overlay](https://user-images.githubusercontent.com/830358/207047480-8cc96496-4fab-4a0e-8d1a-896183c54a6e.png)


Stay tuned!
