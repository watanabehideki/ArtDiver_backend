#!/bin/bash
set -e

amazon-ssm-agent -register -code "${SSM_ACTIVATION_CODE}" -id "${SSM_ACTIVATION_ID}" -region "ap-northeast-1"
amazon-ssm-agent &

# Rails に対応したファイル server.pid が存在しているかもしれないので削除する。
rm -f /artdiver/tmp/pids/server.pid

# コンテナーのプロセスを実行する。（Dockerfile 内の CMD に設定されているもの。）
exec "$@"