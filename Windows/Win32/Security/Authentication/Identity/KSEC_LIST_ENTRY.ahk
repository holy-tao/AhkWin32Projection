#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Win32.Security.Authentication.Identity
 */
export default struct KSEC_LIST_ENTRY {
    #StructPack 8

    List : LIST_ENTRY

    RefCount : Int32

    Signature : UInt32

    OwningList : IntPtr

    Reserved : IntPtr

}
