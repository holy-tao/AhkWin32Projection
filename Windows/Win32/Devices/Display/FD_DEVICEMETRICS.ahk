#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FD_XFORM.ahk" { FD_XFORM }
#Import ".\POINTE.ahk" { POINTE }
#Import "..\..\Foundation\POINTL.ahk" { POINTL }

/**
 * The FD_DEVICEMETRICS structure is used to provide device-specific font information to GDI if the iMode parameter of the driver-supplied DrvQueryFontData function is QFD_MAXEXTENTS.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-fd_devicemetrics
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FD_DEVICEMETRICS {
    #StructPack 4

    flRealizedType : UInt32

    /**
     * Specifies a POINTE structure that contains the notional space unit vector along the font's baseline, transformed to device space and then normalized. For more information, see POINTE in <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     */
    pteBase : POINTE

    /**
     * Specifies POINTE structure that contains a notional space unit vector perpendicular to the font's baseline in the direction of the ascender, transformed to device space and then normalized. In notional space, baseline and ascender directions must be orthogonal, but in device space, <b>pteBase</b> and <b>pteSide</b> do not have to be orthogonal, depending on the Notional to Device space transform.
     */
    pteSide : POINTE

    /**
     * Specifies the advance width if the font is a fixed pitch (monospaced) font. If the font is a variable pitch font, this member should be set to zero.
     */
    lD : Int32

    /**
     * Specifies the hinted maximum ascender height for this font instance, measured along <b>pteSide</b>. See the FIX data type in <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     */
    fxMaxAscender : Int32

    /**
     * Specifies the hinted maximum descender height for this font instance, measured along <b>pteSide</b>. See the FIX data type in <a href="https://docs.microsoft.com/windows-hardware/drivers/display/gdi-data-types">GDI Data Types</a>.
     */
    fxMaxDescender : Int32

    /**
     * Specifies a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-pointl">POINTL</a> structure that contains the hinted underline position for this font instance, relative to the glyph's character origin.
     */
    ptlUnderline1 : POINTL

    /**
     * Specifies a POINTL structure that contains the hinted strikeout position for this font instance, relative to the glyph's character origin.
     */
    ptlStrikeOut : POINTL

    /**
     * Specifies a POINTL structure that contains the hinted underline thickness for this font instance. This vector defines the side of the rectangle used to draw the underline. The base is implicitly defined by the baseline.
     */
    ptlULThickness : POINTL

    /**
     * Specifies a POINTL structure that contains the hinted strikeout thickness for this font instance. This vector defines the side of the rectangle used to draw the strikeout. The base is implicitly defined by the baseline.
     */
    ptlSOThickness : POINTL

    /**
     * Specifies the hinted maximum glyph bitmap width, in pixels, for this font instance. Not used for outlines.
     */
    cxMax : UInt32

    /**
     * Specifies the hinted maximum glyph bitmap height, in pixels, for this font instance. Not used for outlines.
     */
    cyMax : UInt32

    /**
     * Specifies the hinted maximum size of a glyph, in bytes, for this font instance. This value is the maximum size of the <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-glyphbits">GLYPHBITS</a> structure needed to store any of the font's glyphs.
     */
    cjGlyphMax : UInt32

    /**
     * Specifies an <a href="https://docs.microsoft.com/windows/desktop/api/winddi/ns-winddi-fd_xform">FD_XFORM</a> structure. The font driver fills in the font transformation that is actually used in the realization of the font. This may differ from the transformation requested by GDI as defined by <a href="https://docs.microsoft.com/windows/desktop/api/winddi/nf-winddi-fontobj_pxogetxform">FONTOBJ_pxoGetXform</a>.
     */
    fdxQuantized : FD_XFORM

    /**
     * Is the nonlinear external leading in 28.4 device units.
     */
    lNonLinearExtLeading : Int32

    /**
     * Is the nonlinear internal leading in 28.4 device units.
     */
    lNonLinearIntLeading : Int32

    /**
     * Is the nonlinear maximum character increment in 28.4 device units.
     */
    lNonLinearMaxCharWidth : Int32

    /**
     * Is the nonlinear average character width in 28.4 device units.
     */
    lNonLinearAvgCharWidth : Int32

    /**
     * Is the largest negative A space for this font realization, specified as an absolute value.
     */
    lMinA : Int32

    /**
     * Is the largest negative C space for this font realization, specified as an absolute value.
     */
    lMinC : Int32

    /**
     * Is the smallest nonzero character width for this font realization.
     */
    lMinD : Int32

    /**
     * Is reserved and should be ignored by the font provider.
     */
    alReserved : Int32[1]

}
