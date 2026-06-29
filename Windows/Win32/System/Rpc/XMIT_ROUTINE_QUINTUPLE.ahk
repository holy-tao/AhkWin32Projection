#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Rpc
 */
export default struct XMIT_ROUTINE_QUINTUPLE {
    #StructPack 8

    pfnTranslateToXmit : IntPtr

    pfnTranslateFromXmit : IntPtr

    pfnFreeXmit : IntPtr

    pfnFreeInst : IntPtr

}
