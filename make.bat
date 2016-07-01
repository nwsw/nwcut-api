cd /d %~dp0
set BASE=%CD%
set LUADOCUMENTOR=d:\bin\luarocks\systree\bin\luadocumentor.bat
set ZIP="C:\Program Files\7-Zip\7z" a -r -tzip

rmdir /S /Q _ldt_ee
rmdir /S /Q _ldt_api

mkdir _ldt_ee
mkdir _ldt_ee\templates
copy nwcut.rockspec _ldt_ee\
xcopy /E /Y /I templates\* _ldt_ee\templates\

call %LUADOCUMENTOR% -f api -d _ldt_api api/*.lua
cd _ldt_api
%ZIP% ../_ldt_ee/api.zip *.*
cd ..

call %LUADOCUMENTOR% -f doc -d _ldt_ee/docs api/*.lua
cd _ldt_ee
%ZIP% ../_nwcut_ldt_ee.zip *
cd %BASE%
pause
