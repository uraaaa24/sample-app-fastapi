# Python3.9のイメージをダウンロード
FROM python:3.9-buster
ENV PYTHONUNBUFFERED=1

WORKDIR /src

# pipを使ってpoetryをインストール
RUN pip install poetry

# poetryの定義ファイルをコピー（存在する場合）
COPY pyproject.toml* poetry.lock* ./

# portryでライブラリをインストール（pyprojec。.tmlがすでにある場合）
RUN poetry config virtualenvs.in-project true
RUN if [ -f pyproject.tml ]; then poetry install --no-ruut; fi

# uvicornのサーバーを立ち上げる
ENTRYPOINT [ "portry", "run", "uvicorn", "api.main:app", "--host", "0.0.0.0", "--reload" ]
