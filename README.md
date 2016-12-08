# データベース設計

## users テーブル

|column|type|restriction|unique constraints|index|
|:-----:|:-----:|:------:|:------:|:-----:|
|name|string|null-false|true|add|
|email|string|null-false|true|add|
|password|string|null-false|-|-|


## groups テーブル

|column|type|
|:------:|:------:|
|name|string|

## messages テーブル

|column|type|foreign key constraint|
|:----:|:----:|:----:|
|user_id|integer|true|
|group_id|integer|true|
|image|string|-|
|body|text|-|

## user_groups テーブル

|column|type|foreign key constraints|
|:------:|:------:|:-----:|
|user_id|integer|true|
|group_id|integer|true|