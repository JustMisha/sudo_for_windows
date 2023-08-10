[![ru](docs/ru.svg)](docs/README.ru.md)
## "sudo" for Windows

This script allows you to conveniently run another program with administrator rights in the Windows command line.

```
sudo "D:\Full\Path\To\Program\File" firstArgWithoutWhitespaces "second arg with whitespaces" -thirdArgWithoutWhitespaces fourthArgWithoutWhitespaces
```
or if the program is located in the current folder

```
sudo "justProgramFileName" firstArgWithoutWhitespaces "second arg with whitespaces" -thirdArgWithoutWhitespaces fourthArgWithoutWhitespaces
```
Unfortunately, after the start of UAC, the *runas* command stopped performing this function. There are many variations of this kind of code, but they all require inserting the code itself into the file you are running ([How do you run a command as an administrator from the Windows command line?](https://stackoverflow.com/questions/5944180/how-do-you-run-a-command-as-an-administrator-from-the-windows-command-line), [How can I auto-elevate my batch file, so that it requests from UAC administrator rights if required?](https://stackoverflow.com/questions/7044985/how-can-i-auto-elevate-my-batch-file-so-that-it-requests-from-uac-administrator), [How to request Administrator access inside a batch file](https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file)

## Getting Started

### Prerequisites

* [vbs] Usually its interpreters (cscript, wscript) are already installed in the Windows OS


### Installing

```
rem Clone the repository:
$ git clone https://github.com/JustMisha/sudo_for_windows.git myproject

rem go to the project folder:
$ cd myproject

rem copy the sudo.cmd file to the folder specified in the PATH variable
$ copy src/sudo.cmd path/enabled/folder/sudo.cmd

```

## Contributing

Please send your suggestions, comments, and pull requests.

## Authors

* **Mikhail Trusov** - *sudo_for_windows* - [sudo_for_windows](https://github.com/JustMisha/sudo_for_windows)

See also the list of [участники](https://github.com/your/project/contributors).

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

