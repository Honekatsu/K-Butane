---
name: llm-wiki-review
description: 下書き、低信頼ページ、lint の検出事項を優先順位順に一件ずつ処理する。
---

# Wiki のレビュー

## Codex の MCP 接続

このスキルの wiki_* ツールは、登録済みの llm-wiki MCP 接続で呼び出す。

llm-wiki のインストール、MCP 接続設定の作成、llm-wiki serve の起動は行わない。

接続または文書化されたツールを利用できない場合は、CLI コマンドで代用せず、その状態を報告する。

## 使用する MCP ツール

`wiki_lint`、`wiki_list`、`wiki_content_read`、`wiki_content_write`、`wiki_ingest`

## 手順

1. lint 結果、下書き、低信頼ページからレビュー待ち一覧を作る。`n2. 一件ずつ本文と根拠を読み、修正、保留、アーカイブを判断する。`n3. 信頼度を大きく上げる場合は、書込み前に利用者へ確認する。`n4. ページを削除せず、必要なら `status: archived` と `superseded_by` を使う。

## 確認事項

- 書込み、削除、既定 Wiki の変更、ファイル出力などの外部変更は、利用者の依頼範囲を確認してから行う。
- MCP の応答に含まれる警告、検証失敗、未処理項目を省略せず報告する。
- ページを変更する場合は、型、frontmatter、関連ページとのリンクを確認する。

## 移植元とライセンス

[geronimo-iia/llm-wiki-skills](https://github.com/geronimo-iia/llm-wiki-skills) を基にした。

Copyright 2025 Jerome Guibert。

Apache-2.0 または MIT のいずれかを選択して利用できる。

ライセンス本文は移植元の [LICENSE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE)、[LICENSE-APACHE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-APACHE)、[LICENSE-MIT](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-MIT) を参照する。
