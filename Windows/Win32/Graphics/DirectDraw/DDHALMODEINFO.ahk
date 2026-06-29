#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHALMODEINFO {
    #StructPack 4

    dwWidth : UInt32

    dwHeight : UInt32

    lPitch : Int32

    dwBPP : UInt32

    wFlags : UInt16

    wRefreshRate : UInt16

    dwRBitMask : UInt32

    dwGBitMask : UInt32

    dwBBitMask : UInt32

    dwAlphaBitMask : UInt32

}
