#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct NDR64_TYPE_STRICT_CONTEXT_HANDLE {
    #StructPack 8

    FormatCode : Int8

    RealFormatCode : Int8

    Reserved : UInt16

    Type : IntPtr

    CtxtFlags : UInt32

    CtxtID : UInt32

}
