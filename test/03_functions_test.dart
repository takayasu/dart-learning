// ignore_for_file: avoid_print
import 'package:test/test.dart';

import '../learning/03_functions/answer.dart';

void main() {
  // ----------------------------------------------------------------
  // 1. 基本関数 / Basic function
  // ----------------------------------------------------------------
  group('greet()', () {
    test('デフォルト挨拶は Hello', () {
      expect(greet('Taro'), 'Hello, Taro!');
    });

    test('名前付き引数 greeting を渡せる', () {
      expect(greet('Hanako', greeting: 'Hi'), 'Hi, Hanako!');
    });

    test('空文字の名前でも動作する', () {
      expect(greet(''), 'Hello, !');
    });
  });

  // ----------------------------------------------------------------
  // 2. アロー関数 / Arrow function
  // ----------------------------------------------------------------
  group('square()', () {
    test('正の整数の二乗', () {
      expect(square(5), 25);
    });

    test('0 の二乗', () {
      expect(square(0), 0);
    });

    test('負の整数の二乗', () {
      expect(square(-3), 9);
    });
  });

  // ----------------------------------------------------------------
  // 3. 高階関数 / Higher-order function
  // ----------------------------------------------------------------
  group('keepPositives()', () {
    test('正の数だけ残す', () {
      expect(keepPositives([1, -2, 3, -4, 5]), [1, 3, 5]);
    });

    test('全部負なら空リスト', () {
      expect(keepPositives([-1, -2, -3]), isEmpty);
    });

    test('空リストはそのまま', () {
      expect(keepPositives([]), isEmpty);
    });
  });

  // ----------------------------------------------------------------
  // 4. 関数を引数に取る関数 / Function as parameter
  // ----------------------------------------------------------------
  group('applyToAll()', () {
    test('各要素を 2 倍にする', () {
      expect(applyToAll([1, 2, 3], (n) => n * 2), [2, 4, 6]);
    });

    test('文字列リストを大文字化する', () {
      expect(
        applyToAll(['hello', 'dart'], (s) => s.toUpperCase()),
        ['HELLO', 'DART'],
      );
    });

    test('空リストは空リストを返す', () {
      expect(applyToAll(<int>[], (n) => n + 1), isEmpty);
    });
  });

  // ----------------------------------------------------------------
  // 5. クロージャ / Closure
  // ----------------------------------------------------------------
  group('makeAdder()', () {
    test('addThree は常に 3 を足す', () {
      final addThree = makeAdder(3);
      expect(addThree(10), 13);
      expect(addThree(0), 3);
    });

    test('makeAdder(0) は値をそのまま返す', () {
      final addZero = makeAdder(0);
      expect(addZero(7), 7);
    });

    test('2 つの adder は独立している', () {
      final add5 = makeAdder(5);
      final add10 = makeAdder(10);
      expect(add5(1), 6);
      expect(add10(1), 11);
    });
  });
}
