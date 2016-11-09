#[dev-kit](https://github.com/RC-MODULE/dev-kit)

Онлайн загрузчик средств разработки NMC/ARM/x86 приложений под ОС Windows. 
Загрузчик позволяет загрузить и установить последние актуальные версии средств разработки ПО для вычислительный модулей: МВ77.07, МЦ51.03, МЦ76.01

##Комплект инструментов для разработки NeuroMatrix приложений:  
- nmsdk - NeuroMatrix SDK  для процессоров на базе ядра nmc и nmc3 (NM6403,NM6405, NM6406)
- vcredist_x86.exe - [Microsoft Visual C++ 2005 SP1 Redistributable Package (x86)](https://www.microsoft.com/en-us/download/details.aspx?id=5638) (требуется для работы NMSDK)
- mb7707sdk  - комплект поддержки вычислительного модуля МВ77.07  
- mc5103sdk  - комплект поддержки вычислительного модуля МЦ51.03  
- mc7601sdk  - комплект поддержки вычислительного модуля МЦ76.01  
- mc12101sdk - комплект поддержки вычислительного модуля МЦ121.01  
- nm_io - библиотека поддержки printf для модуля МЦ51.03
- nmcalculator  - интерактивный помощник при разработке программного обеспечения для процессора NeuroMatrix
- nmc-utils  - поддержка для модуля МВ77.07 [libeasynmc and userspace Neuromatrix DSP tools](https://github.com/RC-MODULE/nmc-utils)  
- edcltool-win32 -  поддержка для модуля МВ77.07 . Инструмент для написания edcl сценариев на языке lua.  

##Комплект инструментов для разработки x86-приложений:
- VSHELL32 -  Графическая библиотека для обработки и вывода изображений. 

##Комплект инструментов для разработки ARM-приложений:
- rootfs - корневая папка файловой системы для кросс-компиляции ARM-приложений для модуля МВ77.07
- i686-w64-mingw32 - toolchain для ARM


#Зависимости
  Для запуска загрузчика необходимы установленные gnuwin32 утилиты https://github.com/RC-MODULE/gnuwin32-lite
  

# Установка 
1.Скачать данный проект или архив https://github.com/RC-MODULE/dev-kit/archive/master.zip  
2.Распаковать и в консольном окне перейти в dev-kit-master  
3.Cкачать необходимые пакеты:   (установить переменные http_proxy и https_proxy если используется прокси-сервер)

```bat
С:\dev-kit-master> set  http_proxy=http://username:password@proxy:80/
С:\dev-kit-master> set https_proxy=http://username:password@proxy:80/

С:\dev-kit-master> make download-nmc (скачать только nmc инструменты)  
С:\dev-kit-master> make download-arm (скачать только arm инструменты)  
С:\dev-kit-master> make download     (скачать arm + nmc инструменты)  
```   

4.Уставить необходимые пакеты:    
```
С:\dev-kit-master> make install-nmc (установить только NMSDK +nmclaculator+asm-highleighter )  
С:\dev-kit-master> make install-mb7707sdk  (установить ПО поддержки модуля МВ77.07 ) 
С:\dev-kit-master> make install-mc5103sdk  (установить ПО поддержки модуля МЦ51.03 )
С:\dev-kit-master> make install-mc7601sdk  (установить ПО поддержки модуля МЦ76.01 )
С:\dev-kit-master> make install-mc12101sdk (установить ПО поддержки модуля МЦ121.01)
С:\dev-kit-master> make install-brd (установить ПО подддержки всех плат )
С:\dev-kit-master> make install-arm (установить только arm инструменты)  
С:\dev-kit-master> make install     (установить arm + nmc инструменты)  
```   

Выполнение ``` make install-XXXX```   модифицирует переменную **PATH** и создает переменные окружения MC5103,MC7601,MB7707,MB7707MAC,MC12101 ...

<!-- > Для установки переменной требутся setx утилита. Windows XP не содержит setx. Необходимо установить [Windows Support Tools for Microsoft Windows XP](https://www.microsoft.com/en-us/download/details.aspx?id=18546) 
6.Установить  переменную окружения NEURO  (для текущего пользователя)
```bat
С:\dev-kit-master> set-neuro.bat


5.Установить переменную окружения DEVPACK (для текущего пользователя)
```bat
С:\dev-kit-master> set-devkit.bat
```	
```	

Добавление необходимых путей (%NEURO%\bin) в переменную PATН осуществляется самостоятельно. 
-->


  