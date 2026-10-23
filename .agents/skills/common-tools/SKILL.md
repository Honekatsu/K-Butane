---
name: common-tools
description: プロジェクト横断でよく使う開発ツール、調査コマンド、検証コマンド、ドキュメント生成、依存関係管理の選び方を整理するスキル。リポジトリ調査、ビルド、テスト、静的解析、検索、差分確認、PDF生成、図表生成、Python/Node.js/Bun/Rust/Scalaなどの定番ツール選定を行うときに使用する。
---

# よく使うツール

## 基本方針

作業対象リポジトリに `AGENTS.md`、`README`、開発者向け文書、Makefile、package設定、CI設定がある場合は、先にそれらを確認する。
本スキルの内容より、対象リポジトリに書かれた手順を優先する。

ユーザーが特定のツールを指定している場合は、その指定を優先する。
指定がない場合は、既存設定とロックファイルからプロジェクトの標準ツールを推定する。

権限判定に影響する可能性があるため、コマンドは不必要に連結せず、1行ずつ実行する。

## 作業順序

1. リポジトリの構成、言語、ビルド設定、ロックファイルを確認する。
2. 既存のスクリプト、Makeターゲット、CIジョブ、ドキュメント生成手順を探し、ツール一覧の「確認観点」も作業対象に適用する。
3. 作業に必要なツールだけを選び、追加インストールや依存更新を避ける。
4. 変更後は、影響範囲に合う最小の検証コマンドを実行する。
5. ツールが見つからない場合は、利用可能な代替手段を確認する。代替手段がなければ、理由、未確認リスク、ユーザーが次に実行できる手順を記録して作業を続ける。

スキルに記載された規則を確認する場合は、対象の `SKILL.md` 本文を確認する。
`references/` の不存在または内容から、`SKILL.md` に記載がないと結論づけない。
出力が省略された場合は、関連語を対象に `SKILL.md` を再検索してから判断する。

## ツール選定

- ファイル検索は、利用可能なら `rg` と `rg --files` を優先する。
- Python環境では、対象リポジトリの指示があればそれに従い、指示がない場合は `uv`、既存venv、システムPythonの順に確認する。
- `uv` または `uvx` で依存関係の解決・取得などキャッシュを読み書きする実行では、キャッシュの権限不足を避けるため、コマンドの先頭に `UV_CACHE_DIR=.uv-cache` を付ける。キャッシュを使用しない操作には付けない。例: `UV_CACHE_DIR=.uv-cache uv run pytest`。
- Node.js環境では `bun` を使用し、パッケージ操作は `bun`、単発実行は `bunx` を優先する。
- Rustでは、既存の `cargo` コマンド、ワークスペース構成、feature指定を確認してから実行する。
- Scala/SBTでは、既存の `sbt` タスクとプロジェクト設定を確認する。
- MarkdownからPDFを生成する場合は、`bunx md-to-pdf` を使用する。
- Markdownで明示的な改行が必要な場合は、行末に半角スペース2個を置く。
- WindowsからWSLを起動する場合は、常に `wsl.exe` と記述する。Codexのコマンド権限ルールと実行ファイル名の照合が一致しない場合があるため、`wsl` と拡張子を省略しない。
- その他の文書生成や図表生成では、既存の生成物、ソースファイル、生成コマンドの関係を確認してから再生成する。

### 調査

| 用途 | 優先候補 | 確認観点 |
| --- | --- | --- |
| ファイル一覧 | `rg --files` | 除外設定や生成物を含める必要があるか。 |
| テキスト検索 | `rg` | 大文字小文字、glob、隠しファイルの扱い。 |
| 差分確認 | `git diff`, `git diff --stat` | ユーザーの既存変更を巻き戻していないか。 |
| 履歴確認 | `git log`, `git show` | 対象ファイルや範囲を絞れているか。 |

### Python

| 用途 | 優先候補 | 確認観点 |
| --- | --- | --- |
| 依存同期 | `UV_CACHE_DIR=.uv-cache uv sync` | 既存の `pyproject.toml` と lock の有無。 |
| スクリプト実行 | `UV_CACHE_DIR=.uv-cache uv run` | リポジトリ指示と依存関係の再現性。 |
| ロック更新 | `UV_CACHE_DIR=.uv-cache uv lock` | 依存追加や更新が意図されたものか。 |
| テスト | `UV_CACHE_DIR=.uv-cache uv run pytest` | 既存のpytest設定、対象テストの絞り込み。 |

### Node.js

| 用途 | 優先候補 | 確認観点 |
| --- | --- | --- |
| パッケージ管理 | `bun` | `package.json`、`bun.lockb`、既存scriptの有無。 |
| 依存追加 | `bun add` | dev依存は `bun add -d` を使う。 |
| ビルド | `bun run <script>` | `build`, `test`, `lint`, `typecheck` の有無。 |
| 単発実行 | `bunx` | `npx`, `pnpm dlx`, `yarn dlx` へ寄せない。 |

### Rust

| 用途 | 優先候補 | 確認観点 |
| --- | --- | --- |
| テスト | `cargo test` | ワークスペース、feature、package指定。 |
| ビルド | `cargo build` | release/debug、target指定。 |
| 整形 | `cargo fmt` | 既存の整形方針。 |
| lint | `cargo clippy` | CIで有効な警告レベル。 |

