﻿
#Область Служебные_функции_и_процедуры

&НаКлиенте
// контекст фреймворка Vanessa-ADD
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-ADD.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	// описание шагов
	// пример вызова Ванесса.ДобавитьШагВМассивТестов(ВсеТесты, Снипет, ИмяПроцедуры, ПредставлениеТеста, ОписаниеШага, ТипШагаДляОписания, ТипШагаВДереве);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПоказываюТехническуюИнформациюВОтдельнойФорме()","ЯПоказываюТехническуюИнформациюВОтдельнойФорме","Когда Я показываю техническую информацию в отдельной форме","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯПоказываюТехническуюИнформациюВОкнеСообщений()","ЯПоказываюТехническуюИнформациюВОкнеСообщений","Когда Я показываю техническую информацию в окне сообщений","","");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ЯСохраняюТехническуюИнформациюВПеременную(Парам01)","ЯСохраняюТехническуюИнформациюВПеременную","Когда Я сохраняю техническую информацию в переменную ""ТехническаяИнформация""","","");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции

#КонецОбласти



#Область Работа_со_сценариями

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры

#КонецОбласти


// { Plugin interface
&НаКлиенте
Функция ОписаниеПлагина(ВозможныеТипыПлагинов) Экспорт
	Возврат ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов);
КонецФункции

&НаКлиенте
Процедура Инициализация(КонтекстЯдраПараметр) Экспорт
КонецПроцедуры
// } Plugin interface

// { Helpers
&НаСервере
Функция ЭтотОбъектНаСервере()
	Возврат РеквизитФормыВЗначение("Объект");
КонецФункции

&НаСервере
Функция ОписаниеПлагинаНаСервере(ВозможныеТипыПлагинов)
	Возврат ЭтотОбъектНаСервере().ОписаниеПлагина(ВозможныеТипыПлагинов);
КонецФункции
// } Helpers

///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//Когда Я показываю техническую информацию в отдельной форме
//@ЯПоказываюТехническуюИнформациюВОтдельнойФорме()
Процедура ЯПоказываюТехническуюИнформациюВОтдельнойФорме() Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	Информатор = Ванесса.Плагин("Информатор");
	Информатор.ОткрытьФорму();
КонецПроцедуры

&НаКлиенте
//Когда Я показываю техническую информацию в окне сообщений
//@ЯПоказываюТехническуюИнформациюВОкнеСообщений()
Процедура ЯПоказываюТехническуюИнформациюВОкнеСообщений() Экспорт
	Информатор = Ванесса.Плагин("Информатор");
	Информатор.СообщитьТехническуюИнформацию();
КонецПроцедуры

&НаКлиенте
//Когда Я сохраняю техническую информацию в переменную "ТехническаяИнформация"
//@ЯСохраняюТехническуюИнформациюВПеременную(Парам01)
Процедура ЯСохраняюТехническуюИнформациюВПеременную(ИмяПеременной) Экспорт
	Информатор = Ванесса.Плагин("Информатор");
	ТехническаяИнформация = Информатор.ТехническаяИнформация();
	Ванесса.СохранитьЗначениеВКонтекст(ИмяПеременной, ТехническаяИнформация);
КонецПроцедуры
