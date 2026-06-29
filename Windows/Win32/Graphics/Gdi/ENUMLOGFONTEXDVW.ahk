#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DESIGNVECTOR.ahk" { DESIGNVECTOR }
#Import ".\FONT_CLIP_PRECISION.ahk" { FONT_CLIP_PRECISION }
#Import ".\ENUMLOGFONTEXW.ahk" { ENUMLOGFONTEXW }
#Import ".\FONT_QUALITY.ahk" { FONT_QUALITY }
#Import ".\LOGFONTW.ahk" { LOGFONTW }
#Import ".\FONT_OUTPUT_PRECISION.ahk" { FONT_OUTPUT_PRECISION }
#Import ".\FONT_CHARSET.ahk" { FONT_CHARSET }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The ENUMLOGFONTEXDV structure contains the information used to create a font. (Unicode)
 * @remarks
 * The actual size of <b>ENUMLOGFONTEXDV</b> depends on that of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-designvector">DESIGNVECTOR</a>, which, in turn depends on its <b>dvNumAxes</b> member.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontsa">EnumFonts</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesa">EnumFontFamilies</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesexa">EnumFontFamiliesEx</a> functions have been modified to return pointers to <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-enumtextmetrica">ENUMTEXTMETRIC</a> and <b>ENUMLOGFONTEXDV</b> to the callback function.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines ENUMLOGFONTEXDV as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumlogfontexdvw
 * @namespace Windows.Win32.Graphics.Gdi
 * @charset Unicode
 */
export default struct ENUMLOGFONTEXDVW {
    #StructPack 8

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-enumlogfontexa">ENUMLOGFONTEX</a> structure that contains information about the logical attributes of the font.
     */
    elfEnumLogfontEx : ENUMLOGFONTEXW

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-designvector">DESIGNVECTOR</a> structure. This is zero-filled unless the font described is a multiple master OpenType font.
     */
    elfDesignVector : DESIGNVECTOR

}
