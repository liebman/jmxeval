@echo off
::
:: JMXEval execution script
::
:: Syntax: check_jmxeval.bat <config-xml-file> [<options>]
::
:: If JAVA_HOME environment variable is not set, uncomment the following
:: line and set the value as the path to root of the Java directory 
::
:: JAVA_HOME="C:\path\to\jdk-1.5.0"
::
:: Executes JMXEval
::
set BASE_DIR=%~dp0
set LIB_DIR=%BASE_DIR%lib

REM needed to overcome weird loop behavior
REM in conjunction with variable expansion
SETLOCAL enabledelayedexpansion

REM construct classpath of seperate jars
SET cp=%BASE_DIR%jmxeval-1.2.5.jar;

FOR %%F IN (%LIB_DIR%\*.jar) DO (
  SET cp=!cp!;%%F%
)

%JAVA_HOME%\bin\java -classpath %cp% com.adahas.tools.jmxeval.App %*
