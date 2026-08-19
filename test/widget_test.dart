import 'package:flutter_test/flutter_test.dart';
import 'package:autodag_ai_pro/main.dart';

void main() {
  testWidgets(
    'AutoDiag AI Pro starts correctly',
    (WidgetTester tester) async {
      await tester.pumpWidget(
        const AutoDiagAIProApp(),
      );

      expect(
        find.text('AutoDiag AI Pro'),
        findsOneWidget,
      );

      expect(
        find.text('تشخيص المركبة الذكي'),
        findsOneWidget,
      );
    },
  );
}
