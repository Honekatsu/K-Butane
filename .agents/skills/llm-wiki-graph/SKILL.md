---
name: llm-wiki-graph
description: Wiki のノード、関係、部分グラフを生成して構造を調べる。
---

# 知識グラフ

## Codex の MCP 接続

このスキルの wiki_* ツールは、登録済みの llm-wiki MCP 接続で呼び出す。

llm-wiki のインストール、MCP 接続設定の作成、llm-wiki serve の起動は行わない。

接続または文書化されたツールを利用できない場合は、CLI コマンドで代用せず、その状態を報告する。

## 使用する MCP ツール

`wiki_graph`、`wiki_stats`、`wiki_lint`

## 手順

1. 対象 Wiki、型、起点、深さ、関係を必要な範囲に絞る。`n2. `wiki_graph` で構造を取得し、孤立ページや関係の欠落を確認する。`n3. 修正候補は `wiki_lint` とページ本文で裏付けてから提示する。

## 確認事項

- 書込み、削除、既定 Wiki の変更、ファイル出力などの外部変更は、利用者の依頼範囲を確認してから行う。
- MCP の応答に含まれる警告、検証失敗、未処理項目を省略せず報告する。
- ページを変更する場合は、型、frontmatter、関連ページとのリンクを確認する。

## 移植元とライセンス

[geronimo-iia/llm-wiki-skills](https://github.com/geronimo-iia/llm-wiki-skills) を基にした。

Copyright 2025 Jerome Guibert。

Apache-2.0 または MIT のいずれかを選択して利用できる。

ライセンス本文は移植元の [LICENSE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE)、[LICENSE-APACHE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-APACHE)、[LICENSE-MIT](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-MIT) を参照する。
