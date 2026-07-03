#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.Media.DirectShow
 */
export default struct REGFILTER {
    #StructPack 8

    Clsid : Guid

    Name : PWSTR

}
