@cd codemaps
@	del ram0.o
@cd ..

zx0 -f zzSong.mus zzsong.zx0
@ rem new

@rem this creates an object file
zcc +zx -vn -SO3 -c -clib=new -pragma-include:zpragma.inc -o RAM0.o --fsigned-char @ram0.lst

@if not exist "RAM0.o" (
call error.bat
)

@copy "ram0.o" "..\"
@move "ram0.o" "codemaps\"

@REM Cleanup
@del zcc_opt.def

REM a nice map view
@cd codemaps
	@REM all these objects match up
	z80nm ram0.o
	z80nm ram0.o > ram0.txt
	@copy "ram0.txt" "..\"
	@echo off
@cd ..

del zzsong.zx0

@call beep.bat

