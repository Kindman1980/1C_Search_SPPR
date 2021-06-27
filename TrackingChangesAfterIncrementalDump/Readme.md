После того как выявил, что не работает инкрементальная выгрузка с ключом -getchanges, .т.е не формируется файл разниц при выгрузке в 
отдельный каталог одновременно с ключами -update -getchanges (пример ниже)
написал обработку по сверке файлов и формированию трех массивов файлов выгрузок:
-добавленные объекты
-измененные объекты
-удаленные объекты

C:\Program Files (x86)\1cv8\8.3.16.1814\bin\1cv8  DESIGNER /WA- /DisableStartupDialogs
/F "D:\07_Проекты\211_ОбновлениеУХ_31\УХ база для обновления 3.1.7.2 2021-06-26"
/N "" /P ""
/DumpConfigToFiles "D:\CPM_3_1_9_2" -format Hierarchical
-update -configDumpInfoForChanges "D:\CPM_3_1_8_2\ConfigDumpInfo.xml" -getChanges "D:\CPM_3_1_9_2\diff2021-06-27 1300.txt" 
/DumpResult "D:\CPM_3_1_8_2\DumpInfo2021-06-27 1300.log" /Out "D:\CPM_3_1_8_2\ЛогВыгрузкиЗагрузки_2021-06-27 1300.log" -NoTruncate
