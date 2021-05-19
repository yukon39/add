﻿
Перем ПостроительДереваТестов Экспорт;
Перем КонтейнерМодуля Экспорт;
Перем КонтейнерГруппы Экспорт;

#Область ПрограммныйИнтерфейс

Процедура СлучайныйПорядокВыполнения() Экспорт
	
	Если ЗначениеЗаполнено(КонтейнерМодуля) Тогда
		КонтейнерМодуля.СлучайныйПорядокВыполнения = Истина;
	КонецЕсли;
	
КонецПроцедуры

Процедура СтрогийПорядокВыполнения() Экспорт
	
	Если ЗначениеЗаполнено(КонтейнерМодуля) Тогда
		
		КонтейнерМодуля.СлучайныйПорядокВыполнения = Ложь;
		ОстановитьВыполнениеПослеПаденияТестов();
		
	КонецЕсли;
	
КонецПроцедуры

Процедура ПродолжитьВыполнениеПослеПаденияТеста() Экспорт
	
	Если ЗначениеЗаполнено(КонтейнерМодуля) Тогда
		КонтейнерМодуля.ПродолжитьВыполнениеПослеПаденияТеста = Истина;
	КонецЕсли;	
	
КонецПроцедуры

Процедура ОстановитьВыполнениеПослеПаденияТестов() Экспорт
	
	Если ЗначениеЗаполнено(КонтейнерМодуля) Тогда
		КонтейнерМодуля.ПродолжитьВыполнениеПослеПаденияТеста = Ложь;
	КонецЕсли;	
	
КонецПроцедуры

Процедура НачатьГруппу(Знач ИмяГруппы, Знач СтрогийПорядокВыполнения = Ложь) Экспорт
	
	КонтейнерГруппы = ПостроительДереваТестов.СоздатьКонтейнер(ИмяГруппы, 
		ПостроительДереваТестов.ИконкиУзловДереваТестов.Группа);
	КонтейнерГруппы.Путь = КонтейнерМодуля.Путь;
	КонтейнерГруппы.СлучайныйПорядокВыполнения = Не СтрогийПорядокВыполнения;
	КонтейнерМодуля.Строки.Добавить(КонтейнерГруппы);
	
КонецПроцедуры

Функция Добавить(Знач ИмяМетода, Знач Параметры = Неопределено, Знач Представление = "") Экспорт
	
	Если Не ЗначениеЗаполнено(Параметры) ИЛИ ТипЗнч(Параметры) <> Тип("Массив") Тогда
		
		Если ТипЗнч(Параметры) = Тип("Строка") И Представление = "" Тогда
			Представление = Параметры;
		КонецЕсли;
		
		Параметры = Неопределено;
		
	КонецЕсли;
	
	Элемент = ПостроительДереваТестов.СоздатьЭлемент(КонтейнерМодуля.Путь, ИмяМетода, Представление);
	
	Если Параметры <> Неопределено Тогда
		Элемент.Параметры = Параметры;
	КонецЕсли;
	
	Если ЗначениеЗаполнено(КонтейнерГруппы) Тогда
		КонтейнерГруппы.Строки.Добавить(Элемент);
	Иначе
		КонтейнерМодуля.Строки.Добавить(Элемент);
	КонецЕсли;
	
	Возврат Элемент;
	
КонецФункции

Функция ДобавитьДеструктор(Знач ИмяМетодаДеструктора, Знач Представление = "") Экспорт
	
	ЭлементДеструктор = Добавить(ИмяМетодаДеструктора, Неопределено, Представление);
	
	Если ЗначениеЗаполнено(КонтейнерГруппы) Тогда
		КонтейнерГруппы.ЭлементДеструктор = ЭлементДеструктор;
	Иначе
		КонтейнерМодуля.ЭлементДеструктор = ЭлементДеструктор;
	КонецЕсли;
	
	Возврат ЭлементДеструктор;
	
КонецФункции

