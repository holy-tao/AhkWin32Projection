#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectWrite
 */
export default struct DWRITE_BITMAP_DATA_BGRA32 {
    #StructPack 8

    width : UInt32

    height : UInt32

    pixels : IntPtr

}
