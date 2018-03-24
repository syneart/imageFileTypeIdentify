# imageFileTypeIdentify
Identifying Image Format from the First Few "Magic" Bytes in C and with Script

#### Download Latest File [MacOS, Linux and Windows]
https://github.com/syneart/imageFileTypeIdentify/releases/latest
<br />

## Only Identify Image Format

### In Windows

You can use Windows command line (a.k.a. cmd) , and type (change directory to batch file location)

`./imageFileTypeIdentify.exe "<image or folder>"`

for example,

`./imageFileTypeIdentify.exe "example.png"`<br />
`./imageFileTypeIdentify.exe "C:\example_folder"`

### In Unix (Script include MacOS, BUT need difference C release build)

You can use Terminal , and type (change directory to bash file location)

`$ ./imageFileTypeIdentify "<image or folder>"`

for example,

`$ ./imageFileTypeIdentify "example.png"`<br />
`$ ./imageFileTypeIdentify "~/example_folder"`
<br /><br />


## Auto identifying Image Format and rename File Extension.

### In Windows

Drag & down your file or folder to the run.bat file.

or 

You can use Windows command line (a.k.a. cmd) , and type (change directory to batch file location)

`./run.bat "<image or folder>"`

for example,

`./run.bat "example.png"`<br />
`./run.bat "C:\example_folder"`

### In Unix (Script include MacOS, BUT need difference C release build)

You can use Terminal , and type (change directory to bash file location)

`$ bash ./run.sh "<image or folder>"`

for example,

`$ bash ./run.sh "example.png"`<br />
`$ bash ./run.sh "~/example_folder"`

## License

This program released under [MIT License](LICENSE).
