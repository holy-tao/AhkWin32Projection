#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct GENERIC_BINDING_INFO {
    #StructPack 8

    pObj : IntPtr

    Size : UInt32

    pfnBind : IntPtr

    pfnUnbind : IntPtr

}
