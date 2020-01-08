#!/bin/bash

# This script adds a UDO - Related Item to your system
# set -x

# Change the IP to your Service Layer IP
SL_URL="http://0.0.0.0:50001/b1s/v1"
# Change the IP to your Company DB, and your username and password
CompanyDB="YourCompany DB"
echo "Login company ${CompanyDB}"
curl  -b cookies.txt -c cookies.txt \
-X POST \
  $SL_URL/Login \
  -H 'Postman-Token: 813de3ba-7030-4c68-80b4-065963be252a,123a75bd-b9a3-4880-b513-da14d7ca5162' \
  -H 'cache-control: no-cache' \
  -d "{
    \"CompanyDB\": \"${CompanyDB}\",
    \"UserName\": \"manager\",
    \"Password\": \"manager\"
}"

curl  -b cookies.txt -c cookies.txt \
-X POST \
  $SL_URL/UserTablesMD \
  -H 'Accept: */*' \
  -d '{
    "TableName": "RelatedItems",
    "TableDescription": "Related Items",
    "TableType": "bott_MasterData"
    }'

sleep 25s
curl  -b cookies.txt -c cookies.txt \
-X POST \
  $SL_URL/UserFieldsMD \
  -H 'Accept: */*' \
  -d '{
     "Name": "ItemCode",
     "Description": "Item No.",
     "TableName": "@RELATEDITEMS",
     "Type": "db_Alpha",
     "Size": 30
    }'

sleep 25s
curl  -b cookies.txt -c cookies.txt \
-X POST \
  $SL_URL/UserFieldsMD \
  -H 'Accept: */*' \
  -d '{
     "Name": "RelatedItemCode",
     "Description": "Related Item No.",
     "TableName": "@RELATEDITEMS",
     "Type": "db_Alpha",
     "Size": 30
    }'

sleep 25s
curl  -b cookies.txt -c cookies.txt \
-X POST \
  $SL_URL/UserObjectsMD \
  -H 'Accept: */*' \
  -d '{
   "Code": "RelatedItem",
   "Name": "RelatedItem",
   "TableName": "RELATEDITEMS",
   "LogTableName": null,
   "ObjectType": "boud_MasterData",
   "ManageSeries": "tNO",
   "CanDelete": "tYES",
   "CanClose": "tNO",
   "CanCancel": "tNO",
   "ExtensionName": null,
   "CanFind": "tNO",
   "CanYearTransfer": "tNO",
   "CanCreateDefaultForm": "tYES",
   "CanLog": "tNO",
   "OverwriteDllfile": "tYES",
   "UseUniqueFormType": "tYES",
   "CanArchive": "tNO",
   "MenuItem": "tNO",
   "MenuCaption": "",
   "FatherMenuID": null,
   "Position": null,
   "EnableEnhancedForm": "tNO",
   "RebuildEnhancedForm": "tYES",
   "FormSRF": null,
   "MenuUID": null,
   "UserObjectMD_ChildTables": [
      {}
   ],
   "UserObjectMD_FindColumns": [
      {}
   ],
   "UserObjectMD_FormColumns": [
      {
         "Code": "RelatedItem",
         "FormColumnNumber": "1",
         "SonNumber": "0",
         "FormColumnAlias": "Code",
         "FormColumnDescription": "Code",
         "Editable": "tYES"
      },
      {
         "Code": "RelatedItem",
         "FormColumnNumber": "2",
         "SonNumber": "0",
         "FormColumnAlias": "U_ItemCode",
         "FormColumnDescription": "Item No.",
         "Editable": "tYES"
      },
      {
         "Code": "RelatedItem",
         "FormColumnNumber": "3",
         "SonNumber": "0",
         "FormColumnAlias": "U_RelatedItemCode",
         "FormColumnDescription": "Related Item No.",
         "Editable": "tYES"
      }
   ],
   "UserObjectMD_EnhancedFormColumns": [
      {}
   ]
    }'