Функция ПараметрыТеста(Знач Парам1, Знач Парам2 = Неопределено, Знач Парам3 = Неопределено, 
	Знач Парам4 = Неопределено, Знач Парам5 = Неопределено, Знач Парам6 = Неопределено, 
	Знач Парам7 = Неопределено, Знач Парам8 = Неопределено, Знач Парам9 = Неопределено) Экспорт
	
	ВсеПараметры = Новый Массив;
	ВсеПараметры.Добавить(Парам1);
	ВсеПараметры.Добавить(Парам2);
	ВсеПараметры.Добавить(Парам3);
	ВсеПараметры.Добавить(Парам4);
	ВсеПараметры.Добавить(Парам5);
	ВсеПараметры.Добавить(Парам6);
	ВсеПараметры.Добавить(Парам7);
	ВсеПараметры.Добавить(Парам8);
	ВсеПараметры.Добавить(Парам9);
	
	ИндексСПоследнимПараметром = 0;
	
	Для Сч = 0 По ВсеПараметры.ВГраница() Цикл
		
		Индекс = ВсеПараметры.ВГраница() - Сч;
		Если ВсеПараметры[Индекс] <> Неопределено Тогда
			ИндексСПоследнимПараметром = Индекс;
			Прервать;
		КонецЕсли;
		
	КонецЦикла;
	
	ПараметрыТеста = Новый Массив;
	Для Сч = 0 По ИндексСПоследнимПараметром Цикл
		ПараметрыТеста.Добавить(ВсеПараметры[Сч]);
	КонецЦикла;
	
	Возврат ПараметрыТеста;
	
КонецФункции

#КонецОбласти

#Область СлужебныйПрограммныйИнтерфейс

#Область ВнешнийИнтерфейсПлагина

Функция ОписаниеПлагина(ВозможныеТипыПлагинов) Экспорт
	
	Результат = Новый Структура;
	Результат.Вставить("Тип", ВозможныеТипыПлагинов.Загрузчик);
	Результат.Вставить("Идентификатор", Метаданные().Имя);
	Результат.Вставить("Представление", Метаданные().Представление());
	
	Возврат Новый ФиксированнаяСтруктура(Результат);
	
КонецФункции

Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
	
КонецПроцедуры

#КонецОбласти

#Область ВнутреннийИнтерфейсПлагина

Функция СписокРасширений() Экспорт
	
	СписокРасширений = Новый СписокЗначений();
	
	Для Каждого РасширениеКонфигурации Из РасширенияКонфигурации.Получить() Цикл
		
		Если ЗначениеЗаполнено(РасширениеКонфигурации.Версия) Тогда
			ПредставлениеРасширения = СтрШаблон("%1 (%2)",
			РасширениеКонфигурации.Синоним,
			РасширениеКонфигурации.Версия);
			
		Иначе
			ПредставлениеРасширения = РасширениеКонфигурации.Синоним;
			
		КонецЕсли;
		
		СписокРасширений.Добавить(РасширениеКонфигурации.Имя, ПредставлениеРасширения);
		
	КонецЦикла;
	
	Возврат СписокРасширений;
	
КонецФункции

Функция МодулиРасширения(ИмяРасширения) Экспорт
	
	МетаданныеРасширения = МетаданныеРасширения(ИмяРасширения);
	
	МодулиРасширения = Новый Структура();
	МодулиРасширения.Вставить("Клиент", КлиентскиеМодулиРасширения(МетаданныеРасширения));
	МодулиРасширения.Вставить("Сервер", СерверныеМодулиРасширения(МетаданныеРасширения));
	
	Возврат Новый ФиксированнаяСтруктура(МодулиРасширения);
	
КонецФункции

Процедура ИнициализироватьПостроительДереваТестов(ОбъектКонтекстаЯдра) Экспорт
	
	КонтекстЯдра = КонтекстЯдра(ОбъектКонтекстаЯдра);
	ПостроительДереваТестов = КонтекстЯдра.Плагин("ПостроительДереваТестов");
	
КонецПроцедуры

Функция ИконкаУзлаМодуля() Экспорт
	Возврат ПостроительДереваТестов.ИконкиУзловДереваТестов.Форма;
КонецФункции

Функция ТипКонтекстаМодуля() Экспорт
	Возврат ТипыКонтекстаМодулей.Сервер;
КонецФункции

