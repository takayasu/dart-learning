# Dart Learning Coach

Java 経験者向けに Dart を段階学習させるための GitHub Copilot 用リポジトリです。

公開対象として主に含めるもの:

- `.github/copilot-instructions.md`
- `.github/agents/dart-learning-coach.agent.md`
- `.github/skills/dart-setup/SKILL.md`
- `.github/skills/dart-practice-loop/SKILL.md`
- `README.md`

ローカル専用として Git から除外するもの:

- `learning/`
- `.vscode/`

## Repository layout

| Path | Purpose |
| --- | --- |
| `.github/copilot-instructions.md` | 常時効く教育方針 |
| `.github/agents/dart-learning-coach.agent.md` | 授業進行用のカスタムエージェント |
| `.github/skills/dart-setup/` | セットアップ確認 Skill |
| `.github/skills/dart-practice-loop/` | 単元ごとの学習ループ Skill |

## Dart environment setup

WSL / Ubuntu 上で Dart SDK を入れて、このリポジトリで学習を始める手順です。

### 1. APT の前提パッケージを入れる

```bash
sudo apt-get update
sudo apt-get install apt-transport-https curl gnupg
```

### 2. Dart の署名鍵を登録する

```bash
curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub \
  | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
```

### 3. Dart の APT リポジトリを登録する

`/etc/apt/sources.list.d/dart_stable.list` の中身は **必ずこの 1 行だけ** にします。

```text
deb [signed-by=/usr/share/keyrings/dart.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main
```

作り直す場合:

```bash
sudo rm -f /etc/apt/sources.list.d/dart_stable.list

echo "deb [signed-by=/usr/share/keyrings/dart.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" \
  | sudo tee /etc/apt/sources.list.d/dart_stable.list > /dev/null
```

確認:

```bash
cat /etc/apt/sources.list.d/dart_stable.list
ls -l /usr/share/keyrings/dart.gpg
```

### 4. パッケージ一覧を更新して Dart を確認する

```bash
sudo apt-get update
apt-cache policy dart
```

`apt-cache policy dart` に候補が出たらインストールできます。

```bash
sudo apt-get install dart
dart --version
```

### 5. このリポジトリを Dart プロジェクト化する

まだ Dart プロジェクトでない場合:

```bash
dart create -t console .
```

### 6. 初回実行

```bash
dart pub get
dart run
dart test
dart analyze
```

### 7. 学習用ファイルを作る

```bash
mkdir -p learning/01_basics
touch learning/01_basics/answer.dart
touch learning/01_basics/notes.txt
touch learning/01_basics/progress.txt
```

### 8. Windows の VS Code から WSL の Dart を実行する

前提:

- Windows 側に VS Code が入っている
- WSL2 側に Dart SDK が入っている
- VS Code の **WSL 拡張** と **Dart 拡張** を使う

手順:

1. WSL ターミナルでこのリポジトリを開く。

   ```bash
   cd /mnt/d/projects/copilot/dart/lecture/first
   code .
   ```

2. VS Code が開いたら、左下に **WSL: Ubuntu** のような表示があることを確認する。  
   これが出ていれば、Windows ではなく **WSL 側の `dart`** が使われます。

3. 拡張機能で次を入れる。
   - Dart
   - WSL

4. VS Code 内蔵ターミナルで確認する。

   ```bash
   which dart
   dart --version
   ```

   `/usr/bin/dart` や `/usr/lib/dart/...` のように WSL 側のパスが出れば OK です。

5. 実行方法
   - `F5` で **Dart: Launch Current File**
   - `Run and Debug` で **Dart: Launch Default App**
   - `Terminal > Run Task` で **Dart: Run Current File**

このリポジトリには以下を用意しています。

- `.vscode/launch.json`
- `.vscode/tasks.json`
- `.vscode/extensions.json`

`dart create -t console .` を済ませると、`bin/first.dart` をそのまま実行しやすくなります。

## Troubleshooting

### `Malformed entry ... dart_stable.list (URI)`

`dart_stable.list` の 1 行が壊れています。削除して上の内容で作り直します。

```bash
sudo rm -f /etc/apt/sources.list.d/dart_stable.list
echo "deb [signed-by=/usr/share/keyrings/dart.gpg] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main" \
  | sudo tee /etc/apt/sources.list.d/dart_stable.list > /dev/null
sudo apt-get update
```

### `Unable to locate package dart`

APT リポジトリがまだ有効になっていない可能性が高いです。次を順に確認します。

```bash
cat /etc/apt/sources.list.d/dart_stable.list
ls -l /usr/share/keyrings/dart.gpg
sudo apt-get update
apt-cache policy dart
```

`apt-cache policy dart` に候補が出ない場合は、鍵ファイルかリポジトリ設定が崩れています。

### VS Code で `package:first/...` や `package:test/...` が解決されない

コードではなく、VS Code の Dart 拡張が WSL 側の依存を見れていない可能性が高いです。

1. 左下が **WSL: Ubuntu** になっていることを確認する
2. Dart 拡張が **Install in WSL** 済みであることを確認する
3. VS Code ターミナルで `dart pub get` と `dart analyze` を実行する
4. `Ctrl+Shift+P` → **Dart: Restart Analysis Server**
5. 必要なら `Developer: Reload Window`

## Publishing note

このリポジトリは、**エージェント定義と Skill 定義だけを公開**し、学習の進捗や個別環境設定はローカルに残す前提です。

Git に追加する前に使う基本コマンド:

```bash
git init
git add .github README.md .gitignore pubspec.yaml analysis_options.yaml
```
