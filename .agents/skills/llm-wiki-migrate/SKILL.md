---
name: llm-wiki-migrate
description: 1.0.0 より前に作成された Wiki から、冗長な標準スキーマを安全に除去する。
---

# スキーマ移行

## Codex の MCP 接続

このスキルの wiki_* ツールは、登録済みの llm-wiki MCP 接続で呼び出す。

llm-wiki のインストール、MCP 接続設定の作成、llm-wiki serve の起動は行わない。

接続または文書化されたツールを利用できない場合は、CLI コマンドで代用せず、その状態を報告する。

## 使用する MCP ツール

`wiki_migrate`、`wiki_spaces_list`、`wiki_index_rebuild`

## 手順

1. 対象 Wiki を確認し、`wiki_migrate(dry_run: true)` で削除候補とカスタムスキーマを確認する。`n2. カスタムスキーマは保持し、`x-keyword` などの必要な注釈を確認する。`n3. 削除対象を利用者に提示し、明示的な承認後だけ本移行を実行する。`n4. `wiki_index_rebuild(wiki: "<wiki-name>")` を実行し、結果を報告する。

## 確認事項

- 書込み、削除、既定 Wiki の変更、ファイル出力などの外部変更は、利用者の依頼範囲を確認してから行う。
- MCP の応答に含まれる警告、検証失敗、未処理項目を省略せず報告する。
- ページを変更する場合は、型、frontmatter、関連ページとのリンクを確認する。

## 移植元とライセンス

[geronimo-iia/llm-wiki-skills](https://github.com/geronimo-iia/llm-wiki-skills) を基にした。

Copyright 2025 Jerome Guibert。

Apache-2.0 または MIT のいずれかを選択して利用できる。

ライセンス本文は移植元の [LICENSE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE)、[LICENSE-APACHE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-APACHE)、[LICENSE-MIT](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-MIT) を参照する。
