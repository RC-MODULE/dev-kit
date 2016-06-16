#dev-pack

Онлайн загрузчик средств разработки NMC/ARM/x86 приложений под ОС Windows. 
Загрузчик позволяет загрузить и установить последние актуальные версии средств разработки ПО для вычислительный модулей: МВ77.07, МЦ51.03, МЦ76.01

##Комплект инструментов для разработки NeuroMatrix приложений:  
- nmsdk . NeuroMatrix SDK  для процессоров на базе ядра nmc и nmc3 (NM6403,NM6405, NM6406)
- mb7707sdk  - комплект поддержки вычислительного модуля МВ77.07  
- mc5103sdk  - комплект поддержки вычислительного модуля МЦ51.03  
- mc7601sdk  - комплект поддержки вычислительного модуля МЦ76.01  
- nm_io - библиотека поддержки printf для модуля МЦ51.03
- nmcalculator  - интерактивный помощник при разработке программного обеспечения для процессора NeuroMatrix
- nmc-utils  - поддержка для модуля МВ77.07 [libeasynmc and userspace Neuromatrix DSP tools](https://github.com/RC-MODULE/nmc-utils)  
- edcltool-win32 -  поддержка для модуля МВ77.07 . Инструмент для написания edcl сценариев на языке lua.  

##Комплект инструментов для разработки x86-приложений:
- VSHELL32 -  Графическая библиотека для обработки и вывода изображений. 

##Комплект инструментов для разработки ARM-приложений:
- rootfs - корневая папка файловой системы для кросс-компиляции ARM-приложений для модуля МВ77.07
- gcc-linaro - toolchain для ARM


#Зависимости
  Для запуска загрузчика необходимы установленные gnuwin32 утилиты https://github.com/RC-MODULE/gnuwin32-lite
  

# Установка 
1.Скачать данный проект или архив https://github.com/RC-MODULE/dev-pack/archive/master.zip  
2.Распаковать перейти в dev-pack   
3.скачать необходимые пакеты:   (установить переменные http_proxy и https_proxy если используется прокси)

```bat
С:\dev-pack-master> set  http_proxy=http://username:password@proxy:80/
С:\dev-pack-master> set https_proxy=http://username:password@proxy:80/

С:\dev-pack-master> make download-nmc (скачать только nmc инструменты)  
С:\dev-pack-master> make download-arm (скачать только arm инструменты)  
С:\dev-pack-master> make download  (скачать arm + nmc инструменты)  
```   

4.Уставить необходимые пакеты:    
```bat
С:\dev-pack-master> make install-nmc (установить только nmc инструменты)  
С:\dev-pack-master> make install-arm (установить только arm инструменты)  
С:\dev-pack-master> make install     (установить arm + nmc инструменты)  
```   

5.Установить переменную окружения DEVPACK (для текущего пользователя)
```bat
С:\dev-pack-master> set-devpack.bat
```	

6.Установить  переменную окружения NEURO  (для текущего пользователя)
```bat
С:\dev-pack-master> set-neuro.bat
```	

Добавление необходимых путей (%NEURO%\bin) в переменную PATН осуществляется самостоятельно. 

  