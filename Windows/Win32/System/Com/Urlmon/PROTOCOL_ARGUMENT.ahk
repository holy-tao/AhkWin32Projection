#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 */
export default struct PROTOCOL_ARGUMENT {
    #StructPack 8

    szMethod : PWSTR

    szTargetUrl : PWSTR

}
