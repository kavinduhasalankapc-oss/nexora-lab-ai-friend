NEXORA LAB — AI Friend (Flutter + Gemini backend starter)

මේ ZIP එකේ තිබෙන්නේ source project එකක්; prebuilt APK එකක් නොවේ. Compile කර පරීක්ෂා කර නැති නිසා build success සහ Sinhala speech support phone එකේ පරීක්ෂා කළ යුතුයි.

අඩංගු දේ:
- Flutter Android app: animated AI face, text input, phone speech recognition/TTS
- Backend Node.js: Gemini API call + Google Search grounding request
- AI/Web source label සහ grounding links සඳහා මූලික support

වැදගත් ආරක්ෂාව:
- GEMINI_API_KEY එක Flutter app එකට කිසිවිටක දාන්න එපා.
- Backend .env එක private තබන්න; GitHub/public ZIP එකකට real key එක දාන්න එපා.
- API usage limits වෙනස් විය හැකියි. AI Studio dashboard එකෙන් quota සහ billing බලන්න.
- Google Search grounding සෑම model/tier එකකම එකම විදිහට නොතිබිය හැකියි. API error එකක් ආවොත් model availability, quota, region සහ billing settings පරීක්ෂා කරන්න.
- Backend deploy කරන විට HTTPS භාවිත කරන්න. Public app එකක් නිකුත් කිරීමට පෙර rate limiting, authentication, abuse protection, privacy notice සහ spending/quota limits එකතු කරන්න.

A. Backend run කිරීම (Node.js 20+)
1. backend folder එකට යන්න.
2. Terminal: npm install
3. .env.example එක copy කර .env ලෙස නම් කරන්න.
4. Google AI Studio වෙතින් API key එකක් ලබාගෙන .env එකේ GEMINI_API_KEY අගයට දාන්න.
5. npm start
6. Browser එකෙන් http://localhost:3000/health open කර {"ok":true,...} වගේ response එකක් බලන්න.
7. Backend එක HTTPS සහිත hosting එකකට deploy කරන්න. Localhost URL එක phone APK එකෙන් Internet හරහා වැඩ කරන්නේ නැහැ.

B. Flutter app එක backend එකට සම්බන්ධ කිරීම
1. Flutter SDK + Android Studio install කරන්න.
2. Project root folder එකේ:
   flutter create . --platforms=android
   flutter pub get
3. lib/main.dart තුлах _backendBaseUrl constant එක backend-ийн HTTPS URL-ээр replace කරන්න.
   (විකල්පය: build command එකේ --dart-define=NEXORA_API_URL=https://your-backend-domain)
4. android/app/src/main/AndroidManifest.xml තුළ <application> tag එකට පෙර පහත permissions තිබිය යුතුයි:
   <uses-permission android:name="android.permission.INTERNET"/>
   <uses-permission android:name="android.permission.RECORD_AUDIO"/>
5. Build:
   flutter build apk --release --dart-define=NEXORA_API_URL=https://your-backend-domain
6. APK path:
   build/app/outputs/flutter-apk/app-release.apk

C. Local test only
Backend URL එක localhost නම් physical Android phone එකෙන් ඒ localhost එක phone එකමයි. PC එකේ backend test කිරීමට PC එකේ LAN IP එක භාවිත කළ හැකි නමුත් Android cleartext HTTP restrictions තිබිය හැක. Release APK සඳහා HTTPS URL එකක් භාවිත කරන්න.

D. Google Search source labels
Backend එක Gemini grounding metadata තුළ ආපසු දෙන web URLs පෙන්වයි. AI එක web source එකක් නොදෙන පිළිතුරකදී UI එක AI answer ලෙස පෙන්වයි. Source links tap කර open කිරීම ඉදිරි UI update එකකින් එකතු කළ හැක.

E. Free-first plan
Gemini API free tier තිබිය හැකි නමුත් model, region, rate limits සහ search grounding availability අනුව වෙනස් වේ. Google Custom Search JSON API නව පාරිභෝගිකයන්ට ලබාගත නොහැකි බව Google දක්වන නිසා එය මූලික dependency එකක් කර නැත. Billing enable කරනවා නම් quota/spending limits සකසන්න.

F. PC එකේ Android Studio නැතුව APK build කිරීම
CLOUD_BUILD_SI.txt බලන්න. .github/workflows/build-apk.yml මඟින් GitHub Actions cloud build එක සකසා ඇත. Project folder එකේ අන්තර්ගතය GitHub repository එකට upload කර Actions tab එකෙන් build run කර APK artifact එක ගන්න.
