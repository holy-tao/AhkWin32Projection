#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct DD_GETEXTENDEDMODEDATA {
    #StructPack 8

    gdi2 : IntPtr

    dwModeIndex : UInt32

    mode : IntPtr

}
