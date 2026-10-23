---
name: llm-wiki-ingest
description: ソースファイルを検証し、要約した Wiki ページとして取り込む。
---

# ソースの取り込み

## Codex の MCP 接続

このスキルの wiki_* ツールは、登録済みの llm-wiki MCP 接続で呼び出す。

llm-wiki のインストール、MCP 接続設定の作成、llm-wiki serve の起動は行わない。

接続または文書化されたツールを利用できない場合は、CLI コマンドで代用せず、その状態を報告する。

## 使用する MCP ツール

`wiki_ingest`、`wiki_search`、`wiki_content_read`、`wiki_content_write`、`wiki_schema`、`wiki_resolve`

## 手順

1. 取り込むパスを確認し、まず `wiki_ingest(path: "<path>", dry_run: true)` を実行する。`n2. 既存の知識を検索して重複、矛盾、関連ページを確認する。`n3. 種別、根拠、信頼度を適切な frontmatter に記録する。`n4. 本取り込みを実行し、結果、警告、移動されたソースを報告する。

## 確認事項

- 書込み、削除、既定 Wiki の変更、ファイル出力などの外部変更は、利用者の依頼範囲を確認してから行う。
- MCP の応答に含まれる警告、検証失敗、未処理項目を省略せず報告する。
- ページを変更する場合は、型、frontmatter、関連ページとのリンクを確認する。

## 移植元とライセンス

[geronimo-iia/llm-wiki-skills](https://github.com/geronimo-iia/llm-wiki-skills) を基にした。

Copyright 2025 Jerome Guibert。

Apache-2.0 または MIT のいずれかを選択して利用できる。

ライセンス本文は移植元の [LICENSE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE)、[LICENSE-APACHE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-APACHE)、[LICENSE-MIT](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-MIT) を参照する。
