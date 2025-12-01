#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The LOGBRUSH structure defines the style, color, and pattern of a physical brush. It is used by the CreateBrushIndirect and ExtCreatePen functions.
 * @remarks
 * Although <b>lbColor</b> controls the foreground color of a hatch brush, the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-setbkmode">SetBkMode</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-setbkcolor">SetBkColor</a> functions control the background color.
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-logbrush
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class LOGBRUSH extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The brush style. The <b>lbStyle</b> member must be one of the following styles.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td>BS_DIBPATTERN</td>
     * <td>A pattern brush defined by a device-independent bitmap (DIB) specification. If <b>lbStyle</b> is BS_DIBPATTERN, the <b>lbHatch</b> member contains a handle to a packed DIB. For more information, see discussion in <b>lbHatch</b>.</td>
     * </tr>
     * <tr>
     * <td>BS_DIBPATTERN8X8</td>
     * <td>See BS_DIBPATTERN.</td>
     * </tr>
     * <tr>
     * <td>BS_DIBPATTERNPT</td>
     * <td>A pattern brush defined by a device-independent bitmap (DIB) specification. If <b>lbStyle</b> is BS_DIBPATTERNPT, the <b>lbHatch</b> member contains a pointer to a packed DIB. For more information, see discussion in <b>lbHatch</b>.</td>
     * </tr>
     * <tr>
     * <td>BS_HATCHED</td>
     * <td>Hatched brush.</td>
     * </tr>
     * <tr>
     * <td>BS_HOLLOW</td>
     * <td>Hollow brush.</td>
     * </tr>
     * <tr>
     * <td>BS_NULL</td>
     * <td>Same as BS_HOLLOW.</td>
     * </tr>
     * <tr>
     * <td>BS_PATTERN</td>
     * <td>Pattern brush defined by a memory bitmap.</td>
     * </tr>
     * <tr>
     * <td>BS_PATTERN8X8</td>
     * <td>See BS_PATTERN.</td>
     * </tr>
     * <tr>
     * <td>BS_SOLID</td>
     * <td>Solid brush.</td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    lbStyle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The color in which the brush is to be drawn. If <b>lbStyle</b> is the BS_HOLLOW or BS_PATTERN style, <b>lbColor</b> is ignored.
     * @type {COLORREF}
     */
    lbColor {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A hatch style. The meaning depends on the brush style defined by <b>lbStyle</b>.
     * 
     * If <b>lbStyle</b> is BS_DIBPATTERN, the <b>lbHatch</b> member contains a handle to a packed DIB. To obtain this handle, an application calls the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> function with GMEM_MOVEABLE (or <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> with LMEM_MOVEABLE) to allocate a block of memory and then fills the memory with the packed DIB. A packed DIB consists of a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure immediately followed by the array of bytes that define the pixels of the bitmap.
     * 
     * If <b>lbStyle</b> is BS_DIBPATTERNPT, the <b>lbHatch</b> member contains a pointer to a packed DIB. The pointer derives from the memory block created by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> with LMEM_FIXED set or by <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-globalalloc">GlobalAlloc</a> with GMEM_FIXED set, or it is the pointer returned by a call like <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-locallock">LocalLock</a> (handle_to_the_dib). A packed DIB consists of a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-bitmapinfo">BITMAPINFO</a> structure immediately followed by the array of bytes that define the pixels of the bitmap.
     * @type {Pointer}
     */
    lbHatch {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
