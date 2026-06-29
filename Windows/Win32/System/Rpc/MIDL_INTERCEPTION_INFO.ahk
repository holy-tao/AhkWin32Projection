#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_INTERCEPTION_INFO {
    #StructPack 8

    Version : UInt32

    ProcString : IntPtr

    ProcFormatOffsetTable : IntPtr

    ProcCount : UInt32

    TypeString : IntPtr

}
