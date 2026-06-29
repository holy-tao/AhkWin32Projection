#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TOKEN_BNO_ISOLATION_INFORMATION {
    #StructPack 8

    IsolationPrefix : PWSTR

    IsolationEnabled : BOOLEAN

}
