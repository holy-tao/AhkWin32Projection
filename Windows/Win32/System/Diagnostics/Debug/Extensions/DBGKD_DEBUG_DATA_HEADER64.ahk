#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Kernel\LIST_ENTRY64.ahk" { LIST_ENTRY64 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DBGKD_DEBUG_DATA_HEADER64 {
    #StructPack 8

    List : LIST_ENTRY64

    OwnerTag : UInt32

    Size : UInt32

}
