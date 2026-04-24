# Dart Learning Coach

Java 経験者向けに Dart を段階学習させるための GitHub Copilot 用リポジトリです。

公開対象として主に含めるもの:

- `.github/copilot-instructions.md`
- `.github/agents/dart-learning-coach.agent.md`
- `.github/skills/dart-setup/SKILL.md`
- `.github/skills/dart-practice-loop/SKILL.md`

ローカル専用として Git から除外するもの:

- `learning/`
- `.vscode/`
- `docs/dart-setup.md`

## Repository layout

| Path | Purpose |
| --- | --- |
| `.github/copilot-instructions.md` | 常時効く教育方針 |
| `.github/agents/dart-learning-coach.agent.md` | 授業進行用のカスタムエージェント |
| `.github/skills/dart-setup/` | セットアップ確認 Skill |
| `.github/skills/dart-practice-loop/` | 単元ごとの学習ループ Skill |

## Publishing note

このリポジトリは、**エージェント定義と Skill 定義だけを公開**し、学習の進捗や個別環境設定はローカルに残す前提です。

Git に追加する前に使う基本コマンド:

```bash
git init
git add .github README.md .gitignore pubspec.yaml analysis_options.yaml
```
