import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:testing_app/models/favourites.dart';
import 'package:testing_app/screen/favorites.dart';

late Favorites favoritesList;
Widget favoriteScreen() => ChangeNotifierProvider(
    create: (context) {
      favoritesList = Favorites();
      return favoritesList;
    },
    child: MaterialApp(home: FavoritesPage()));

void addItems() {
  for (var i = 0; i < 10; i += 2) {
    favoritesList.add(i);
  }
}

void main() {
  group("Test Favorite Widget", () {
    testWidgets("Test If ListView Shows Up", (tester) async {
      await tester.pumpWidget(favoriteScreen());
      addItems();
      await tester.pumpAndSettle();
      expect(find.byType(ListView), findsOneWidget);
    });
    testWidgets("Remove item from list", (tester) async {
      // await tester.pumpWidget(favoriteScreen());
      // addItems();
      // await tester.pumpAndSettle();
      // var totalItems = tester.widgetList(find.byIcon(Icons.close)).length;
      // await tester.tap(find.byIcon(Icons.close).first);
      // await tester.pumpAndSettle();
      // expect(tester.widgetList(find.byIcon(Icons.close)).length,
      //     lessThan(totalItems));
      // expect(find.text('Removed from favorites.'), findsOneWidget);

      await tester.pumpWidget(favoriteScreen());
      addItems();
      await tester.pumpAndSettle();
      expect(find.byIcon(Icons.close).first, findsOneWidget);
      await tester.tap(find.byIcon(Icons.close).first);
      await tester.pumpAndSettle(Duration(seconds: 1));
      expect(find.text('Removed from favorites.'), findsOneWidget);
    });
  });
}
