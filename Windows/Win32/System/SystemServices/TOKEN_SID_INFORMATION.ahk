#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Security\PSID.ahk" { PSID }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TOKEN_SID_INFORMATION {
    #StructPack 8

    Sid : PSID

}
