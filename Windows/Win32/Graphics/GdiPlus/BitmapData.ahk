#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct BitmapData {
    #StructPack 8

    Width : UInt32

    Height : UInt32

    Stride : Int32

    PixelFormat : Int32

    Scan0 : IntPtr

    Reserved : IntPtr

}
