#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\BI_COMPRESSION.ahk" { BI_COMPRESSION }
#Import ".\CIEXYZ.ahk" { CIEXYZ }
#Import ".\CIEXYZTRIPLE.ahk" { CIEXYZTRIPLE }

/**
 * The BITMAPV5HEADER structure is the bitmap information header file. It is an extended version of the BITMAPINFOHEADER structure.
 * @remarks
 * If <b>bV5Height</b> is negative, indicating a top-down DIB, <b>bV5Compression</b> must be either BI_RGB or BI_BITFIELDS. Top-down DIBs cannot be compressed.
 * 
 * The Independent Color Management interface (ICM) 2.0 allows International Color Consortium (ICC) color profiles to be linked or embedded in DIBs (DIBs). See <a href="https://docs.microsoft.com/windows/win32/wcs/using-structures-in-wcs-1-0">Using Structures</a> for more information.
 * 
 * When a DIB is loaded into memory, the profile data (if present) should follow the color table, and the <b>bV5ProfileData</b> should provide the offset of the profile data from the beginning of the <b>BITMAPV5HEADER</b> structure. The value stored in <b>bV5ProfileData</b> will be different from the value returned by the <b>sizeof</b> operator given the <b>BITMAPV5HEADER</b> argument, because <b>bV5ProfileData</b> is the offset in bytes from the beginning of the <b>BITMAPV5HEADER</b> structure to the start of the profile data. (Bitmap bits do not follow the color table in memory). Applications should modify the <b>bV5ProfileData</b> member after loading the DIB into memory.
 * 
 * For packed DIBs, the profile data should follow the bitmap bits similar to the file format. The <b>bV5ProfileData</b> member should still give the offset of the profile data from the beginning of the <b>BITMAPV5HEADER</b>.
 * 
 * Applications should access the profile data only when <b>bV5Size</b> equals the size of the <b>BITMAPV5HEADER</b> and <b>bV5CSType</b> equals PROFILE_EMBEDDED or PROFILE_LINKED.
 * 
 * If a profile is linked, the path of the profile can be any fully qualified name (including a network path) that can be opened using the <a href="https://docs.microsoft.com/windows/desktop/api/fileapi/nf-fileapi-createfilea">CreateFile</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-bitmapv5header
 * @namespace Windows.Win32.Graphics.Gdi
 */
export default struct BITMAPV5HEADER {
    #StructPack 4

    /**
     * The number of bytes required by the structure. Applications should use this member to determine which bitmap information header structure is being used.
     */
    bV5Size : UInt32

    /**
     * The width of the bitmap, in pixels.
     * 
     * If <b>bV5Compression</b> is BI_JPEG or BI_PNG, the <b>bV5Width</b> member specifies the width of the decompressed JPEG or PNG image in pixels.
     */
    bV5Width : Int32

    /**
     * The height of the bitmap, in pixels. If the value of <b>bV5Height</b> is positive, the bitmap is a bottom-up DIB and its origin is the lower-left corner. If <b>bV5Height</b> value is negative, the bitmap is a top-down DIB and its origin is the upper-left corner.
     * 
     * If <b>bV5Height</b> is negative, indicating a top-down DIB, <b>bV5Compression</b> must be either BI_RGB or BI_BITFIELDS. Top-down DIBs cannot be compressed.
     * 
     * If <b>bV5Compression</b> is BI_JPEG or BI_PNG, the <b>bV5Height</b> member specifies the height of the decompressed JPEG or PNG image in pixels.
     */
    bV5Height : Int32

    /**
     * The number of planes for the target device. This value must be set to 1.
     */
    bV5Planes : UInt16

    /**
     * The number of bits that define each pixel and the maximum number of colors in the bitmap.
     */
    bV5BitCount : UInt16

    bV5Compression : BI_COMPRESSION

    /**
     * The size, in bytes, of the image. This may be set to zero for BI_RGB bitmaps.
     * 
     * If <b>bV5Compression</b> is BI_JPEG or BI_PNG, <b>bV5SizeImage</b> is the size of the JPEG or PNG image buffer.
     */
    bV5SizeImage : UInt32

    /**
     * The horizontal resolution, in pixels-per-meter, of the target device for the bitmap. An application can use this value to select a bitmap from a resource group that best matches the characteristics of the current device.
     */
    bV5XPelsPerMeter : Int32

    /**
     * The vertical resolution, in pixels-per-meter, of the target device for the bitmap.
     */
    bV5YPelsPerMeter : Int32

