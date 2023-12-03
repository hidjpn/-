#!/bin/bash

echo "パスワードマネージャーへようこそ！"
echo "次の選択肢から入力してください ( Add Password / Get Password / Exit )："

while true
do
	read action
	echo " "

	case $action in

	# Add Password が入力された場合
		"Add Password" | "add password")
			echo "サービス名を入力してください："
			read service
			echo "ユーザー名を入力してください："
			read user
			echo "パスワードを入力してください："
			read pass
			echo $service $user $pass >> password_manager.txt
			echo " "
			echo "パスワードの追加は成功しました。"
			echo " "
			echo "次の選択肢から入力してください ( Add Password / Get Password / Exit )："
			;;

	# Get Password が入力された場合
		"Get Password" | "get password")
			echo "サービス名を入力してください："
			read service2
			echo " "

			# 完成していません。違うサービス間でサービス名とユーザー名が同じだったりすると望み通りの表示になりません。
			if cut -d " " -f 1 password_manager.txt | grep -q $service2 ; then
				echo サービス名： ; grep $service2 password_manager.txt | cut -d " " -f 1
				echo ユーザー名： ; grep $service2 password_manager.txt | cut -d " " -f 2 
				echo パスワード： ; grep $service2 password_manager.txt | cut -d " " -f 3
			else
				echo "そのサービスは登録されていません。"
			fi

			echo " "
			echo "次の選択肢から入力してください ( Add Password / Get Password / Exit )："
			;;

	# Exit が入力された場合
		"Exit" | "exit")
			echo "Thank you!"
			echo " "
			break
			;;

	# 入力を間違えた場合
		*)
			echo "入力が間違えています。Add Password / Get Password / Exit から入力してください。"
			;;
	esac
done

