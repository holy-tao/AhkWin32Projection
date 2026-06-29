#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct KTRIAGE_DUMP_DATA_ARRAY {
    #StructPack 8

    List : IntPtr

    NumBlocksUsed : UInt32

    NumBlocksTotal : UInt32

    DataSize : UInt32

    MaxDataSize : UInt32

    ComponentNameBufferLength : UInt32

    ComponentName : IntPtr

    Blocks : IntPtr[1]

}
