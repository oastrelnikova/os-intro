---
## Front matter
title: "Отчёта по лабораторной работе № 7"
subtitle: "Поиск файов. Перенаправление ввода-вывода.Просмотр запущенных процессов"
author: "Стрельникова Ольга Александровна"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Цель работы

Ознакомиться с инструментами поиска файлов и фильтрации текстовых данных. Приобретение практических навыков: по управлению процессами (и заданиями), по проверке использования диска и обслуживанию файловых систем.

# Задание

1. Осуществите вход в систему, используя соответствующее имя пользователя.
2. Запишите в файл file.txt названия файлов, содержащихся в каталоге /etc.
Допишите в этот же файл названия файлов, содержащихся в вашем домашнем каталоге.
3. Выведите имена всех файлов из file.txt, имеющих расширение .conf, после чего запишите их в новый текстовой файл conf.txt.
4. Определите, какие файлы в вашем домашнем каталоге имеют имена, начинавшиеся с символа c? Предложите несколько вариантов, как это сделать.
5. Выведите на экран (по странично) имена файлов из каталога /etc, начинающиеся с символа h.
6. Запустите в фоновом режиме процесс, который будет записывать в файл ~/logfile файлы, имена которых начинаются с log.
7. Удалите файл ~/logfile.
8. Запустите из консоли в фоновом режиме редактор gedit.
9. Определите идентификатор процесса gedit, используя команду ps, конвейер и фильтр grep. Можно ли определить этот идентификатор более простым способом?
10. Прочтите справку (man) команды kill, после чего используйте её для завершения процесса gedit.
11. Выполните команды df и du, предварительно получив более подробную информацию об этих командах, с помощью команды man.
12. Воспользовавшись справкой команды find, выведите имена всех директорий, имеющихся в вашем домашнем каталоге

# Выполнение лабораторной работы

1. Осуществляем вход в систему, используя соответствующее имя пользователя. (рис. @fig:001)

