# 1C_Search_SPPR
Я разрабатываю расширение для СППР.
Цели:
1. упростить обновление если ваша база имеет расширения, контроль доработок
Я храню процедуры и функции основной конфы и расширений для их сравнения 
![image](https://user-images.githubusercontent.com/5235515/118147874-b2635080-b418-11eb-97b8-360e45002411.png)
Здесь вот например ниже 4 файла - процедура/функция в 2х версиях основной конфигурации и расширения
![image](https://user-images.githubusercontent.com/5235515/118148114-ee96b100-b418-11eb-8c47-e95ef67f394f.png)
Сравнивать можно как программно, сравнивая текст, так и средством сравнения 1с.
![image](https://user-images.githubusercontent.com/5235515/118148358-29004e00-b419-11eb-8718-b2ef4af20383.png)
![image](https://user-images.githubusercontent.com/5235515/118148437-3d444b00-b419-11eb-862d-5f422d32eee5.png)
Если у вас много используется директива компиляции #Вместо и даже #ИзменениеИКонтроль (например для прошлой версии вы сделали, а в новой уже изменилось,
то это незаменимый инструмент)




3. поиск для аналитика
4.1.Пример: вам нужно понять, где есть ссылки на какой-то справочник в коде или вызов процедуры. Вы хотите потом этот поиск использовать повторно или результаты этого поиска.
Результаты поиска хранятся в виде файлов на диске
![image](https://user-images.githubusercontent.com/5235515/118147439-3d901680-b418-11eb-82af-cdf37af7b825.png)
содержимое файла -пример.

Ниже пути к файлам, где находися текст ОбщегоНазначенияБП.ЗаписатьДанныеВХранилище, который мы искали. 
D:\CPM_3_1_7_2\InformationRegisters\СведенияДекларацийНаТовары\Ext\ManagerModule.bsl
D:\CPM_3_1_7_2\AccumulationRegisters\НДСПредъявленныйРеализация0\Ext\ManagerModule.bsl
D:\CPM_3_1_7_2\Documents\ТаможеннаяДекларацияЭкспорт\Forms\ФормаДокумента\Ext\Form\Module.bsl
D:\CPM_3_1_7_2\DataProcessors\ПомощникУплатыНалоговВзносовПрошлыхЛет\Ext\ManagerModule.bsl
D:\CPM_3_1_7_2\DataProcessors\ОтправкаЗаявокВSmartway\Ext\ManagerModule.bsl
D:\CPM_3_1_7_2\CommonModules\ПерсонализированныеПредложенияСервисов\Ext\Module.bsl
D:\CPM_3_1_7_2\CommonModules\ОбновлениеИнформационнойБазыБП\Ext\Module.bsl
время поиска (секунд): 9

Т.е я могу посмотреть как реализована запись в регистр сведений "ХранилищеДанных" с ресурсом типа "Хранилище значения"

Далее мы можем уже повторно не обращаться к поиску и не использовать поиск в конфигураторе. ИМХО долгий.



