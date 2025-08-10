@echo off
del *.pdf

set files=resume-cn,resume,resume-elab
echo Generating...

for %%f in (%files%) do (
  (
    echo #import "main.typ": *;
    echo #show: chicv
  ) > %%f.typ
)
typst compile main.typ roife-resume-cn.pdf --input level=submit


for %%f in (%files%) do (
  echo Building %%f.typ
  typst compile %%f.typ
  del %%f.typ
)
