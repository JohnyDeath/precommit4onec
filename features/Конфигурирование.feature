# language: ru

Функциональность: Настройка конфигурации прекоммита

Как разработчик
Я хочу иметь возможность изменять настройки precommit4onec
Чтобы автоматически выполнять обработку исходников перед фиксацией изменений в репозитории

Сценарий: Печать текущих настроек precommit4onec
	Когда Я выполняю команду "oscript" c параметрами "<КаталогПроекта>/src/main.os configure -global"
	Тогда Код возврата команды "oscript" равен 0
		И Я сообщаю вывод команды "oscript"
		И Вывод команды "oscript" содержит "precommit4onec v1.0.2"
		И Вывод команды "oscript" содержит "Установленные настройки:"
		И Вывод команды "oscript" содержит "ИспользоватьСценарииРепозитория ="
		И Вывод команды "oscript" содержит "КаталогЛокальныхСценариев ="
		И Вывод команды "oscript" содержит "ГлобальныеСценарии ="

Сценарий: Сброс настроек к значениям по умолчанию
	Когда Я выполняю команду "oscript" c параметрами "<КаталогПроекта>/src/main.os configure -global -reset"
	Тогда Код возврата команды "oscript" равен 0
		И Я выполняю команду "oscript" c параметрами "<КаталогПроекта>/src/main.os configure -global"
		И Код возврата команды "oscript" равен 0
		И Я сообщаю вывод команды "oscript"
		И Вывод команды "oscript" содержит 
		"""
    precommit4onec v1.0.2
    Установленные настройки:
        ИспользоватьСценарииРепозитория = Нет
        КаталогЛокальныхСценариев =
        ГлобальныеСценарии = РазборОбычныхФормНаИсходники.os,РазборОтчетовОбработокРасширений.os
    	"""
