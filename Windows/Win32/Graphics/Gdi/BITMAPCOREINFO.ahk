#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BITMAPCOREHEADER.ahk
#Include .\RGBTRIPLE.ahk

/**
 * The BITMAPCOREINFO structure defines the dimensions and color information for a DIB.
 * @remarks
 * 
  * A DIB consists of two parts: a <b>BITMAPCOREINFO</b> structure describing the dimensions and colors of the bitmap, and an array of bytes defining the pixels of the bitmap. The bits in the array are packed together, but each scan line must be padded with zeros to end on a <b>LONG</b> boundary. The origin of the bitmap is the lower-left corner.
  * 
  * The <b>bcBitCount</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapcoreheader">BITMAPCOREHEADER</a> structure determines the number of bits that define each pixel and the maximum number of colors in the bitmap. This member can be one of the following values.
  * 
  * <table>
  * <tr>
  * <th>Value</th>
  * <th>Meaning</th>
  * </tr>
  * <tr>
  * <td>1</td>
  * <td>The bitmap is monochrome, and the <b>bmciColors</b> member contains two entries. Each bit in the bitmap array represents a pixel. If the bit is clear, the pixel is displayed with the color of the first entry in the <b>bmciColors</b> table; if the bit is set, the pixel has the color of the second entry in the table.</td>
  * </tr>
  * <tr>
  * <td>4</td>
  * <td>The bitmap has a maximum of 16 colors, and the <b>bmciColors</b> member contains up to 16 entries. Each pixel in the bitmap is represented by a 4-bit index into the color table. For example, if the first byte in the bitmap is 0x1F, the byte represents two pixels. The first pixel contains the color in the second table entry, and the second pixel contains the color in the sixteenth table entry.</td>
  * </tr>
  * <tr>
  * <td>8</td>
  * <td>The bitmap has a maximum of 256 colors, and the <b>bmciColors</b> member contains up to 256 entries. In this case, each byte in the array represents a single pixel.</td>
  * </tr>
  * <tr>
  * <td>24</td>
  * <td>The bitmap has a maximum of 2 (24) colors, and the <b>bmciColors</b> member is <b>NULL</b>. Each three-byte triplet in the bitmap array represents the relative intensities of blue, green, and red, respectively, for a pixel.</td>
  * </tr>
  * </table>
  *  
  * 
  * The colors in the <b>bmciColors</b> table should appear in order of importance.
  * 
  * Alternatively, for functions that use DIBs, the <b>bmciColors</b> member can be an array of 16-bit unsigned integers that specify indexes into the currently realized logical palette, instead of explicit RGB values. In this case, an application using the bitmap must call the DIB functions ( <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibitmap">CreateDIBitmap</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibpatternbrush">CreateDIBPatternBrush</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a> ) with the <i>iUsage</i> parameter set to DIB_PAL_COLORS.
  * 
  * <div class="alert"><b>Note</b>  <p class="note">The <b>bmciColors</b> member should not contain palette indexes if the bitmap is to be stored in a file or transferred to another application. Unless the application has exclusive use and control of the bitmap, the bitmap color table should contain explicit RGB values.
  * 
  * </div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-bitmapcoreinfo
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class BITMAPCOREINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapcoreheader">BITMAPCOREHEADER</a> structure that contains information about the dimensions and color format of a DIB.
     * @type {BITMAPCOREHEADER}
     */
    bmciHeader{
        get {
            if(!this.HasProp("__bmciHeader"))
                this.__bmciHeader := BITMAPCOREHEADER(0, this)
            return this.__bmciHeader
        }
    }

    /**
     * Specifies an array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgbtriple">RGBTRIPLE</a> structures that define the colors in the bitmap.
     * @type {Array<RGBTRIPLE>}
     */
    bmciColors{
        get {
            if(!this.HasProp("__bmciColorsProxyArray"))
                this.__bmciColorsProxyArray := Win32FixedArray(this.ptr + 16, 1, RGBTRIPLE, "")
            return this.__bmciColorsProxyArray
        }
    }
}
