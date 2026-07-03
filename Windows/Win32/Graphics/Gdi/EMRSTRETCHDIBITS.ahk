#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\RECTL.ahk" { RECTL }
#Import ".\EMR.ahk" { EMR }
#Import ".\ENHANCED_METAFILE_RECORD_TYPE.ahk" { ENHANCED_METAFILE_RECORD_TYPE }

/**
 * The EMRSTRETCHDIBITS structure contains members for the StretchDIBits enhanced metafile record.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-emrstretchdibits
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct EMRSTRETCHDIBITS {
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
     * Logical x-coordinate of the upper-left corner of the destination rectangle.
     */
    xDest : Int32

    /**
     * Logical y-coordinate of the upper-left corner of the destination rectangle.
     */
    yDest : Int32

    /**
     * Logical x-coordinate of the upper-left corner of the source rectangle.
     */
    xSrc : Int32

    /**
     * Logical y-coordinate of the upper-left corner of the source rectangle.
     */
    ySrc : Int32

    /**
     * Width of the source rectangle, in logical units.
     */
    cxSrc : Int32

    /**
     * Height of the source rectangle, in logical units.
     */
    cySrc : Int32

    /**
     * Offset to the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
     */
    offBmiSrc : UInt32

    /**
     * Size of the source <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure.
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
     * Value of the <b>bmiColors</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure. The <b>iUsageSrc</b> member can be either the DIB_PAL_COLORS or DIB_RGB_COLORS value.
     */
    iUsageSrc : UInt32

    /**
     * Raster-operation code. These codes define how the color data of the source rectangle is to be combined with the color data of the destination rectangle to achieve the final color.
     */
    dwRop : UInt32

    /**
     * Logical width of the destination rectangle.
     */
    cxDest : Int32

    /**
     * Logical height of the destination rectangle.
     */
    cyDest : Int32

}
