#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_REPORT_PARAMETER {
    #StructPack 2

    Name : WCHAR[129]

    Value : WCHAR[260]

}
