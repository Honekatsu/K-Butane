---
name: llm-wiki-bootstrap
description: セッション開始時または Wiki の切替時に、構成、型、主要ページを把握する。
---

# Wiki の初期確認

## Codex の MCP 接続

このスキルの wiki_* ツールは、登録済みの llm-wiki MCP 接続で呼び出す。

llm-wiki のインストール、MCP 接続設定の作成、llm-wiki serve の起動は行わない。

自宅ネットワークで利用する既定の MCP エンドポイントは、`http://172.20.20.10:18765/mcp` とする。
この URL に到達できない環境では、接続設定を推測・変更せず、利用する MCP 接続先を利用者に確認する。

Windows では、利用者が一度だけ次のコマンドを実行して HTTP MCP サーバーを登録する。
登録後は `wiki_*` ツールを直接使い、Windows のシェルコマンドで `llm-wiki` を起動しない。

```powershell
codex mcp add llm-wiki --url http://172.20.20.10:18765/mcp
codex mcp get llm-wiki
```

この登録に管理者権限は不要である。MCP サーバーを登録済みなら、Codex のコマンド実行権限を緩和する設定は不要である。

接続または文書化されたツールを利用できない場合は、CLI コマンドで代用せず、その状態を報告する。

## 使用する MCP ツール

`wiki_config`、`wiki_schema`、`wiki_list`、`wiki_content_read`、`wiki_stats`

## 手順

1. `wiki_config` で対象 Wiki と設定を確認する。`n2. `wiki_schema(action: "list")` で型を確認する。`n3. `wiki_list` と `wiki_content_read` でハブページを読み、作業対象を特定する。`n4. 必要なら `wiki_stats` でインデックスと構造の健全性を確認する。

## 確認事項

- 書込み、削除、既定 Wiki の変更、ファイル出力などの外部変更は、利用者の依頼範囲を確認してから行う。
- MCP の応答に含まれる警告、検証失敗、未処理項目を省略せず報告する。
- ページを変更する場合は、型、frontmatter、関連ページとのリンクを確認する。

## 移植元とライセンス

[geronimo-iia/llm-wiki-skills](https://github.com/geronimo-iia/llm-wiki-skills) を基にした。

Copyright 2025 Jerome Guibert。

Apache-2.0 または MIT のいずれかを選択して利用できる。

ライセンス本文は移植元の [LICENSE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE)、[LICENSE-APACHE](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-APACHE)、[LICENSE-MIT](https://github.com/geronimo-iia/llm-wiki-skills/blob/main/LICENSE-MIT) を参照する。
