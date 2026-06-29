#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_BUFFER_ALIGN_FORMAT {
    #StructPack 4

    FormatCode : Int8

    Alignment : Int8

    Reserved : UInt16

    Reserved2 : UInt32

}
