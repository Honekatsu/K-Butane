---
name: llm-wiki-configure-hugo
description: 既存 Wiki を Hugo で表示するための設定を行う。
---

# Hugo の構成

## Codex の MCP 接続

このスキルの wiki_* ツールは、登録済みの llm-wiki MCP 接続で呼び出す。

llm-wiki のインストール、MCP 接続設定の作成、llm-wiki serve の起動は行わない。

接続または文書化されたツールを利用できない場合は、CLI コマンドで代用せず、その状態を報告する。

## 使用する MCP ツール

`wiki_spaces_list`、`wiki_config`

## 手順

1. `wiki_spaces_list` で対象 Wiki を確認する。`n2. Hugo の導入やファイル変更は外部変更であるため、対象と公開方針を確認する。`n3. `wiki_config` で Wiki のレンダリング設定を確認し、利用者が指定した構成だけを反映する。`n4. 生成結果を確認し、変更内容を報告する。

## 確認事項

- 書込み、削除、既定 Wiki の変更、ファイル出力などの外部変更は、利用者の依頼範囲を確認してから行う。
- MCP の応答に含まれる警告、検証失敗、未処理項目を省略せず報告する。
- ページを変更する場合は、型、frontmatter、関連ページとのリンクを確認する。

## 移植元とライセンス

[geronimo-iia/llm-wiki-skills](https://github.com/geronimo-iia/llm-wiki-skills) を基にした。

Copyright 2025 Jerome Guibert。

Apache-2.0 または MIT のいずれかを選択して利用できる。

ライセンス本文は移植元の [LICENSE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE)、[LICENSE-APACHE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-APACHE)、[LICENSE-MIT](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-MIT) を参照する。
