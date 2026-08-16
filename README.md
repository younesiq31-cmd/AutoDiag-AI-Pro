# AutoDiag AI Pro — UI Final / Cross-Platform Foundation

هذه النسخة تعتمد ترتيب الواجهات المعتمد:
1. الرئيسية
2. البيانات المباشرة
3. الأعطال DTC
4. AI Doctor
5. اختبارات المركبة
6. التقارير

## أهم ما تم تضمينه
- واجهة RTL عربية بنفس ترتيب التصميم المعتمد.
- Dark / glassmorphism UI.
- حالة Online / Offline واضحة.
- حفظ محلي للبيانات والطوابير.
- مزامنة عند عودة الإنترنت.
- طبقة VCI قابلة للاستبدال بـ BLE/Wi‑Fi الحقيقي.
- بيانات Live Data ورسوم مبسطة.
- DTC مع حالة حالي/مخزن.
- AI Doctor يعمل محلياً كـRule Engine ولا يحتاج إنترنت.
- تقارير محلية.
- بنية مناسبة لـAndroid/iOS/Web/Windows/macOS/Linux من ناحية Dart/Flutter.
- عدم تنفيذ وظائف ECU Programming أو Active Tests الحقيقية من دون VCI/بروتوكول مدعوم.

## تشغيل
```bash
flutter pub get
flutter run
```

## إنشاء ملفات المنصات الناقصة
إذا كان مستودعك يحتوي على `lib/` فقط:
```bash
flutter create --platforms=android,ios,web,windows,macos,linux .
```

## Android
```bash
flutter build apk --release
flutter build appbundle --release
```

## ملاحظة مهمة للتوافق
Flutter يجعل واجهة التطبيق ومصدر Dart متعدد المنصات، لكن Bluetooth/VCI والصلاحيات والتوقيع ومتطلبات متجر Apple/Google تحتاج طبقة native واختباراً على الأجهزة الفعلية. لا يمكن ضمان كل جهاز أو كل VCI بمجرد الكود.

## الإنتاج
قبل الإصدار التجاري:
- استبدال MockVciService ببرنامج تشغيل VCI الحقيقي.
- ربط API/PostgreSQL الحقيقي.
- إضافة مفاتيح الإنتاج وإدارة الأسرار.
- اختبار Android/iOS على أجهزة فعلية.
- اختبار Web/Desktop بميزات VCI التي يدعمها النظام.
