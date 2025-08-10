@echo off
del *.pdf

typst compile main.typ resume-cn.pdf --input level=submit


for %%f in (%files%) do (
  echo Building %%f.typ
  typst compile %%f.typ
  del %%f.typ
)