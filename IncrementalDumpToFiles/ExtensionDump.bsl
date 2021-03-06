Процедура ВыгрузитьРасширения(Параметры,СтрокаРасширения)
	
	ДобавитьЗаписьВЛог(Параметры, НСтр("ru='Начало выгрузки конфигурации в XML'"));

	СтрокаКоманды = "%КаталогИсполняемогоФайла%1cv8  DESIGNER /WA- /DisableStartupDialogs
		| %СтрокаСоединенияИБДляЗагрузкиМетаданных%
		| /N ""%ИмяПользователяИБДляЗагрузкиМетаданных%"" /P ""%ПарольПользователяИБДляЗагрузкиМетаданных%""
	        | /DumpConfigToFiles ""%КаталогВыгрузкиКонфигурации%"" -format Hierarchical 
	        | -Extension ""%ИмяРасширения%""
		| -update
	        //| -getChanges ""%ФайлИзмененийКонфигурации%"" ключ -getchanges не работает с ключом -update
		| /DumpResult ""%ИмяФайлаРезультатов%""
		| /Out ""%ИмяФайлаЛогов%"" -NoTruncate";

		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%КаталогИсполняемогоФайла%", Параметры.КаталогИсполняемогоФайла);
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%ИмяФайлаЛогов%", СтрокаРасширения.МестоИзменения.ПутьККаталогу+"\UnloadLog"+формат(текущаядата(),"ДФ='yyyy-MM-dd ЧЧмм'")+".txt");
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%СтрокаСоединенияИБДляЗагрузкиМетаданных%", Параметры.СтрокаСоединенияИБДляЗагрузкиМетаданных);
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%ИмяПользователяИБДляЗагрузкиМетаданных%", Параметры.ИмяПользователяИБДляЗагрузкиМетаданных);
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%ПарольПользователяИБДляЗагрузкиМетаданных%", Параметры.ПарольПользователяИБДляЗагрузкиМетаданных);
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%КаталогВыгрузкиКонфигурации%", СтрокаРасширения.МестоИзменения.ПутьККаталогу);
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%ИмяРасширения%",СтрокаРасширения.ИмяРасширения);
		
		//1свд
		Если параметры.проект.ПерваяВыгрузка_ДВС тогда
			СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"-update","");
			СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"-getChanges ""%ФайлИзмененийКонфигурации%","");
		КонецЕсли;
		
		если параметры.проект.ПлоскийФорматВыгрузки_ДВС тогда
			СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"Hierarchical","Plain");
		КонецЕсли;
		
		если не параметры.проект.ВыгрузитьРасширения тогда
			строкаКоманды = СтрЗаменить(СтрокаКоманды,"-AllExtensions","");
			СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"-update","");
		КонецЕсли;
		
		ФайлИзменений = СтрокаРасширения.МестоИзменения.ПутьККаталогу+"\diff"+формат(текущаядата(),"ДФ='yyyy-MM-dd ЧЧмм'")+".txt";
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%ФайлИзмененийКонфигурации%",ФайлИзменений);

		
		//1свд

		
		СтрокаКоманды = СтрЗаменить(СтрокаКоманды,"%ИмяФайлаРезультатов%", Параметры.ИмяФайлаРезультатов);

		КодВозврата = Неопределено;

		ЗапуститьПриложение(СтрокаКоманды, Параметры.КаталогИсполняемогоФайла, Истина, КодВозврата);

		ДобавитьЗаписьВЛог(Параметры, НСтр("ru='Окончание выгрузки конфигурации в XML'"), "Код возврата: "+?(КодВозврата = Неопределено, "Неопределено", КодВозврата));

		// Проверить успешность выполнения
		Если КодВозврата <> 0 Тогда

			ДобавитьЗаписьВЛог(Параметры, НСтр("ru = 'Ошибка выполнения пакетной операции'"), "", УровеньЖурналаРегистрации.Ошибка, Истина);
			ВызватьИсключение  НСтр("ru = 'При загрузке метаданных возникли ошибки (см. Журнал регистрации).
			|Выгрузка конфигурации в XML закончилась неудачей.'");
		КонецЕсли; 

КонецПроцедуры
