#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_EMBEDDED_COMPLEX_FORMAT {
    #StructPack 8

    FormatCode : Int8

    Reserve1 : Int8

    Reserve2 : UInt16

    Type : IntPtr

}
