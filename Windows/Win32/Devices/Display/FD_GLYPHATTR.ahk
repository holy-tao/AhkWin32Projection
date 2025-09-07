#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The FD_GLYPHATTR structure is used to specify the return value for the FONTOBJ_pQueryGlyphAttrs and DrvQueryGlyphAttrs functions.
 * @remarks
 * If <b>iMode</b> is FO_ATTR_MODE_ROTATE (the only flag currently defined), a printer driver can determine the bit that corresponds to a particular glyph index using the following code fragment, where <i>hg</i> is the glyph index and <i>pga</i> is a pointer to an FD_GLYPHATTR structure. If the bit in the <b>aGlyphAttr</b> array associated with glyph index <i>hg</i> is set, <i>result</i> is set to 1. If the same bit in the array is not set, <i>result</i> is set to 0. Note that the bits within a byte are stored so that glyph indexes 0, 1, ..., 7 correspond to bit positions 7, 6, ..., 0 within <b>aGlyphAttr</b>[0], glyph indexes 8, 9, ..., 15 correspond to bit positions 7, 6, ..., 0 within <b>aGlyphAttr</b>[1], and so on. 
  * 
  * 
  * ```
  * BYTE glyphBits[8] = {0x80, 0x40, 0x20, 0x10, 0x8, 0x4, 0x2, 0x1};
  * result = (pga->aGlyphAttr[hg / 8]) & (glyphBits[hg % 8]);
  * ```
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fd_glyphattr
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FD_GLYPHATTR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * Is the size in bytes of the FD_GLYPHATTR structure, including the array specified by the <b>aGlyphAttr</b> member.
     * @type {Integer}
     */
    cjThis {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the number of glyphs in the font.
     * @type {Integer}
     */
    cGlyphs {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Is a flag indicating the type of information being returned. The following flag is defined:
     * 
     * <table>
     * <tr>
     * <th>Flag</th>
     * <th>Definition</th>
     * </tr>
     * <tr>
     * <td>
     * FO_ATTR_MODE_ROTATE
     * 
     * </td>
     * <td>
     * The array specified by <b>aGlyphAttr</b> is a bit array indicating which glyphs of a vertical font must be rotated. The bit array's length is (<b>cGlyphs</b>+7)/8. If a glyph's bit is set, the glyph should be rotated during rasterization.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    iMode {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Is an array supplying the information specified by <b>iMode</b>. The size of this array is (<b>cGlyphs</b>+7) / 8 bytes.
     * @type {Array<Byte>}
     */
    aGlyphAttr{
        get {
            if(!this.HasProp("__aGlyphAttrProxyArray"))
                this.__aGlyphAttrProxyArray := Win32FixedArray(this.ptr + 12, 1, Primitive, "char")
            return this.__aGlyphAttrProxyArray
        }
    }
}
