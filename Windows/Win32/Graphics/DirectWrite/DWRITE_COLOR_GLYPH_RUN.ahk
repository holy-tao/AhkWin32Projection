#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DWRITE_GLYPH_RUN.ahk
#Include .\DWRITE_COLOR_F.ahk

/**
 * Contains the information needed by renderers to draw glyph runs with glyph color information.
 * @see https://docs.microsoft.com/windows/win32/api//dwrite_2/ns-dwrite_2-dwrite_color_glyph_run
 * @namespace Windows.Win32.Graphics.DirectWrite
 * @version v4.0.30319
 */
class DWRITE_COLOR_GLYPH_RUN extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Glyph run to draw for this layer.
     * @type {DWRITE_GLYPH_RUN}
     */
    glyphRun{
        get {
            if(!this.HasProp("__glyphRun"))
                this.__glyphRun := DWRITE_GLYPH_RUN(0, this)
            return this.__glyphRun
        }
    }

    /**
     * Pointer to the glyph run description for this layer. This may be <b>NULL</b>. For example, when the original glyph run is split into multiple layers, one layer might have a description and the others have none.
     * @type {Pointer<DWRITE_GLYPH_RUN_DESCRIPTION>}
     */
    glyphRunDescription {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * X coordinate of the baseline origin for the layer.
     * @type {Float}
     */
    baselineOriginX {
        get => NumGet(this, 56, "float")
        set => NumPut("float", value, this, 56)
    }

    /**
     * Y coordinate of the baseline origin for the layer.
     * @type {Float}
     */
    baselineOriginY {
        get => NumGet(this, 60, "float")
        set => NumPut("float", value, this, 60)
    }

    /**
     * Color value of the run; if all members are zero, the run should be drawn using the current brush.
     * @type {DWRITE_COLOR_F}
     */
    runColor{
        get {
            if(!this.HasProp("__runColor"))
                this.__runColor := DWRITE_COLOR_F(64, this)
            return this.__runColor
        }
    }

    /**
     * Zero-based index into the font’s color palette; if this is <b>0xFFFF</b>, the run should be drawn using the current brush.
     * @type {Integer}
     */
    paletteIndex {
        get => NumGet(this, 80, "ushort")
        set => NumPut("ushort", value, this, 80)
    }
}