    /**
     * The number of color indexes in the color table that are actually used by the bitmap. If this value is zero, the bitmap uses the maximum number of colors corresponding to the value of the <b>bV5BitCount</b> member for the compression mode specified by <b>bV5Compression</b>.
     * 
     * If <b>bV5ClrUsed</b> is nonzero and <b>bV5BitCount</b> is less than 16, the <b>bV5ClrUsed</b> member specifies the actual number of colors the graphics engine or device driver accesses. If <b>bV5BitCount</b> is 16 or greater, the <b>bV5ClrUsed</b> member specifies the size of the color table used to optimize performance of the system color palettes. If <b>bV5BitCount</b> equals 16 or 32, the optimal color palette starts immediately following the <b>BITMAPV5HEADER</b>. If <b>bV5ClrUsed</b> is nonzero, the color table is used on palettized devices, and <b>bV5ClrUsed</b> specifies the number of entries.
     */
    bV5ClrUsed : UInt32

    /**
     * The number of color indexes that are required for displaying the bitmap. If this value is zero, all colors are required.
     */
    bV5ClrImportant : UInt32

    /**
     * Color mask that specifies the red component of each pixel, valid only if <b>bV5Compression</b> is set to BI_BITFIELDS.
     */
    bV5RedMask : UInt32

    /**
     * Color mask that specifies the green component of each pixel, valid only if <b>bV5Compression</b> is set to BI_BITFIELDS.
     */
    bV5GreenMask : UInt32

    /**
     * Color mask that specifies the blue component of each pixel, valid only if <b>bV5Compression</b> is set to BI_BITFIELDS.
     */
    bV5BlueMask : UInt32

    /**
     * Color mask that specifies the alpha component of each pixel.
     */
    bV5AlphaMask : UInt32

    /**
     * The color space of the DIB.
     * 
     * The following table specifies the values for <b>bV5CSType</b>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>LCS_CALIBRATED_RGB</td>
     * <td>This value implies that endpoints and gamma values are given in the appropriate fields.</td>
     * </tr>
     * <tr>
     * <td>LCS_sRGB</td>
     * <td>Specifies that the bitmap is in sRGB color space.</td>
     * </tr>
     * <tr>
     * <td>LCS_WINDOWS_COLOR_SPACE</td>
     * <td>This value indicates that the bitmap is in the system default color space, sRGB.</td>
     * </tr>
     * <tr>
     * <td>PROFILE_LINKED</td>
     * <td>This value indicates that <b>bV5ProfileData</b> points to the file name of the profile to use (gamma and endpoints values are ignored).</td>
     * </tr>
     * <tr>
     * <td>PROFILE_EMBEDDED</td>
     * <td>This value indicates that <b>bV5ProfileData</b> points to a memory buffer that contains the profile to be used (gamma and endpoints values are ignored).</td>
     * </tr>
     * </table>
     *  
     * 
     * See the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logcolorspacea">LOGCOLORSPACE</a> structure for information that defines a logical color space.
     */
    bV5CSType : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/wingdi/ns-wingdi-ciexyztriple">CIEXYZTRIPLE</a> structure that specifies the x, y, and z coordinates of the three colors that correspond to the red, green, and blue endpoints for the logical color space associated with the bitmap. This member is ignored unless the <b>bV5CSType</b> member specifies LCS_CALIBRATED_RGB.
     */
    bV5Endpoints : CIEXYZTRIPLE

    /**
     * Toned response curve for red. Used if <b>bV5CSType</b> is set to LCS_CALIBRATED_RGB. Specify in unsigned fixed 16.16 format. The upper 16 bits are the unsigned integer value. The lower 16 bits are the fractional part.
     */
    bV5GammaRed : UInt32

    /**
     * Toned response curve for green. Used if <b>bV5CSType</b> is set to LCS_CALIBRATED_RGB. Specify in unsigned fixed 16.16 format. The upper 16 bits are the unsigned integer value. The lower 16 bits are the fractional part.
     */
    bV5GammaGreen : UInt32

    /**
     * Toned response curve for blue. Used if <b>bV5CSType</b> is set to LCS_CALIBRATED_RGB. Specify in unsigned fixed 16.16 format. The upper 16 bits are the unsigned integer value. The lower 16 bits are the fractional part.
     */
    bV5GammaBlue : UInt32

    bV5Intent : UInt32

    /**
     * The offset, in bytes, from the beginning of the <b>BITMAPV5HEADER</b> structure to the start of the profile data. If the profile is embedded, profile data is the actual profile, and it is linked. (The profile data is the null-terminated file name of the profile.) This cannot be a Unicode string. It must be composed exclusively of characters from the Windows character set (code page 1252). These profile members are ignored unless the <b>bV5CSType</b> member specifies PROFILE_LINKED or PROFILE_EMBEDDED.
     */
    bV5ProfileData : UInt32

    /**
     * Size, in bytes, of embedded profile data.
     */
    bV5ProfileSize : UInt32

    /**
     * This member has been reserved. Its value should be set to zero.
     */
    bV5Reserved : UInt32

}
