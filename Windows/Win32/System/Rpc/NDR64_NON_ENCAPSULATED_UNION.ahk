#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_NON_ENCAPSULATED_UNION {
    #StructPack 8

    FormatCode : Int8

    Alignment : Int8

    Flags : Int8

    SwitchType : Int8

    MemorySize : UInt32

    Switch : IntPtr

    Reserved : UInt32

}
