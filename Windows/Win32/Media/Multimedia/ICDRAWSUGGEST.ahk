#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\HIC.ahk" { HIC }
#Import "..\..\Graphics\Gdi\BITMAPINFOHEADER.ahk" { BITMAPINFOHEADER }

/**
 * The ICDRAWSUGGEST structure contains compression parameters used with the ICM_DRAW_SUGGESTFORMAT message to suggest an appropriate input format.
 * @see https://learn.microsoft.com/windows/win32/api/vfw/ns-vfw-icdrawsuggest
 * @namespace Windows.Win32.Media.Multimedia
 */
export default struct ICDRAWSUGGEST {
    #StructPack 8

    /**
     * Pointer to the structure containing the compressed input format.
     */
    lpbiIn : BITMAPINFOHEADER.Ptr

    /**
     * Pointer to a buffer to return a compatible input format for the renderer.
     */
    lpbiSuggest : BITMAPINFOHEADER.Ptr

    /**
     * Width of the source rectangle.
     */
    dxSrc : Int32

    /**
     * Height of the source rectangle.
     */
    dySrc : Int32

    /**
     * Width of the destination rectangle.
     */
    dxDst : Int32

    /**
     * Height of the destination rectangle.
     */
    dyDst : Int32

    /**
     * Handle to a decompressor that supports the format of data described in <b>lpbiIn</b>.
     */
    hicDecompressor : HIC

}
