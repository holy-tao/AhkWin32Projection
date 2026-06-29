#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * @namespace Windows.Win32.NetworkManagement.NetShell
 */
export default struct TOKEN_VALUE {
    #StructPack 8

    pwszToken : PWSTR

    dwValue : UInt32

}
