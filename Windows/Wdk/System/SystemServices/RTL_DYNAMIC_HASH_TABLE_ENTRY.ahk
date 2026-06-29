#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_DYNAMIC_HASH_TABLE_ENTRY {
    #StructPack 8

    Linkage : IntPtr

    Signature : IntPtr

}
