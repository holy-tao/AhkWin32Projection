#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\XFORM.ahk" { XFORM }
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRPLGBLT structure contains members for the PlgBlt enhanced metafile record. Note that graphics device interface (GDI) converts the device-dependent bitmap into a device-independent bitmap (DIB) before storing it in the metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrplgblt
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRPLGBLT {
    #StructPack 4

    /**
     * The base structure for all record types.
     */
    emr : EMR

    /**
     * Bounding rectangle, in device units.
     */
    rclBounds : RECTL

    /**
     * Array of three points in logical space that identify three corners of the destination parallelogram. The upper-left corner of the source rectangle is mapped to the first point in this array, the upper-right corner to the second point in this array, and the lower-left corner to the third point. The lower-right corner of the source rectangle is mapped to the implicit fourth point in the parallelogram.
     */
    aptlDest : POINTL[3]

    /**
     * Logical x-coordinate of the upper-left corner of the source rectangle.
     */
    xSrc : Int32

    /**
     * Logical y-coordinate of the upper-left corner of the source rectangle.
     */
    ySrc : Int32

    /**
     * Logical width of the source.
     */
    cxSrc : Int32

    /**
     * Logical height of the source.
     */
    cySrc : Int32

    /**
     * World-space to page-space transformation of the source device context.
     */
    xformSrc : XFORM

    /**
     * Background color (the RGB value) of the source device context. To make a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value, use the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-rgb">RGB</a> macro.
     */
    crBkColorSrc : COLORREF

    /**
     * Value of the <b>bmiColors</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure. The <b>iUsageSrc</b> member can be either the DIB_PAL_COLORS or DIB_RGB_COLORS value.
     */
    iUsageSrc : UInt32

    /**
     * Offset to source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     */
    offBmiSrc : UInt32

    /**
     * Size of source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     */
    cbBmiSrc : UInt32

    /**
     * Offset to source bitmap bits.
     */
    offBitsSrc : UInt32

    /**
     * Size of source bitmap bits.
     */
    cbBitsSrc : UInt32

    /**
     * Horizontal pixel offset into mask bitmap.
     */
    xMask : Int32

    /**
     * Vertical pixel offset into mask bitmap.
     */
    yMask : Int32

    /**
     * Value of the <b>bmiColors</b> member of the mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     */
    iUsageMask : UInt32

    /**
     * Offset to mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     */
    offBmiMask : UInt32

    /**
     * Size of mask <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     */
    cbBmiMask : UInt32

    /**
     * Offset to mask bitmap bits.
     */
    offBitsMask : UInt32

    /**
     * Size of mask bitmap bits.
     */
    cbBitsMask : UInt32

}
