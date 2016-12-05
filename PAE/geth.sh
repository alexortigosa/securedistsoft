#!/bin/bash
1="V1"
2="V2"
diff -ruN $1 $2 > diff.patch
				ipfs=`ipfs add diff.patch`
				`echo $ipfs | cut -d' ' -f 2 > ipfs.txt`				
geth --testnet console
