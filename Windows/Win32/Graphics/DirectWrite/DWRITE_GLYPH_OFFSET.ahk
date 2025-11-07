#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The optional adjustment to a glyph's position.
 * @remarks
 * 
 * An glyph offset changes the position of a glyph without affecting the pen position. Offsets are in logical, pre-transform units.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dwrite/ns-dwrite-dwrite_glyph_offset
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_GLYPH_OFFSET extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>FLOAT</b>
     * 
     * The offset in the advance direction of the run. A positive advance offset moves the glyph to the right (in pre-transform coordinates) if the run is left-to-right or to the left if the run is right-to-left.
     * @type {Float}
     */
    advanceOffset {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * Type: <b>FLOAT</b>
     * 
     * The offset in the ascent direction, that is, the direction ascenders point. A positive ascender offset moves the glyph up (in pre-transform coordinates).  A negative ascender offset moves the glyph down.
     * @type {Float}
     */
    ascenderOffset {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }
}
