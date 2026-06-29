#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_DYNAMIC_HASH_TABLE_CONTEXT {
    #StructPack 8

    ChainHead : LIST_ENTRY.Ptr

    PrevLinkage : LIST_ENTRY.Ptr

    Signature : IntPtr

}
