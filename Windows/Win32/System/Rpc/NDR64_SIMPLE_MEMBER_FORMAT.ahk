#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_SIMPLE_MEMBER_FORMAT {
    #StructPack 4

    FormatCode : Int8

    Reserved1 : Int8

    Reserved2 : UInt16

    Reserved3 : UInt32

}
