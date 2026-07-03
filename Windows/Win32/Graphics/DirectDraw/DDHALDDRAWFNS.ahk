#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHALDDRAWFNS {
    #StructPack 8

    dwSize : UInt32

    lpSetInfo : IntPtr

    lpVidMemAlloc : IntPtr

    lpVidMemFree : IntPtr

}
