#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct RTL_DYNAMIC_HASH_TABLE {
    #StructPack 8

    Flags : UInt32

    Shift : UInt32

    TableSize : UInt32

    Pivot : UInt32

    DivisorMask : UInt32

    NumEntries : UInt32

    NonEmptyBuckets : UInt32

    NumEnumerators : UInt32

    Directory : IntPtr

}
