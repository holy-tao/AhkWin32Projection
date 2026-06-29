#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KS_BITMAPINFOHEADER {
    #StructPack 4

    biSize : UInt32

    biWidth : Int32

    biHeight : Int32

    biPlanes : UInt16

    biBitCount : UInt16

    biCompression : UInt32

    biSizeImage : UInt32

    biXPelsPerMeter : Int32

    biYPelsPerMeter : Int32

    biClrUsed : UInt32

    biClrImportant : UInt32

}
