[![en](en.svg)](../README.md)
# "sudo" for Windows

Этот скрипт позволяет удобно запускать другую программу с правами администратора в команндой строке Windows.

Например, так:

```
sudo "D:\Full\Path\To\Program\File" firstArgWithoutWhitespaces "second arg with whitespaces" -thirdArgWithoutWhitespaces fourthArgWithoutWhitespaces
```
или если программа расположена в текущей папке

```
sudo "justProgramFileName" firstArgWithoutWhitespaces "second arg with whitespaces" -thirdArgWithoutWhitespaces fourthArgWithoutWhitespaces
```
К сожалению, после начала применения UAC команда *runas* перестала выполнять эту функцию. Существует много вариаций подобного кода, но все они требуют вставки самого кода в запускаемый файл ([How do you run a command as an administrator from the Windows command line?](https://stackoverflow.com/questions/5944180/how-do-you-run-a-command-as-an-administrator-from-the-windows-command-line), [How can I auto-elevate my batch file, so that it requests from UAC administrator rights if required?](https://stackoverflow.com/questions/7044985/how-can-i-auto-elevate-my-batch-file-so-that-it-requests-from-uac-administrator), [How to request Administrator access inside a batch file](https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file)

## Локальное развертывание

### Предварительные условия

Для работы вам нужен:

* [vbs] Обычно его интерепретаторы (cscript, wscript) уже установлены в ОС Windows


### Установка

```
rem Клонируем репозитарий:
$ git clone https://github.com/JustMisha/sudo_for_windows.git myproject

rem Переходим в папку проекта:
$ cd myproject

rem копируем файл sudo.cmd в папку, которая прописана в переменной PATH
$ copy src/sudo.cmd path/enabled/folder/sudo.cmd

```

## Участие

Пожалуйста, присылайте свои предложения, замечания и pull requests.

## Автор

* **Михаил Трусов** - *sudo_for_windows* - [sudo_for_windows](https://github.com/JustMisha/sudo_for_windows)

См. также [участники](https://github.com/your/project/contributors).

## Лицензия

Данный пакет лицензируется на условиях MIT Лицензии - смотри подробности [LICENSE.md](../LICENSE.md).

