# 03_functions — コーチレビューノート

## Java との差分まとめ

| 観点 | Java | Dart |
|------|------|------|
| 関数の置き場所 | クラスのメソッドのみ | トップレベル関数が使える |
| デフォルト引数 | オーバーロードで代用 | 名前付き引数 `{String x = 'val'}` |
| 省略可能な引数 | オーバーロードで代用 | 位置引数 `[int x = 0]` |
| ラムダ/アロー | `(x) -> x * 2` | `(x) => x * 2` |
| 関数を値として扱う | `Function<T,R>` インターフェース | `T Function(T)` でシンプルに型宣言 |
| クロージャ | 実質的に同じ (effectively final) | 変数キャプチャが自然に使える |

---

## 各設問のレビューポイント

### 1. `greet(String name, {String greeting = 'Hello'})`

- ✅ 名前付き引数は `{}` で囲む。位置引数の後ろに置く。
- ✅ 戻り値の型 `String` を明示する（Dart らしい書き方）。
- ⚠️ `'$greeting, $name!'` のように文字列補間を使えているか確認する。
- ❌ `greeting = null` になり得ないので `String?` にしない。

### 2. `square(int n) => n * n`

- ✅ 1 行の処理はアロー関数 `=>` で書く。
- ✅ 戻り値の型を省略しても型推論で通るが、明示が推奨。
- ⚠️ `return n * n;` と書いた場合は正しいが、Dart らしくはない。

### 3. `keepPositives(List<int> nums)`

- ✅ `nums.where((n) => n > 0).toList()` が Dart らしい書き方。
- ⚠️ `for` ループ + `add` でも動くが、関数型スタイルを優先する。
- ❌ `n >= 0` にすると 0 が含まれてしまう（仕様を確認する）。

### 4. `applyToAll<T>(List<T> items, T Function(T) f)`

- ✅ ジェネリクス `<T>` を使うと `int` も `String` も同じ関数で扱える。
- ✅ `items.map(f).toList()` が最も簡潔。
- ⚠️ `Function` だけ（型なし）で書いた場合は静的型安全が失われる。

### 5. `makeAdder(int addend)` — クロージャ

- ✅ `int Function(int) makeAdder(int addend) => (n) => n + addend;`
- ✅ 内側の関数が `addend` を「閉じ込めて（capture）」いる。
- ⚠️ Java では事実上 `final` な変数しかキャプチャできないが、Dart は変更可能な変数もキャプチャできる点に注意。

---

## よく出るつまずき

1. `{}` と `[]` の混同 — 名前付きと位置指定の省略引数を混同する。
2. `required` キーワードの抜け — 型が non-nullable かつデフォルト値がない場合は `required` が必要。
3. アロー関数に `return` を書いてしまう — `=> { return x; }` はエラー。
4. `map` の戻り値が `Iterable` — `.toList()` を忘れると型エラーになる。

---

## 次にやること

```
dart test test/03_functions_test.dart
dart analyze
```

全テストが通り、`analyze` でエラーゼロなら合格です。
