#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BITMAPINFOHEADER.ahk
#Include .\RGBQUAD.ahk

/**
 * The BITMAPINFO structure defines the dimensions and color information for a DIB.
 * @remarks
 * 
  * A DIB consists of two distinct parts: a <b>BITMAPINFO</b> structure describing the dimensions and colors of the bitmap, and an array of bytes defining the pixels of the bitmap. The bits in the array are packed together, but each scan line must be padded with zeros to end on a <b>LONG</b> data-type boundary. If the height of the bitmap is positive, the bitmap is a bottom-up DIB and its origin is the lower-left corner. If the height is negative, the bitmap is a top-down DIB and its origin is the upper left corner.
  * 
  * A bitmap is packed when the bitmap array immediately follows the <b>BITMAPINFO</b> header. Packed bitmaps are referenced by a single pointer. For packed bitmaps, the <b>biClrUsed</b> member must be set to an even number when using the DIB_PAL_COLORS mode so that the DIB bitmap array starts on a <b>DWORD</b> boundary.
  * 
  * <div class="alert"><b>Note</b>  <p class="note">The <b>bmiColors</b> member should not contain palette indexes if the bitmap is to be stored in a file or transferred to another application.
  * 
  * <p class="note">Unless the application has exclusive use and control of the bitmap, the bitmap color table should contain explicit RGB values.
  * 
  * </div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//wingdi/ns-wingdi-bitmapinfo
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class BITMAPINFO extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/previous-versions/dd183376(v=vs.85)">BITMAPINFOHEADER</a> structure that contains information about the dimensions of color format.
     * 
     * .
     * @type {BITMAPINFOHEADER}
     */
    bmiHeader{
        get {
            if(!this.HasProp("__bmiHeader"))
                this.__bmiHeader := BITMAPINFOHEADER(this.ptr + 0)
            return this.__bmiHeader
        }
    }

    /**
     * The <b>bmiColors</b> member contains one of the following:
     * 
     * <ul>
     * <li>An array of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-rgbquad">RGBQUAD</a>. The elements of the array that make up the color table.</li>
     * <li>An array of 16-bit unsigned integers that specifies indexes into the currently realized logical palette. This use of <b>bmiColors</b> is allowed for functions that use DIBs. When <b>bmiColors</b> elements contain indexes to a realized logical palette, they must also call the following bitmap functions:
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibitmap">CreateDIBitmap</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibpatternbrush">CreateDIBPatternBrush</a>
     * 
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a>
     * 
     * 
     * The <i>iUsage</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-createdibsection">CreateDIBSection</a> must be set to DIB_PAL_COLORS.
     * 
     * </li>
     * </ul>
     * The number of entries in the array depends on the values of the <b>biBitCount</b> and <b>biClrUsed</b> members of the <a href="https://docs.microsoft.com/previous-versions/dd183376(v=vs.85)">BITMAPINFOHEADER</a> structure.
     * 
     * The colors in the <b>bmiColors</b> table appear in order of importance. For more information, see the Remarks section.
     * @type {Array<RGBQUAD>}
     */
    bmiColors{
        get {
            if(!this.HasProp("__bmiColorsProxyArray"))
                this.__bmiColorsProxyArray := Win32FixedArray(this.ptr + 40, 1, RGBQUAD, "")
            return this.__bmiColorsProxyArray
        }
    }
}
