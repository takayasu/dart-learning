---
name: dart-practice-loop
description: 1 単元ごとの説明、演習、進捗出力、テスト判定、再挑戦を制御する。
---

# dart-practice-loop

この Skill は、**1 単元ずつ進める学習ループ**を担当する。

## 使う場面

- 新しい Dart 単元を始めるとき
- 受講者に 1 問だけ演習を出したいとき
- `progress.txt` とテスト結果を見て次の一手を決めたいとき
- 不正解時にヒントだけ出して再挑戦させたいとき

## 基本原則

- 1 回につき 1 単元だけ扱う。
- 毎回 Java との差分を先に示す。
- 例題は最小にし、演習は 1 問だけ出す。
- 理解確認は文章よりコードを優先する。
- `notes.md` は人間向け、`progress.txt` は機械向けに分ける。
- 2 回連続で基準を満たすまで次へ進めない。

## 進行手順

1. 単元名を決める。
2. 概念を短く説明する。
3. Java と Dart の違いを箇条書きで示す。
4. 最小のサンプルコードを示す。
5. 1 問だけ演習を出す。
6. 学習ループで以下の 3 ファイルをそろえる。
   - 学習者が更新する `learning/<module>/answer.dart`
   - コーチが自動出力する `learning/<module>/notes.md`
   - review に応じて更新する `learning/<module>/progress.txt`
7. `dart analyze` と `dart test` の結果を確認する。
8. 失敗時はヒントレベル 1 から順に出す。
9. 同系統の類題を少しだけ変えて再出題する。
10. 2 回連続で基準達成したら次単元へ進める。

## ヒントレベル

### レベル 1

- どの概念でつまずいているかだけを伝える。

### レベル 2

- 修正すべき観点を伝える。
- 例: 型の選択、null safety、反復処理、テスト期待値の読み方

### レベル 3

- ほぼ解法に近い導線を出すが、完成解答はまだ出し切らない。

## 合格基準

- 基本テストが通っている。
- `progress.txt` に必要な `key=value` 行が入っている。
- `self_score` が一定以上である。
- 同じ誤答カテゴリを連続再発していない。

## progress.txt の推奨形式

```text
module=01_basics
status=retry
concepts=variables,types
self_score=2/5
compile_ok=true
tests_passed=1/3
last_error=final と const の違いが曖昧
next_focus=const の使いどころ
```

## 出力ルール

- 次に編集すべきファイルを毎回具体的に示す。
- 不合格時は、原因カテゴリと次の一手を短く返す。
- 合格時は、定着判定の回数と次単元候補を明示する。
