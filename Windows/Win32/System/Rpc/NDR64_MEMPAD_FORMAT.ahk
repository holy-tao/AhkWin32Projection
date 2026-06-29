#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_MEMPAD_FORMAT {
    #StructPack 4

    FormatCode : Int8

    Reserve1 : Int8

    MemPad : UInt16

    Reserved2 : UInt32

}
