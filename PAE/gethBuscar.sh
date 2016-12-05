#!/usr/bin/expect
spawn geth --testnet console
expect "> "
#send "eth.defaultAccount=eth.accounts[0] \n"
send "personal.unlockAccount(\"0x80e6eb1bd02f893f6e44d350a82876ae86382f04\",\"PAE1234\")\n"

expect "undefined"
send [lindex $argv 0]; #este parámetro es el json
sleep 2
send "\n"
expect "> "

send "var secureUpdate = json.at('0x6d2656aee5a778e66ee6847438bb1b95bf2d2b97') \n"
expect "undefined"

send [lindex $argv 1]; #este parámetro es el filtro
sleep 2
send "\n"
expect "undefined"  

expect {
    "New Update available" {
        send_user "Hay una nueva actualización"
    }
}
interact