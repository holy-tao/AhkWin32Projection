#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Graphics\Gdi\NEWTEXTMETRICW.ahk" { NEWTEXTMETRICW }
#Import "..\Graphics\Gdi\TMPF_FLAGS.ahk" { TMPF_FLAGS }
#Import "..\Graphics\Gdi\AXESLISTW.ahk" { AXESLISTW }
#Import ".\NEWTEXTMETRICEXW.ahk" { NEWTEXTMETRICEXW }
#Import "..\Graphics\Gdi\AXISINFOW.ahk" { AXISINFOW }
#Import ".\FONTSIGNATURE.ahk" { FONTSIGNATURE }
#Import "..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The ENUMTEXTMETRIC structure contains information about a physical font. (Unicode)
 * @remarks
 * <b>ENUMTEXTMETRIC</b> is an extension of <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-newtextmetricexa">NEWTEXTMETRICEX</a> that includes the axis information for a multiple master font.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontsa">EnumFonts</a>, <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesa">EnumFontFamilies</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/nf-wingdi-enumfontfamiliesexa">EnumFontFamiliesEx</a> functions have been modified to return pointers to the <b>ENUMTEXTMETRIC</b> and <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-enumlogfontexdva">ENUMLOGFONTEXDV</a> structures.
 * 
 * 
 * 
 * 
 * 
 * > [!NOTE]
 * > The wingdi.h header defines ENUMTEXTMETRIC as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumtextmetricw
 * @namespace Windows.Win32.Globalization
 * @charset Unicode
 */
export default struct ENUMTEXTMETRICW {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-newtextmetricexa">NEWTEXTMETRICEX</a> structure, containing information about a physical font.
     */
    etmNewTextMetricEx : NEWTEXTMETRICEXW

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-axeslista">AXESLIST</a> structure, containing information about the axes for the font. This is only used for multiple master fonts.
     */
    etmAxesList : AXESLISTW

}
