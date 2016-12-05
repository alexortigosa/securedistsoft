#!/bin/bash
if [ "$#" -ne 0 ]; then
    echo "Este programa no necesita argumentos"
else
    echo "Iniciando geth y conectandose..."
    ./gethBuscar.sh "var json = eth.contract([{'constant':false,'inputs':[{'name':'ipfs','type':'string'}],'name':'uploadNewVersion','outputs':[],'payable':false,'type':'function'},{'constant':true,'inputs':[],'name':'getIPFSCurrentVersion','outputs':[{'name':'ipfs','type':'string'}],'payable':false,'type':'function'},{'constant':false,'inputs':[{'name':'newNode','type':'address'}],'name':'addNewNode','outputs':[],'payable':false,'type':'function'},{'constant':true,'inputs':[],'name':'whoAmI','outputs':[{'name':'creator','type':'address'},{'name':'sender','type':'address'},{'name':'allowed','type':'bool'}],'payable':false,'type':'function'},{'constant':true,'inputs':[{'name':'v','type':'uint256'}],'name':'getIPFSVersion','outputs':[{'name':'ipfs','type':'string'}],'payable':false,'type':'function'},{'constant':true,'inputs':[],'name':'getCurrentVersion','outputs':[{'name':'currentVersion','type':'uint256'}],'payable':false,'type':'function'},{'inputs':[],'payable':false,'type':'constructor'},{'anonymous':false,'inputs':[{'indexed':false,'name':'ifps','type':'string'}],'name':'newVersion','type':'event'}])" "var filter = web3.eth.filter({fromBlock:0, toBlock: 'latest', address: secureUpdate.address, 'topics':[]}); filter.watch(function(error, result) { if (!error) {
console.log(\"New update available\"); } })"
fi
