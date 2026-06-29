#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_PIPE_FORMAT {
    #StructPack 8

    FormatCode : Int8

    Flags : Int8

    Alignment : Int8

    Reserved : Int8

    Type : IntPtr

    MemorySize : UInt32

    BufferSize : UInt32

}
