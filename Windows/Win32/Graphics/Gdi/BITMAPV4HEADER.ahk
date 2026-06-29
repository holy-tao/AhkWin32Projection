#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BI_COMPRESSION.ahk" { BI_COMPRESSION }
#Import ".\CIEXYZ.ahk" { CIEXYZ }
#Import ".\CIEXYZTRIPLE.ahk" { CIEXYZTRIPLE }

/**
 * The BITMAPV4HEADER structure is the bitmap information header file. It is an extended version of the BITMAPINFOHEADER structure.Applications can use the BITMAPV5HEADER structure for added functionality.
 * @remarks
 * The <b>BITMAPV4HEADER</b> structure is extended to allow a JPEG or PNG image to be passed as the source image to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-stretchdibits">StretchDIBits</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmapv4header
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct BITMAPV4HEADER {
    #StructPack 4

    /**
     * The number of bytes required by the structure. Applications should use this member to determine which bitmap information header structure is being used.
     */
    bV4Size : UInt32

    /**
     * The width of the bitmap, in pixels.
     * 
     *  If <b>bV4Compression</b> is BI_JPEG or BI_PNG, <b>bV4Width</b> specifies the width of the JPEG or PNG image in pixels.
     */
    bV4Width : Int32

    /**
     * The height of the bitmap, in pixels. If <b>bV4Height</b> is positive, the bitmap is a bottom-up DIB and its origin is the lower-left corner. If <b>bV4Height</b> is negative, the bitmap is a top-down DIB and its origin is the upper-left corner.
     * 
     * If <b>bV4Height</b> is negative, indicating a top-down DIB, <b>bV4Compression</b> must be either BI_RGB or BI_BITFIELDS. Top-down DIBs cannot be compressed.
     * 
     *  If <b>bV4Compression</b> is BI_JPEG or BI_PNG, <b>bV4Height</b> specifies the height of the JPEG or PNG image in pixels.
     */
    bV4Height : Int32

    /**
     * The number of planes for the target device. This value must be set to 1.
     */
    bV4Planes : UInt16

    bV4BitCount : UInt16

    bV4V4Compression : BI_COMPRESSION

    /**
     * The size, in bytes, of the image. This may be set to zero for BI_RGB bitmaps.
     * 
     *  If <b>bV4Compression</b> is BI_JPEG or BI_PNG, <b>bV4SizeImage</b> is the size of the JPEG or PNG image buffer.
     */
    bV4SizeImage : UInt32

    /**
     * The horizontal resolution, in pixels-per-meter, of the target device for the bitmap. An application can use this value to select a bitmap from a resource group that best matches the characteristics of the current device.
     */
    bV4XPelsPerMeter : Int32

    /**
     * The vertical resolution, in pixels-per-meter, of the target device for the bitmap.
     */
    bV4YPelsPerMeter : Int32

    /**
     * The number of color indexes in the color table that are actually used by the bitmap. If this value is zero, the bitmap uses the maximum number of colors corresponding to the value of the <b>bV4BitCount</b> member for the compression mode specified by <b>bV4Compression</b>.
     * 
     * If <b>bV4ClrUsed</b> is nonzero and the <b>bV4BitCount</b> member is less than 16, the <b>bV4ClrUsed</b> member specifies the actual number of colors the graphics engine or device driver accesses. If <b>bV4BitCount</b> is 16 or greater, the <b>bV4ClrUsed</b> member specifies the size of the color table used to optimize performance of the system color palettes. If <b>bV4BitCount</b> equals 16 or 32, the optimal color palette starts immediately following the <b>BITMAPV4HEADER</b>.
     */
    bV4ClrUsed : UInt32

    /**
     * The number of color indexes that are required for displaying the bitmap. If this value is zero, all colors are important.
     */
    bV4ClrImportant : UInt32

    /**
     * Color mask that specifies the red component of each pixel, valid only if <b>bV4Compression</b> is set to BI_BITFIELDS.
     */
    bV4RedMask : UInt32

    /**
     * Color mask that specifies the green component of each pixel, valid only if <b>bV4Compression</b> is set to BI_BITFIELDS.
     */
    bV4GreenMask : UInt32

    /**
     * Color mask that specifies the blue component of each pixel, valid only if <b>bV4Compression</b> is set to BI_BITFIELDS.
     */
    bV4BlueMask : UInt32

    /**
     * Color mask that specifies the alpha component of each pixel.
     */
    bV4AlphaMask : UInt32

    /**
     * The color space of the DIB. The following table lists the value for <b>bV4CSType</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>LCS_CALIBRATED_RGB</td>
     * <td>This value indicates that endpoints and gamma values are given in the appropriate fields.</td>
     * </tr>
     * </table>
     *  
     * 
     * See the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> structure for information that defines a logical color space.
     */
    bV4CSType : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-ciexyztriple">CIEXYZTRIPLE</a> structure that specifies the x, y, and z coordinates of the three colors that correspond to the red, green, and blue endpoints for the logical color space associated with the bitmap. This member is ignored unless the <b>bV4CSType</b> member specifies LCS_CALIBRATED_RGB.
     * 
     * <div class="alert"><b>Note</b>  A <i>color space</i> is a model for representing color numerically in terms of three or more coordinates. For example, the RGB color space represents colors in terms of the red, green, and blue coordinates.</div>
     * <div> </div>
     */
    bV4Endpoints : CIEXYZTRIPLE

    /**
     * Tone response curve for red. This member is ignored unless color values are calibrated RGB values and <b>bV4CSType</b> is set to LCS_CALIBRATED_RGB. Specify in unsigned fixed 16.16 format. The upper 16 bits are the unsigned integer value. The lower 16 bits are the fractional part.
     */
    bV4GammaRed : UInt32

    /**
     * Tone response curve for green. Used if <b>bV4CSType</b> is set to LCS_CALIBRATED_RGB. Specify in unsigned fixed 16.16 format. The upper 16 bits are the unsigned integer value. The lower 16 bits are the fractional part.
     */
    bV4GammaGreen : UInt32

    /**
     * Tone response curve for blue. Used if <b>bV4CSType</b> is set to LCS_CALIBRATED_RGB. Specify in unsigned fixed 16.16 format. The upper 16 bits are the unsigned integer value. The lower 16 bits are the fractional part.
     */
    bV4GammaBlue : UInt32

}
