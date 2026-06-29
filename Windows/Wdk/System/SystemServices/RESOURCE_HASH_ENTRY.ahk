#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RESOURCE_HASH_ENTRY {
    #StructPack 8

    ListEntry : IntPtr

    Address : IntPtr

    ContentionCount : UInt32

    Number : UInt32

}
