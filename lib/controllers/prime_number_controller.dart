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

    final listPrimeNumbers = List<int>.from(listNumbers)..retainWhere(isPrime);

    _changeState(state.copyWith(
      listPrimeNumbers: listPrimeNumbers,
    ));
  }

  bool isPrime(int number) {
    if (number < 2) {
      return false;
    }
    if (number == 2 || number == 3) {
      return true;
    }
    if (number.isEven) {
      return false;
    }
    for (var i = 3; i < (number / 2); i += 2) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }
}
