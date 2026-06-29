#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Kernel\LIST_ENTRY32.ahk" { LIST_ENTRY32 }

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug.Extensions
 */
export default struct DBGKD_DEBUG_DATA_HEADER32 {
    #StructPack 4

    List : LIST_ENTRY32

    OwnerTag : UInt32

    Size : UInt32

}
