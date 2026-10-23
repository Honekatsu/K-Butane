---
name: llm-wiki-crystallize
description: 会話で確定した判断、発見、未解決事項を永続的な Wiki ページにする。
---

# 会話の知見を定着

## Codex の MCP 接続

このスキルの wiki_* ツールは、登録済みの llm-wiki MCP 接続で呼び出す。

llm-wiki のインストール、MCP 接続設定の作成、llm-wiki serve の起動は行わない。

接続または文書化されたツールを利用できない場合は、CLI コマンドで代用せず、その状態を報告する。

## 使用する MCP ツール

`wiki_search`、`wiki_content_new`、`wiki_content_write`、`wiki_graph`、`wiki_lint`、`wiki_ingest`

## 手順

1. 再利用価値のある判断、根拠、未解決事項を抽出する。`n2. 書込み前に利用者へ対象ページと内容を確認する。`n3. 既存知識を `wiki_search` で確認し、重複は統合またはリンクする。`n4. ページを作成または更新し、検証と取り込みを実行する。

## 確認事項

- 書込み、削除、既定 Wiki の変更、ファイル出力などの外部変更は、利用者の依頼範囲を確認してから行う。
- MCP の応答に含まれる警告、検証失敗、未処理項目を省略せず報告する。
- ページを変更する場合は、型、frontmatter、関連ページとのリンクを確認する。

## 移植元とライセンス

[geronimo-iia/llm-wiki-skills](https://github.com/geronimo-iia/llm-wiki-skills) を基にした。

Copyright 2025 Jerome Guibert。

Apache-2.0 または MIT のいずれかを選択して利用できる。

ライセンス本文は移植元の [LICENSE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE)、[LICENSE-APACHE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-APACHE)、[LICENSE-MIT](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-MIT) を参照する。
