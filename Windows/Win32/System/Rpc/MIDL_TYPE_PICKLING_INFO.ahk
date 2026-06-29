#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct MIDL_TYPE_PICKLING_INFO {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    Reserved : IntPtr[3]

}
