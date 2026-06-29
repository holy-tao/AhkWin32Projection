#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDVERSIONDATA {
    #StructPack 8

    dwHALVersion : UInt32

    dwReserved1 : IntPtr

    dwReserved2 : IntPtr

}
