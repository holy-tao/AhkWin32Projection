#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASCUSTOMSCRIPTEXTENSIONS {
    #StructPack 8

    dwSize : UInt32

    pfnRasSetCommSettings : IntPtr

}
