#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TOKEN_BNO_ISOLATION_INFORMATION {
    #StructPack 8

    IsolationPrefix : PWSTR

    IsolationEnabled : BOOLEAN

}
