# AutoDiag AI Pro

Production-oriented Flutter foundation for evidence-first vehicle diagnostics.

## Important
- Demo data is never presented as real ECU data.
- Real diagnostic functions require a compatible physical VCI and vehicle.
- OBDLink MX+ support must be validated on a physical Android device before commercial release.
- OEM modules such as ABS/SRS/TCM require protocol-specific drivers and are not claimed as supported until verified.

## Build
flutter pub get
flutter analyze
flutter test
flutter build apk --release
flutter build appbundle --release
