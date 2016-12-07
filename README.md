# データベース設計

## users テーブル

|column|type|restriction|unique constraints|index|foreign key constraint|
|:-----:|:-----:|:------:|:------:|:-----:|:-----:|
|name|string|null-false|true|add|-|
|email|string|null-false|true|add|-|
|password|string|null-false|-|-|-|
|group_id|string|-|-|-|true|

## groups テーブル

|column|type|
|:------:|:------:|
|keys|string|

## messages テーブル

|column|type|foreign key constraint|
|:----:|:----:|:----:|
|user_id|integer|true|
|group_id|integer|true|
|image|string|-|
|body|text|-|