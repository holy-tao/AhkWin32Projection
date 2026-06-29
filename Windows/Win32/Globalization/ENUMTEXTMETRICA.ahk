#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NEWTEXTMETRICEXA.ahk" { NEWTEXTMETRICEXA }
#Import "..\Graphics\Gdi\AXISINFOA.ahk" { AXISINFOA }
#Import "..\Graphics\Gdi\TMPF_FLAGS.ahk" { TMPF_FLAGS }
#Import "..\Graphics\Gdi\NEWTEXTMETRICA.ahk" { NEWTEXTMETRICA }
#Import "..\Graphics\Gdi\AXESLISTA.ahk" { AXESLISTA }
#Import ".\FONTSIGNATURE.ahk" { FONTSIGNATURE }

/**
 * The ENUMTEXTMETRIC structure contains information about a physical font. (ANSI)
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
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-enumtextmetrica
 * @namespace Windows.Win32.Globalization
 * @charset ANSI
 */
export default struct ENUMTEXTMETRICA {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-newtextmetricexa">NEWTEXTMETRICEX</a> structure, containing information about a physical font.
     */
    etmNewTextMetricEx : NEWTEXTMETRICEXA

    /**
     * An <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-axeslista">AXESLIST</a> structure, containing information about the axes for the font. This is only used for multiple master fonts.
     */
    etmAxesList : AXESLISTA

}
