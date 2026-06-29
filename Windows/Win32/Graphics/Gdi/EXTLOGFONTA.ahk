#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PAN_FAMILY_TYPE.ahk" { PAN_FAMILY_TYPE }
#Import ".\PAN_STROKE_VARIATION.ahk" { PAN_STROKE_VARIATION }
#Import ".\PANOSE.ahk" { PANOSE }
#Import ".\PAN_MIDLINE.ahk" { PAN_MIDLINE }
#Import ".\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import ".\LOGFONTA.ahk" { LOGFONTA }
#Import ".\PAN_WEIGHT.ahk" { PAN_WEIGHT }
#Import ".\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import ".\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import ".\PAN_CONTRAST.ahk" { PAN_CONTRAST }
#Import ".\PAN_LETT_FORM.ahk" { PAN_LETT_FORM }
#Import ".\PAN_SERIF_STYLE.ahk" { PAN_SERIF_STYLE }
#Import ".\PAN_ARM_STYLE.ahk" { PAN_ARM_STYLE }
#Import ".\PAN_PROPORTION.ahk" { PAN_PROPORTION }
#Import ".\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import ".\PAN_XHEIGHT.ahk" { PAN_XHEIGHT }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The EXTLOGFONT structure defines the attributes of a font. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines EXTLOGFONT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-extlogfonta
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset ANSI
 */
export default struct EXTLOGFONTA {
    #StructPack 8

    /**
     * Specifies some of the attributes of the specified font. This member is a <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure.
     */
    elfLogFont : LOGFONTA

    /**
     * A unique name for the font (for example, ABCD Font Company TrueType Bold Italic Sans Serif).
     */
    elfFullName : Int8[64]

    /**
     * The style of the font (for example, Bold Italic).
     */
    elfStyle : Int8[32]

    /**
     * Reserved. Must be zero.
     */
    elfVersion : UInt32

    /**
     * This member only has meaning for hinted fonts. It specifies the point size at which the font is hinted. If set to zero, which is its default value, the font is hinted at the point size corresponding to the <b>lfHeight</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure specified by <b>elfLogFont</b>.
     */
    elfStyleSize : UInt32

    /**
     * A unique identifier for an enumerated font. This will be filled in by the graphics device interface (GDI) upon font enumeration.
     */
    elfMatch : UInt32

    /**
     * Reserved; must be zero.
     */
    elfReserved : UInt32

    /**
     * A 4-byte identifier of the font vendor.
     */
    elfVendorId : Int8[4]

    /**
     * Reserved; must be zero.
     */
    elfCulture : UInt32

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-panose">PANOSE</a> structure that specifies the shape of the font. If all members of this structure are set to zero, the <b>elfPanose</b> member is ignored by the font mapper.
     */
    elfPanose : PANOSE

}
