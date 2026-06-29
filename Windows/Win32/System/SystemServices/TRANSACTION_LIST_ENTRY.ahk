#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TRANSACTION_LIST_ENTRY {
    #StructPack 4

    UOW : Guid

}