### SystemVerilog

| 用途 | 優先候補 | 確認観点 |
| --- | --- | --- |
| シミュレーション実行 | `verilator` | macOS/Linuxではそのまま実行。Windowsでは最初にPowerShellからネイティブ版を確認し、利用できなければ指定したWSLディストリビューションへ `wsl.exe -d <distribution>` で入り、`nix-shell -p verilator`で実行。 |
| lint | `verilator` | macOS/Linuxではそのまま実行。Windowsでは最初にPowerShellからネイティブ版を確認し、利用できなければ指定したWSLディストリビューションへ `wsl.exe -d <distribution>` で入り、`nix-shell -p verilator`で実行。WSLまたはNixもなければ未実行理由と未確認範囲を報告する。 |
| format | `verible-verilog-format --inplace ファイル名.sv` | Windowsでは最初にPowerShellからネイティブ版を確認し、利用できなければ指定したWSLディストリビューションへ `wsl.exe -d <distribution>` で入り、`nix-shell -p verible`で実行。 |

WindowsでSystemVerilogツールを使う場合は、次の順に確認する。

1. PowerShellで対象コマンドがPATH上にあるか確認し、利用できればネイティブ版を実行する。
2. ネイティブ版がなければ、`wsl.exe --status` と `wsl.exe --list --quiet` を実行してWSLと利用可能なディストリビューションを確認する。
3. ユーザーまたはプロジェクトが指定したディストリビューション名を選び、以後の全コマンドに `wsl.exe -d <distribution>` を付ける。指定がない場合は、一覧の既定値に任せず、利用するディストリビューション名を確定してから実行する。
4. `wsl.exe -d <distribution> --exec sh -lc 'command -v nix-shell'`を実行し、指定したディストリビューション内でNixが利用できることを確認する。
5. 指定したディストリビューション内で `nix-shell -p verilator` または `nix-shell -p verible` を実行する。
6. WSL、指定ディストリビューション、またはNixが利用できなければ、別の環境へ勝手に切り替えず、未実行の検証、理由、必要な環境を報告する。

次の規則を必ず守る。

- PowerShellで `nix-shell` を直接実行しない。Nixの確認とツール実行は `wsl.exe -d <distribution> --exec sh -lc` を通じて、指定したWSLディストリビューション内で行う。
- `wsl.exe --list --verbose` はディストリビューションの一覧確認であり、WSL内でコマンドを実行した証拠にはならない。
- `wsl.exe -d <distribution> --exec sh -lc 'command -v nix-shell'` と対象ツールの実行が成功するまで、指定したディストリビューションでWSLまたはNixを試したとは扱わない。
- WSLまたはNixが使えないと結論づける前に、`wsl.exe --status`、WSL内の `command -v nix-shell`、各コマンドの終了コードとエラー出力を確認する。
- lintコマンドを実行できなくても、仕様書や設計文書の「確認観点」列にある全項目を読み、lintで確認できる範囲と確認できない範囲を分けて報告する。

Windowsでの確認と実行は、次のPowerShell手順を使う。

```powershell
$wslDistribution = "Ubuntu" # ユーザーまたはプロジェクトが指定したディストリビューション名
$nativeVerilator = Get-Command verilator -ErrorAction SilentlyContinue
if ($null -ne $nativeVerilator) {
  verilator --version
} else {
  wsl.exe --status
  wsl.exe --list --quiet
  wsl.exe -d $wslDistribution --exec sh -lc 'command -v nix-shell'
  wsl.exe -d $wslDistribution --exec sh -lc 'nix-shell -p verilator --run "verilator --version"'
}
```

実際のlintでは、対象プロジェクトのWSL上の作業ディレクトリで、プロジェクトに定義されたVerilatorコマンドを `nix-shell -p verilator --run` から実行する。

### Scala/SBT

| 用途 | 優先候補 | 確認観点 |
| --- | --- | --- |
| コンパイル | `sbt compile` | マルチプロジェクト指定の有無。 |
| テスト | `sbt test` | 対象suiteや既存CIコマンド。 |

### 文書と図表

| 用途 | 優先候補 | 確認観点 |
| --- | --- | --- |
| MarkdownからPDF | `bunx md-to-pdf` | ソースMarkdownと出力PDFの対応。 |
| PDFのテキスト読み込み | `pdf2txt.py 入力ファイル.pdf` | 必要に応じて出力先やページ範囲を指定する。 |
| WaveDrom | `wavedrom-cli` | JSONとSVG/PDFの対応。 |
| Mermaid | 既存のMermaid生成手順 | 生成物をコミット対象にする運用か。 |

### 追記ルール

- よく使うコマンドだけを追加する。
- プロジェクト固有のパスやターゲットは、汎用項目として固定しない。
- 失敗しやすい前提条件がある場合は、確認観点に書く。

## 検証

変更の種類に応じて、次の範囲から選ぶ。

- 文書変更: リンク、見出し、生成物がある場合は生成コマンド。
- コード変更: 関連する単体テスト、型チェック、lint、ビルド。
- 依存関係変更: ロックファイル更新、最小のビルドまたはテスト。
- CLIやスクリプト変更: 代表入力での実行、help表示、エラー時の挙動。

検証コマンドが重い場合は、まず局所検証を行う。
全体検証が必要だが実行できない場合は、その理由を報告する。
