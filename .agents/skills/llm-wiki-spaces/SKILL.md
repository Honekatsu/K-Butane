---
name: llm-wiki-spaces
description: 登録済み Wiki スペースを作成、登録、確認、切替、削除する。
---

# Wiki スペース

## Codex の MCP 接続

このスキルの wiki_* ツールは、登録済みの llm-wiki MCP 接続で呼び出す。

llm-wiki のインストール、MCP 接続設定の作成、llm-wiki serve の起動は行わない。

接続または文書化されたツールを利用できない場合は、CLI コマンドで代用せず、その状態を報告する。

## 使用する MCP ツール

`wiki_spaces_list`、`wiki_spaces_create`、`wiki_spaces_register`、`wiki_spaces_set_default`、`wiki_spaces_remove`

## 手順

1. 変更前に `wiki_spaces_list` で登録状態と既定 Wiki を確認する。`n2. 作成時は名前、パス、説明、既定化の意図を確認する。`n3. 既存リポジトリは `wiki_spaces_register` を使う。`n4. 削除は登録解除とローカルディレクトリ削除を区別し、`delete: true` は明示指示がある場合だけ使う。

## 確認事項

- 書込み、削除、既定 Wiki の変更、ファイル出力などの外部変更は、利用者の依頼範囲を確認してから行う。
- MCP の応答に含まれる警告、検証失敗、未処理項目を省略せず報告する。
- ページを変更する場合は、型、frontmatter、関連ページとのリンクを確認する。

## 移植元とライセンス

[geronimo-iia/llm-wiki-skills](https://github.com/geronimo-iia/llm-wiki-skills) を基にした。

Copyright 2025 Jerome Guibert。

Apache-2.0 または MIT のいずれかを選択して利用できる。

ライセンス本文は移植元の [LICENSE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE)、[LICENSE-APACHE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-APACHE)、[LICENSE-MIT](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-MIT) を参照する。
