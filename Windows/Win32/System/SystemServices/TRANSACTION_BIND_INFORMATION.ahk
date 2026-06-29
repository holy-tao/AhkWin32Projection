#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTION_BIND_INFORMATION {
    #StructPack 8

    TmHandle : HANDLE

}
