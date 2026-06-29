#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import ".\CKCL_DATA.ahk" { CKCL_DATA }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct CKCL_LISTHEAD {
    #StructPack 8

    LogEventListHead : CKCL_DATA.Ptr

    Heap : HANDLE

}
