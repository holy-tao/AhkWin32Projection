#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Security.WinTrust
 */
export default struct INTENT_TO_SEAL_ATTRIBUTE {
    #StructPack 4

    version : UInt32

    seal : BOOLEAN

}
