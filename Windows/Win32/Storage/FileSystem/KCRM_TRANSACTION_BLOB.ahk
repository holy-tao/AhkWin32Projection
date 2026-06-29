#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct KCRM_TRANSACTION_BLOB {
    #StructPack 4

    UOW : Guid

    TmIdentity : Guid

    IsolationLevel : UInt32

    IsolationFlags : UInt32

    Timeout : UInt32

    Description : WCHAR[64]

}
