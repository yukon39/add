﻿# language: ru

@IgnoreOn82Builds
@IgnoreOnOFBuilds
@IgnoreOn837
@IgnoreOn836

@Tree

Функциональность: Я хочу работать с таблицами

Как Разработчик я хочу
Чтобы у меня была библиотека для работы с таблицами TestClient
чтобы я мог быстрее создавать сценарии

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Количество строк в таблице
	Когда В панели разделов я выбираю "Основная"
	И     В панели функций я выбираю "Справочник1"
	И     я нажимаю на кнопку "Создать"
	И     в таблице "ТабличнаяЧасть1" 0 строк
	И     в ТЧ "ТабличнаяЧасть1" я нажимаю на кнопку "Добавить"
	И     В форме "Справочник1 (создание)" в ТЧ "ТабличнаяЧасть1" я завершаю редактирование строки
	И     в ТЧ "ТабличнаяЧасть1" я нажимаю на кнопку "Добавить"
	И     В форме "Справочник1 (создание)" в ТЧ "ТабличнаяЧасть1" я завершаю редактирование строки
	И     в поле с именем "Наименование" я ввожу текст "тест"
	И     в таблице "ТабличнаяЧасть1" 2 строки
	И     в таблице "ТабличнаяЧасть1" 2 строк
	И     в таблице "ТабличнаяЧасть1" 2 строка
	И     в таблице "ТабличнаяЧасть1" 2 строка
	И     в таблице "ТабличнаяЧасть1" больше или равно 2 строк
	И     в таблице "ТабличнаяЧасть1" больше или равно 1 строки
	И     в таблице "ТабличнаяЧасть1" больше 1 строки
	И     в таблице "ТабличнаяЧасть1" больше 0 строк
	И     в таблице "ТабличнаяЧасть1" меньше 3 строк
	И     в таблице "ТабличнаяЧасть1" меньше 3 строки
	И     в таблице "ТабличнаяЧасть1" меньше или равно 2 строк
	И     в таблице "ТабличнаяЧасть1" меньше или равно 2 строки
	Если в таблице "ТабличнаяЧасть1" количество строк "меньше или равно" 2 Тогда
		Тогда в таблице "ТабличнаяЧасть1" количество строк "меньше или равно" 2
		Тогда Я запоминаю значение выражения "1" в переменную "СлужебнаяПеременная"
	И выражение внутреннего языка "Контекст.СлужебнаяПеременная = 1" Истинно
	И     я нажимаю на кнопку "Записать и закрыть"

Сценарий: Выбор реквизита составного типа в таблице на форме для новой строки
	Дано Подготовим таблицу на форме
		И В командном интерфейсе я выбираю 'Основная' 'Таблицы на форме'
		Тогда открылось окно 'Таблицы на форме'
	И создаю новую строку таблицы
		И в таблице "ТабличнаяЧасть1" я добавляю новую строку
	Когда я нажимаю кнопку выбора у реквизита таблицы
		И в таблице "ТабличнаяЧасть1" я нажимаю кнопку выбора у реквизита "Составной реквизит таблицы"

	Тогда нет ошибки открытия
		Тогда открылось окно 'Выбор типа данных'

	Когда завершаю редактирование строки
		# Следующие строки могут помочь точно выбрать нужное метаданное в форме выбора типа
		И В форме "Выбор типа данных" в таблице "" я перехожу к строке:
			| '' |
			| Простой справочник |
		И я нажимаю на кнопку 'ОК'
		Тогда открылось окно 'Простой справочник'
		И в таблице "Список" я перехожу к строке:
			| Реквизит булево | Наименование              |
			| Нет             | Предопределенное значение |
		И в таблице "Список" я выбираю текущую строку
		Тогда открылось окно 'Таблицы на форме'
		И в таблице "ТабличнаяЧасть1" я завершаю редактирование строки

		Тогда таблица "ТабличнаяЧасть1" содержит строки:
			| N | Составной реквизит таблицы |
			| 1 | Предопределенное значение |
		Тогда таблица "ТабличнаяЧасть1" стала равной:
			| N | Составной реквизит таблицы |
			| 1 | Предопределенное значение  |
		Тогда таблица "ТабличнаяЧасть1" не содержит строки:
			| N | Составной реквизит таблицы |
			| 1 | '"Значение в кавычках"'  |

	И активизирую существующую строку таблицы
		И в таблице "ТабличнаяЧасть1" я выбираю текущую строку
	Когда я нажимаю кнопку выбора у реквизита таблицы
		И в таблице "ТабличнаяЧасть1" я нажимаю кнопку выбора у реквизита "Составной реквизит таблицы"
	Тогда нет ошибки открытия
		Тогда открылось окно 'Выбор типа данных'
		И я нажимаю на кнопку 'ОК'
