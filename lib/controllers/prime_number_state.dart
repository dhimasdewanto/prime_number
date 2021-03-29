import 'package:flutter/foundation.dart';

class PrimeNumberState {
  PrimeNumberState({
    required this.listPrimeNumbers,
  });

  final List<int> listPrimeNumbers;

  @override
  int get hashCode => listPrimeNumbers.hashCode;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PrimeNumberState &&
        listEquals(other.listPrimeNumbers, listPrimeNumbers);
  }

  PrimeNumberState copyWith({
    List<int>? listPrimeNumbers,
  }) {
    return PrimeNumberState(
      listPrimeNumbers: listPrimeNumbers ?? this.listPrimeNumbers,
    );
  }
}
