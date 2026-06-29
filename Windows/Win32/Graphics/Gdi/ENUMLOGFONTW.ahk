#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import ".\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import ".\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import ".\LOGFONTW.ahk" { LOGFONTW }
#Import ".\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The ENUMLOGFONT structure defines the attributes of a font, the complete name of a font, and the style of a font. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines ENUMLOGFONT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumlogfontw
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset Unicode
 */
export default struct ENUMLOGFONTW {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that defines the attributes of a font.
     */
    elfLogFont : LOGFONTW

    /**
     * A unique name for the font. For example, ABCD Font Company TrueType Bold Italic Sans Serif.
     */
    elfFullName : WCHAR[64]

    /**
     * The style of the font. For example, Bold Italic.
     */
    elfStyle : WCHAR[32]

}
