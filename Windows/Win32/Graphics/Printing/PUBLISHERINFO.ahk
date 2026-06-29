#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct PUBLISHERINFO {
    #StructPack 4

    dwMode : UInt32

    wMinoutlinePPEM : UInt16

    wMaxbitmapPPEM : UInt16

}