![Вход в систему под  нашим логином](image/img1.png){#fig:001}

2.Командой ls -a /etc >file.txt запишем в файл file.txt названия файлов, содержащихся в каталоге /etc. Допишем в этот же файл названия файлов, содержащихся в вашем домашнем каталоге. ls -a ~ >>file.txt. Проверим результат (рис. @fig:002)

![Создание файла, запись и добавление в него названий файлов](image/img2.png){#fig:002}



3. Командой grep '.conf$' file.txt > conf.txt запишем в файл file.txt все имена файлов имеющих расширение .conf и командой grep '.conf$' file.tx выведем имена всех файлов из file.txt, имеющих расширение .conf, после чего запишем их в новый текстовой файл conf.txt с помощью grep (рис. @fig:003).

![Поиск в файле с фильтром, вывод и запись результатов поиска в новый файл](image/img3.png){#fig:003}

![Показ содержимого файла conf.txt](image/img4.png){#fig:004}

4. Определим, какие файлы в вашем домашнем каталоге имеют имена, начинавшиеся с символа c, несколькими командами (рис. @fig:005) :
ls c* 
find ~ -maxdepth 1 -name "c*"

![Вывод ls c* и find ~ -maxdepth 1 -name "c*"](image/img5.png){#fig:005}

5. Командой find /etc -name "h*" | less и find /etc -maxdepth 1 -name "h*" | less  (рис. @fig:006) выведем на экран (постранично) имена файлов из каталога /etc, начинающиеся с символа h. (рис. @fig:006 - @fig:008)

![Вводимы в консоль команды](image/img9.png){#fig:006}

![Результат команды find /etc -name "h*" | less](image/img7.png){#fig:007}

![Результат команды find /etc -maxdepth 1 -name "h*" | less](image/img8.png){#fig:008}

6. Запустим в фоновом режиме, используя find -name "log*" ~ >logfile.txt &, (рис. @fig:009)процесс, который будет записывать в файл ~/logfile файлы, имена которых начинаются с log.  (рис. @fig:010)

![Отбор файлов и запись их имен в файл в фоновом режиме](image/img10.png){#fig:009}

![Демонстрация файла](image/img11.png){#fig:010}

7. Удалите файл ~/logfile. (рис. @fig:011)

![Удаление файла](image/img12.png){#fig:011}

8. Запустите из консоли в фоновом режиме редактор gedit. (рис. @fig:012)

9. Определите идентификатор процесса gedit, используя команду ps, конвейер и фильтр grep. Определим этот идентификатор более простым способом, используя: pgrep gedit или pidof gedit (рис. @fig:012)

![Запуск и поиск идентификаторов gedit](image/img14.png){#fig:012}

10. Прочтите справку (man) команды kill, после чего используйте её для завершения процесса gedit. (рис. @fig:013 - @fig:014). Команда kill для завершения процесса 

![Просмотр справки о команде kill](image/img15.png){#fig:013}

![Завершение gedit](image/img16.png){#fig:014}

11. Выполните команды df и du, предварительно получив более подробную информацию об этих командах, с помощью команды man. (рис. @fig:015 - @fig:018)

![Просмотр справки о команде df](image/img17.png){#fig:015}

![Просмотр справки о команде du](image/img18.png){#fig:016}

![Выполнение команды df](image/img19.png){#fig:017}

![Выполнение команды du](image/img20.png){#fig:018}

12. Воспользовавшись справкой команды find, выведите имена всех директорий, имеющихся в вашем домашнем каталоге find -type d -maxdepth 1 (рис. @fig:017 - @fig:018)

![Просмотр справки о команде find](image/img22.png){#fig:019}

![Вывод всех директорий с помощью find](image/img21.png){#fig:020}

# Контрольные вопросы:

1. В системе по умолчанию открыто три специальных потока: 
–stdin − стандартный поток ввода (по умолчанию: клавиатура), файловый дескриптор 0; 
–stdout − стандартный поток вывода (по умолчанию: консоль), файловый дескриптор 1; 
-stderr − стандартный поток вывод сообщений об ошибках (поумолчанию: консоль), файловый дескриптор

2. >’ Перенаправление вывода в файл ‘>>’ Перенаправление вывода в файл и открытие файла в режиме добавления (данные добавляются в конец файла)

3. Конвейер (pipe) служит для объединения простых команд или утилит в цепочки, в которых результат работы предыдущей команды передаётся последующей. Синтаксис следующий: команда1|команда2 (это означает, что вывод команды 1 передастся на ввод команде 2

4. Процесс рассматривается операционной системой как заявка на потребление всех видов ресурсов, кроме одного − процессорного времени. Этот последний важнейший ресурс распределяется операционной системой между другими единицами работы − потоками, которые и получили свое название благодаря тому, что они представляют собой последовательности (потоки выполнения) команд. Процесс − это выполнение программы. Он считается активной сущностью и реализует действия, указанные в программе. Программа представляет собой статический набор команд, а процесс это набор ресурсов и данных, использующихся при выполнении программы. 

5. pid: идентификатор процесса (PID) процесса (processID), к которому вызывают метод gid: идентификатор группы UNIX, в котором работает программа.

6. Любую выполняющуюся в консоли команду или внешнюю программу можно запустить в фоновом режиме. Для этого следует в конце имени команды указать знак амперсанда &. Запущенные фоном программы называются задачами (jobs). Ими можно управлять с помощью команды jobs, которая выводит список запущенных в данный момент задач.

7. Любую выполняющуюся в консоли команду или внешнюю программу можно запустить в фоновом режиме. Для этого следует в конце имени команды указать знак амперсанда &. Запущенные фоном программы называются задачами (jobs). Ими можно управлять с помощью команды jobs, которая выводит список запущенных в данный момент задач.

8. find − это команда для поиска файлов и каталогов на основе специальных условий. (рис. @fig:005) Ее можно использовать в различных обстоятельствах, например, для поиска файлов по разрешениям, владельцам, группам, типу, размеру и другим подобным критериям. Команда find имеет такой синтаксис: find[папка][параметры] критерий шаблон [действие] Папка − каталог в котором будем искать Параметры − дополнительные параметры, например, глубина поиска, и т д. Критерий − по какому критерию будем искать: имя, дата создания, права, владелец и т д. Шаблон – непосредственно значение по которому будем отбирать файлы. Основные параметры: -P никогда не открывать символические ссылки -L - получает информацию о файлах по символическим ссылкам. Важно для дальнейшей обработки, чтобы обрабатывалась не ссылка, а сам файл. -maxdepth - максимальная глубина поиска по подкаталогам,для поиска только в текущем каталоге установите 1. -depth - искать сначала в текущем каталоге, а потом в подкаталогах -mount искать файлы только в этой файловой системе. -version - показать версию утилиты find -print - выводить полные имена файлов -typef - искать только файлы -typed - поиск папки в Linux Основные критерии: -name - поиск файлов по имени -perm - поиск файлов в Linux по режиму доступа -user - поиск файлов по владельцу -group - поиск по группе -mtime - поиск по времени модификации файла -atime - поиск файлов по дате последнего чтения -nogroup - поиск файлов, не принадлежащих ни одной группе -nouser - поиск файлов без владельцев -newer - найти файлы новее чем указанный -size - поиск файлов в Linux по их размеру Примеры: find~ -type d поиск директорий в домашнем каталоге find~ -type f -name ".*" поиск скрытых файлов в домашнем каталоге

9. Файл по его содержимому можно найти с помощью команды grep: «grep -r" слово/выражение, которое нужно найти"». 

10. Утилита df, позволяет проанализировать свободное пространство на всех подключенных к системе разделах.

11. При выполнении команды du (без указания папки и опции) можно получить все файлы и папки текущей директории с их размерами. Для домашнего каталога: du ~/ 

12. C помощью команды kill

# Выводы

В данной лабороторной работе были получены практические навыки работы  с инструментами поиска файлов и фильтрации текстовых данных, по управлению процессами (и заданиями), по проверке использования диска и обслуживанию файловых систем.

