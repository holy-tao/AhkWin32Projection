#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DDNT_GETEXTENDEDMODECOUNTDATA {
    #StructPack 8

    gdi2 : IntPtr

    dwModeCount : UInt32

    dwReserved : UInt32

}
