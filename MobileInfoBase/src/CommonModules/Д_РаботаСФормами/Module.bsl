
#Область ПрограммныйИнтерфейс

Процедура ДополнитьФорму(Форма) Экспорт
// Володин А.А. 
// Задача 1 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.	
	ИмяФормы = Форма.ИмяФормы;
	
	Если ИмяФормы = "Документ.ЗаказПокупателя.Форма.ФормаДокумента" Тогда
		
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		
	ИначеЕсли ИмяФормы = "Документ.ПоступлениеТоваровУслуг.Форма.ФормаДокумента" Тогда
		
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		
	ИначеЕсли ИмяФормы = "Документ.РеализацияТоваровУслуг.Форма.ФормаДокумента" Тогда
		
		ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма);
		
	ИначеЕсли ИмяФормы = "Документ.ОплатаОтПокупателя.Форма.ФормаДокумента" Тогда
		
		ВставитьПолеКонтактноеЛицоНаФормуПередОснование(Форма);
		
	ИначеЕсли ИмяФормы = "Документ.ОплатаПоставщику.Форма.ФормаДокумента" Тогда
		
		ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма);	
		
	КонецЕсли;
// Конец вставки от 15 октября 2024 г.
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

Процедура ДобавитьПолеКонтактноеЛицоВГруппаШапкаПраво(Форма)
// Володин А.А. 
// Задача 1 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	ПолеВвода = Форма.Элементы.Добавить("КонтактноеЛицо", Тип("ПолеФормы"), Форма.Элементы.ГруппаШапкаПраво);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Д_КонтактноеЛицо";
// Конец вставки от 15 октября 2024 г.
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередСуммаДокумента(Форма)
// Володин А.А. 
// Задача 1 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.СуммаДокумента);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Д_КонтактноеЛицо"
// Конец вставки от 8 августа 2024 г.
КонецПроцедуры

Процедура ВставитьПолеКонтактноеЛицоНаФормуПередОснование(Форма)
// Володин А.А. 
// Задача 1 ДЗ Внесение изменений в конфигурацию на поддержке 
// 15 октября 2024 г.
	ПолеВвода = Форма.Элементы.Вставить("КонтактноеЛицо", Тип("ПолеФормы"), , Форма.Элементы.Основание);
	ПолеВвода.Вид = ВидПоляФормы.ПолеВвода;
	ПолеВвода.ПутьКДанным = "Объект.Д_КонтактноеЛицо"
// Конец вставки от 15 октября 2024 г.
КонецПроцедуры

#КонецОбласти
