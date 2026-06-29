#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XFORM.ahk" { XFORM }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRTRANSPARENTBLT structure contains members for the TransparentBLT enhanced metafile record.
 * @remarks
 * This structure is to be used during metafile playback.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrtransparentblt
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRTRANSPARENTBLT {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Inclusive bounds, in device units.
     */
    rclBounds : RECTL

    /**
     * Logical x coordinate of the upper-left corner of the destination rectangle.
     */
    xDest : Int32

    /**
     * Logical y coordinate of the upper-left corner of the destination rectangle.
     */
    yDest : Int32

    /**
     * Logical width of the destination rectangle.
     */
    cxDest : Int32

    /**
     * Logical height of the destination rectangle.
     */
    cyDest : Int32

    /**
     * Stores the transparent color.
     */
    dwRop : UInt32

    /**
     * Logical x coordinate of the upper-left corner of the source rectangle.
     */
    xSrc : Int32

    /**
     * Logical y coordinate of the upper-left corner of the source rectangle.
     */
    ySrc : Int32

    /**
     * World-space to page-space transformation of the source device context.
     */
    xformSrc : XFORM

    /**
     * Background color (the RGB value) of the source device context. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     */
    crBkColorSrc : COLORREF

    /**
     * Source bitmap information color table usage (DIB_RGB_COLORS).
     */
    iUsageSrc : UInt32

    /**
     * Offset to the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     */
    offBmiSrc : UInt32

    /**
     * Size of the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     */
    cbBmiSrc : UInt32

    /**
     * Offset to the source bitmap bits.
     */
    offBitsSrc : UInt32

    /**
     * Size of the source bitmap bits.
     */
    cbBitsSrc : UInt32

    /**
     * Width of the source rectangle, in logical units.
     */
    cxSrc : Int32

    /**
     * Height of the source rectangle, in logical units.
     */
    cySrc : Int32

}