#КонецОбласти

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Функция ВключенаАнглийскаяЛокализация()
	
	ВариантВстроенногоЯзыкаАнглийский = Ложь;
	Если Metadata.ScriptVariant = Metadata.ObjectProperties.ScriptVariant.English 
		Или	ТекущийЯзыкСистемы() = "en" Тогда
		
		ВариантВстроенногоЯзыкаАнглийский = Истина;
	КонецЕсли;
	
	Возврат ВариантВстроенногоЯзыкаАнглийский;
	
КонецФункции

Функция ТипыКонтекстаМодулей()
	
	Результат = Новый Структура;
	Результат.Вставить("Клиент", "Клиент");
	Результат.Вставить("Сервер", "Сервер");
	
	Возврат Новый ФиксированнаяСтруктура(Результат);
	
КонецФункции

Функция КонтекстЯдра(ОбъектКонтекстаЯдра)
	
	// Получаем доступ к серверному контексту обработки с использованием 
	// полного имени метаданных браузера тестов. Иначе нет возможности получить
	// доступ к серверному контексту ядра, т.к. изначально вызов был выполнен на клиенте.
	// При передаче на сервер клиентский контекст теряется.
	КонтекстЯдра = Неопределено;
	ПолноеИмяБраузераТестов = ОбъектКонтекстаЯдра.ПолноеИмяБраузераТестов;
	
	МетаданныеЯдра = Метаданные.НайтиПоПолномуИмени(ПолноеИмяБраузераТестов);
	Если НЕ МетаданныеЯдра = Неопределено И Метаданные.Обработки.Содержит(МетаданныеЯдра) Тогда
		
		МенеджерОбработки = Обработки[МетаданныеЯдра.Имя];
		КонтекстЯдра = МенеджерОбработки.Создать();
		
	Иначе
		
		ЧастиИмени = СтрРазделить(ПолноеИмяБраузераТестов, ".");
		ИмяОбработкиКонтекстаЯдра = ЧастиИмени[1];
		КонтекстЯдра = ВнешниеОбработки.Создать(ИмяОбработкиКонтекстаЯдра);
		
	КонецЕсли;
	
	КонтекстЯдра.ИнициализацияНаСервере(ОбъектКонтекстаЯдра);
	
	Возврат КонтекстЯдра;
	
КонецФункции

Функция МетаданныеРасширения(ИмяРасширения) 
	
	Отбор = Новый Структура("Имя", ИмяРасширения); 
	Расширения = РасширенияКонфигурации.Получить(Отбор);
	Расширение = Расширения[0];
	МетаданныеРасширения = Новый ОбъектМетаданныхКонфигурация(Расширение.ПолучитьДанные());
	
	Возврат МетаданныеРасширения;	
	
КонецФункции

Функция КлиентскиеМодулиРасширения(МетаданныеРасширения)
	
	МодулиРасширения = Новый Массив;
	
	Для Каждого ОбщийМодуль Из МетаданныеРасширения.ОбщиеМодули Цикл
		
		Если ОбщийМодуль.КлиентУправляемоеПриложение И НЕ ОбщийМодуль.Глобальный Тогда
			МодулиРасширения.Добавить(ОбщийМодуль.Имя);
		КонецЕсли;			
		
	КонецЦикла;
	
	Возврат Новый ФиксированныйМассив(МодулиРасширения);
	
КонецФункции

Функция СерверныеМодулиРасширения(МетаданныеРасширения)
	
	МодулиРасширения = Новый Массив;
	
	Для Каждого ОбщийМодуль Из МетаданныеРасширения.ОбщиеМодули Цикл
		
		Если ОбщийМодуль.Сервер И НЕ ОбщийМодуль.Глобальный Тогда
			МодулиРасширения.Добавить(ОбщийМодуль.Имя);
		КонецЕсли;			
		
	КонецЦикла;
	
	Возврат Новый ФиксированныйМассив(МодулиРасширения);
	
КонецФункции

#КонецОбласти

ЭтотОбъект.ВключенаАнглийскаяЛокализация = ВключенаАнглийскаяЛокализация();
ЭтотОбъект.ТипыКонтекстаМодулей = ТипыКонтекстаМодулей();
