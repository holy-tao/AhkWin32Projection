#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\POINTE.ahk
#Include ..\..\Foundation\POINTL.ahk
#Include .\FD_XFORM.ahk

/**
 * The FD_DEVICEMETRICS structure is used to provide device-specific font information to GDI if the iMode parameter of the driver-supplied DrvQueryFontData function is QFD_MAXEXTENTS.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fd_devicemetrics
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class FD_DEVICEMETRICS extends Win32Struct
{
    static sizeof => 136

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    flRealizedType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies a POINTE structure that contains the notional space unit vector along the font's baseline, transformed to device space and then normalized. For more information, see POINTE in <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * @type {POINTE}
     */
    pteBase{
        get {
            if(!this.HasProp("__pteBase"))
                this.__pteBase := POINTE(8, this)
            return this.__pteBase
        }
    }

    /**
     * Specifies POINTE structure that contains a notional space unit vector perpendicular to the font's baseline in the direction of the ascender, transformed to device space and then normalized. In notional space, baseline and ascender directions must be orthogonal, but in device space, <b>pteBase</b> and <b>pteSide</b> do not have to be orthogonal, depending on the Notional to Device space transform.
     * @type {POINTE}
     */
    pteSide{
        get {
            if(!this.HasProp("__pteSide"))
                this.__pteSide := POINTE(16, this)
            return this.__pteSide
        }
    }

    /**
     * Specifies the advance width if the font is a fixed pitch (monospaced) font. If the font is a variable pitch font, this member should be set to zero.
     * @type {Integer}
     */
    lD {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Specifies the hinted maximum ascender height for this font instance, measured along <b>pteSide</b>. See the FIX data type in <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * @type {Integer}
     */
    fxMaxAscender {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * Specifies the hinted maximum descender height for this font instance, measured along <b>pteSide</b>. See the FIX data type in <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     * @type {Integer}
     */
    fxMaxDescender {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that contains the hinted underline position for this font instance, relative to the glyph's character origin.
     * @type {POINTL}
     */
    ptlUnderline1{
        get {
            if(!this.HasProp("__ptlUnderline1"))
                this.__ptlUnderline1 := POINTL(40, this)
            return this.__ptlUnderline1
        }
    }

    /**
     * Specifies a POINTL structure that contains the hinted strikeout position for this font instance, relative to the glyph's character origin.
     * @type {POINTL}
     */
    ptlStrikeOut{
        get {
            if(!this.HasProp("__ptlStrikeOut"))
                this.__ptlStrikeOut := POINTL(48, this)
            return this.__ptlStrikeOut
        }
    }

    /**
     * Specifies a POINTL structure that contains the hinted underline thickness for this font instance. This vector defines the side of the rectangle used to draw the underline. The base is implicitly defined by the baseline.
     * @type {POINTL}
     */
    ptlULThickness{
        get {
            if(!this.HasProp("__ptlULThickness"))
                this.__ptlULThickness := POINTL(56, this)
            return this.__ptlULThickness
        }
    }

    /**
     * Specifies a POINTL structure that contains the hinted strikeout thickness for this font instance. This vector defines the side of the rectangle used to draw the strikeout. The base is implicitly defined by the baseline.
     * @type {POINTL}
     */
    ptlSOThickness{
        get {
            if(!this.HasProp("__ptlSOThickness"))
                this.__ptlSOThickness := POINTL(64, this)
            return this.__ptlSOThickness
        }
    }

    /**
     * Specifies the hinted maximum glyph bitmap width, in pixels, for this font instance. Not used for outlines.
     * @type {Integer}
     */
    cxMax {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Specifies the hinted maximum glyph bitmap height, in pixels, for this font instance. Not used for outlines.
     * @type {Integer}
     */
    cyMax {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * Specifies the hinted maximum size of a glyph, in bytes, for this font instance. This value is the maximum size of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphbits">GLYPHBITS</a> structure needed to store any of the font's glyphs.
     * @type {Integer}
     */
    cjGlyphMax {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * Specifies an <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_xform">FD_XFORM</a> structure. The font driver fills in the font transformation that is actually used in the realization of the font. This may differ from the transformation requested by GDI as defined by <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-fontobj_pxogetxform">FONTOBJ_pxoGetXform</a>.
     * @type {FD_XFORM}
     */
    fdxQuantized{
        get {
            if(!this.HasProp("__fdxQuantized"))
                this.__fdxQuantized := FD_XFORM(88, this)
            return this.__fdxQuantized
        }
    }

    /**
     * Is the nonlinear external leading in 28.4 device units.
     * @type {Integer}
     */
    lNonLinearExtLeading {
        get => NumGet(this, 104, "int")
        set => NumPut("int", value, this, 104)
    }

    /**
     * Is the nonlinear internal leading in 28.4 device units.
     * @type {Integer}
     */
    lNonLinearIntLeading {
        get => NumGet(this, 108, "int")
        set => NumPut("int", value, this, 108)
    }

    /**
     * Is the nonlinear maximum character increment in 28.4 device units.
     * @type {Integer}
     */
    lNonLinearMaxCharWidth {
        get => NumGet(this, 112, "int")
        set => NumPut("int", value, this, 112)
    }

    /**
     * Is the nonlinear average character width in 28.4 device units.
     * @type {Integer}
     */
    lNonLinearAvgCharWidth {
        get => NumGet(this, 116, "int")
        set => NumPut("int", value, this, 116)
    }

    /**
     * Is the largest negative A space for this font realization, specified as an absolute value.
     * @type {Integer}
     */
    lMinA {
        get => NumGet(this, 120, "int")
        set => NumPut("int", value, this, 120)
    }

    /**
     * Is the largest negative C space for this font realization, specified as an absolute value.
     * @type {Integer}
     */
    lMinC {
        get => NumGet(this, 124, "int")
        set => NumPut("int", value, this, 124)
    }

    /**
     * Is the smallest nonzero character width for this font realization.
     * @type {Integer}
     */
    lMinD {
        get => NumGet(this, 128, "int")
        set => NumPut("int", value, this, 128)
    }

    /**
     * Is reserved and should be ignored by the font provider.
     * @type {Array<Int32>}
     */
    alReserved{
        get {
            if(!this.HasProp("__alReservedProxyArray"))
                this.__alReservedProxyArray := Win32FixedArray(this.ptr + 132, 1, Primitive, "int")
            return this.__alReservedProxyArray
        }
    }
}
