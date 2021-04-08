# JSCompiler
A minicompiler to compile the switch statement in JavaScript

## Installations
Use the Advanced Package Tool to install Flex and YACC

```bash
sudo apt-get update

sudo apt-get install flex

sudo apt-get install bison
```
##Compile and Run Program

```bash
flex -l flexfile.l

bison -ldv bison.y

gcc bison.tab.c lex.yy.c -lfl
```
##Execution
Copy paste the switch statement on the terminal for syntax and semantic analysis. Errors are displayed accordingly.
If no errors present, consider code snippet to have perfect switch statement syntax

## License
[MIT](https://choosealicense.com/licenses/mit/)
