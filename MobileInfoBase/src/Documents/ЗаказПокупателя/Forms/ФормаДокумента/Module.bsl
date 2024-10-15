
#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	// СтандартныеПодсистемы.ПодключаемыеКоманды
	ПодключаемыеКоманды.ПриСозданииНаСервере(ЭтотОбъект);
	// Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиент.НачатьОбновлениеКоманд(ЭтотОбъект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаСервере
Процедура ПриЧтенииНаСервере(ТекущийОбъект)
	
    // СтандартныеПодсистемы.ПодключаемыеКоманды
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
    // Конец СтандартныеПодсистемы.ПодключаемыеКоманды
	
КонецПроцедуры

&НаКлиенте
Процедура ПослеЗаписи(ПараметрыЗаписи)
    ПодключаемыеКомандыКлиент.ПослеЗаписи(ЭтотОбъект, Объект, ПараметрыЗаписи);
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ПриИзмененииД_СогласованнаяСкидка(Элемент)
// Володин А.А. 
// Задача 2 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	ЗадатьВопросОРасчете();
// Конец вставки от 15 октября 2024 г.
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыТовары

&НаКлиенте
Процедура ТоварыКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Товары.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура ТоварыПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиСобытийЭлементовТаблицыФормыУслуги

&НаКлиенте
Процедура УслугиКоличествоПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиЦенаПриИзменении(Элемент)
	
	ТекущиеДанные = Элементы.Услуги.ТекущиеДанные;
	
	РассчитатьСуммуСтроки(ТекущиеДанные);
	
КонецПроцедуры

&НаКлиенте
Процедура УслугиПриИзменении(Элемент)
	РассчитатьСуммуДокумента();
КонецПроцедуры

#КонецОбласти

#Область ОбработчикиКомандФормы

&НаКлиенте
Процедура РасчетСкидкиКоманда()
// Володин А.А. 
// Задача 2 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	ЗадатьВопросОРасчете();
// Конец вставки от 15 октября 2024 г.
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура РассчитатьСуммуСтроки(ТекущиеДанные)
// Володин А.А. 
// Задача 2 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	//Было:	
	//ТекущиеДанные.Сумма = ТекущиеДанные.Цена * ТекущиеДанные.Количество;
	//Стало:
	//Посчитаем сумму с учетом Д_СогласованнаяСкидка
	ТекущиеДанные.Сумма = ТекущиеДанные.Количество * (ТекущиеДанные.Цена - ТекущиеДанные.Цена * Объект.Д_СогласованнаяСкидка/100);	
// Конец вставки от 15 октября 2024 г.
	РассчитатьСуммуДокумента();
	
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСуммуДокумента()
	
	Объект.СуммаДокумента = Объект.Товары.Итог("Сумма") + Объект.Услуги.Итог("Сумма");
	
КонецПроцедуры

#Область ПодключаемыеКоманды

// СтандартныеПодсистемы.ПодключаемыеКоманды
&НаКлиенте
Процедура Подключаемый_ВыполнитьКоманду(Команда)
    ПодключаемыеКомандыКлиент.НачатьВыполнениеКоманды(ЭтотОбъект, Команда, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ПродолжитьВыполнениеКомандыНаСервере(ПараметрыВыполнения, ДополнительныеПараметры) Экспорт
    ВыполнитьКомандуНаСервере(ПараметрыВыполнения);
КонецПроцедуры

&НаСервере
Процедура ВыполнитьКомандуНаСервере(ПараметрыВыполнения)
    ПодключаемыеКоманды.ВыполнитьКоманду(ЭтотОбъект, ПараметрыВыполнения, Объект);
КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ОбновитьКоманды()
    ПодключаемыеКомандыКлиентСервер.ОбновитьКоманды(ЭтотОбъект, Объект);
КонецПроцедуры
// Конец СтандартныеПодсистемы.ПодключаемыеКоманды

#КонецОбласти

&НаКлиенте
Асинх Процедура ЗадатьВопросОРасчете()
// Володин А.А. 
// Задача 2 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	Оповещение = Новый ОписаниеОповещения("ПослеОтвета", ЭтотОбъект);	
	
	ПоказатьВопрос(Оповещение, "Пересчитать скидку?", РежимДиалогаВопрос.ДаНет, 0, КодВозвратаДиалога.Да, "Пересчитать скидку?");    	
// Конец вставки от 15 октября 2024 г.
КонецПроцедуры

&НаКлиенте
Процедура ПослеОтвета(Результат, Параметры) Экспорт
// Володин А.А. 
// Задача 2 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	Если Результат = КодВозвратаДиалога.Да Тогда
		
		РассчитатьСкидку();
		
	КонецЕсли;	
// Конец вставки от 15 октября 2024 г.
КонецПроцедуры

&НаКлиенте
Процедура РассчитатьСкидку()
// Володин А.А. 
// Задача 2 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	Для Каждого Строка Из Объект.Товары Цикл
		
		РассчитатьСуммуСтроки(Строка);
		
	КонецЦикла;
	
	Для Каждого Строка Из Объект.Услуги Цикл
		
		РассчитатьСуммуСтроки(Строка);
		
	КонецЦикла;
// Конец вставки от 15 октября 2024 г.
КонецПроцедуры

#КонецОбласти
