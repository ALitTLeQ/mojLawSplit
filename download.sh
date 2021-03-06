#!/bin/bash
#
# Download zip files from moj and unzip them into `./source`.
#
[ "$#" -eq 1 ] || (echo "Error: require specify UpdateDate" && exit 1)
mkdir -p source
cd source
git init

curl -L -o FalVMingLing.zip "http://law.moj.gov.tw/PublicData/GetFile.ashx?DType=XML&AuData=CFM"
unzip -o FalVMingLing.zip

curl -L -o Eng_FalVMingLing.zip "http://law.moj.gov.tw/PublicData/GetFile.ashx?DType=XML&AuData=EFM"
unzip -o Eng_FalVMingLing.zip

curl -L -o HisMingLing.zip "http://law.moj.gov.tw/PublicData/GetFile.ashx?DType=XML&AuData=CHM"
unzip -o HisMingLing.zip

rm *.zip
git add .
git commit -m "UpdateDate $1"
git tag $1
