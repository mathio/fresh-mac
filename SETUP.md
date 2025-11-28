# Steps

1. Go through setup wizard
   - 🛜 connect to Wi-Fi
   - select languages
     - 🇺🇸 English
     - 🇸🇰 Slovak
   - select input languages
     - 🇺🇸 English - U.S
     - 🇸🇰 Slovak - QWERTY
   - 👤 create user account (`m`)
   - 🍏 login with Apple account
   - customize:
     - ✅ Location Services
     - ❌ Analytics
     - ❌ Screen Time
     - ❌ Apple Inteligence
     - ❌ Siri
     - ✅ FileVault Disk Encryption
     - ✅ Touch ID
     - ❌ Pay (not supported outside Safari)
     - Look: ☀️ Light / ~~🌙 Dark~~
     - ✅ Update automatically
2. [Download this repo](https://github.com/mathio/fresh-mac/archive/refs/heads/main.zip) (there is no git yet)
3. Open Terminal and run:

   ```
   cd ~/Downloads/fresh-mac-main
   ./bootstrap.sh
   bash ~/.macos
   bash ~/.brew
   ```

4. Additional settings in _System Preferences_:

   - Accessibility
   - Control Center
     - setup menubar items
   - Desktop & dock
     - Default web browser (Brave)
     - Drag windows to tile (automated)
   - Displays
     - Auto adjust brightness (off)
     - Night shift
       - Schedule: Sunset to Sunrise
       - Color temperature: Less Warm
   - Wallpaper
     - Customize
   - Touch ID & Password
     - Add multiple fingerprints
   - Keyboard
     - Keyboard Shortcuts -> Modifier Keys: Caps Lock = Command

5. _Finder_ setup

   - Favorites:
     - m (`~`)
     - Desktop
     - Dropbox
     - Recents
     - Applications
     - AirDrop
     - Downloads
     - work (`~/work`)
