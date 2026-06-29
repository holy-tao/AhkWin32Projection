#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import ".\LOGFONTA.ahk" { LOGFONTA }
#Import ".\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import ".\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import ".\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * The ENUMLOGFONTEX structure contains information about an enumerated font. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines ENUMLOGFONTEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumlogfontexa
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset ANSI
 */
export default struct ENUMLOGFONTEXA {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-logfonta">LOGFONT</a> structure that contains values defining the font attributes.
     */
    elfLogFont : LOGFONTA

    /**
     * The unique name of the font. For example, ABC Font Company TrueType Bold Italic Sans Serif.
     */
    elfFullName : Int8[64]

    /**
     * The style of the font. For example, Bold Italic.
     */
    elfStyle : Int8[32]

    /**
     * The script, that is, the character set, of the font. For example, Cyrillic.
     */
    elfScript : Int8[32]

}
