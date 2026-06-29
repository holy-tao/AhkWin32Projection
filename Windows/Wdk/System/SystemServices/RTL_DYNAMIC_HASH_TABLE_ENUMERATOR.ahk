#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\System\Kernel\LIST_ENTRY.ahk" { LIST_ENTRY }

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_DYNAMIC_HASH_TABLE_ENUMERATOR {
    #StructPack 8

    HashEntry : IntPtr

    ChainHead : LIST_ENTRY.Ptr

    BucketIndex : UInt32

    static __New() {
        DefineProp(this.Prototype, 'CurEntry', { type: LIST_ENTRY.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }
}
