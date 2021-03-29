import 'package:flutter/foundation.dart';

import 'prime_number_state.dart';

class PrimeNumberController extends ChangeNotifier {
  var _state = PrimeNumberState(listPrimeNumbers: []);
  PrimeNumberState get state => _state;
  void _changeState(PrimeNumberState newState) {
    _state = newState;
    notifyListeners();
  }

  void getPrimeNumbers(int start, int end) {
    final listNumbers = List<int>.generate(
      end - start + 1,
      (index) => index + start,
    );
    _changeState(state.copyWith(
      listPrimeNumbers: listNumbers,
    ));
  }
}
