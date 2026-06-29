#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_ENCAPSULATED_UNION {
    #StructPack 4

    FormatCode : Int8

    Alignment : Int8

    Flags : Int8

    SwitchType : Int8

    MemoryOffset : UInt32

    MemorySize : UInt32

    Reserved : UInt32

}
