#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_IID_FORMAT {
    #StructPack 8

    FormatCode : Int8

    Flags : Int8

    Reserved : UInt16

    IIDDescriptor : IntPtr

}
