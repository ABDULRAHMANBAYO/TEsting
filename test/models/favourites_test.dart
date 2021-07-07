import 'package:flutter/material.dart';
import 'package:test/test.dart';
import 'package:testing_app/models/favourites.dart';

void main() {
  group("Test Favourites Provider", () {
    var favourites = Favorites();
    test("Test add event to add a new number", () {
      var number = 135;
      favourites.add(number);
      expect(favourites.items.contains(number), true);
      debugPrint(favourites.items.toString());
    });

    test("Test remove event to remove a number that exist", () {
      var num = 155;
      favourites.add(num);
      favourites.remove(num);
      expect(favourites.items.contains(num), false);
      debugPrint(favourites.items.toString());
    });
  });
}
