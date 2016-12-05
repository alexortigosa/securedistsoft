usage='Usage: uploadNewVersion.sh oldVersion newVersion'
if [ $# -ne 0 ]; then
	if  [ $# -eq 2 ]; then
		if [ -d $1 ]; then
			if [ -d $2 ]; then
				diff -ruN $1 $2 > diff.patch
				#A cambiar cuando se cree el smart contract
				addr="0x6d2656aee5a778e66ee6847438bb1b95bf2d2b97"
				ipfs=`ipfs add diff.patch`
				
				ipfs=`echo $ipfs | cut -d' ' -f 2`
				command="personal.unlockAccount(eth.accounts[0],\"PAE1234\") \n eth.defaultAccount=eth.accounts[0] \n var json = eth.contract([{'constant':false,'inputs':[{'name':'ipfs','type':'string'}],'name':'uploadNewVersion','outputs':[],'payable':false,'type':'function'},{'constant':true,'inputs':[],'name':'getIPFSCurrentVersion','outputs':[{'name':'ipfs','type':'string'}],'payable':false,'type':'function'},{'constant':false,'inputs':[{'name':'newNode','type':'address'}],'name':'addNewNode','outputs':[],'payable':false,'type':'function'},{'constant':true,'inputs':[],'name':'whoAmI','outputs':[{'name':'creator','type':'address'},{'name':'sender','type':'address'},{'name':'allowed','type':'bool'}],'payable':false,'type':'function'},{'constant':true,'inputs':[{'name':'v','type':'uint256'}],'name':'getIPFSVersion','outputs':[{'name':'ipfs','type':'string'}],'payable':false,'type':'function'},{'constant':true,'inputs':[],'name':'getCurrentVersion','outputs':[{'name':'currentVersion','type':'uint256'}],'payable':false,'type':'function'},{'inputs':[],'payable':false,'type':'constructor'},{'anonymous':false,'inputs':[{'indexed':false,'name':'ifps','type':'string'}],'name':'newVersion','type':'event'}]) \n var secureUpdate = json.at('$addr') \n secureUpdate.uploadNewVersion(\"$ipfs\",{gas:300000}) \n"
				echo $command 
			else
		    		echo $usage; exit 1
        		fi
        	else
            		echo $usage; exit 1
        	fi
	else
		echo $usage; exit 1
	fi
else
	echo $usage; exit 1
fi
