#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\Graphics\Gdi\NEWTEXTMETRICW.ahk" { NEWTEXTMETRICW }
#Import "..\Graphics\Gdi\TMPF_FLAGS.ahk" { TMPF_FLAGS }
#Import ".\FONTSIGNATURE.ahk" { FONTSIGNATURE }

/**
 * The NEWTEXTMETRICEX structure contains information about a physical font. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The wingdi.h header defines NEWTEXTMETRICEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/wingdi/ns-wingdi-newtextmetricexw
 * @namespace Windows.Win32.Globalization
 * @charset Unicode
 */
export default struct NEWTEXTMETRICEXW {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-newtextmetrica">NEWTEXTMETRIC</a> structure.
     */
    ntmTm : NEWTEXTMETRICW

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wingdi/ns-wingdi-fontsignature">FONTSIGNATURE</a> structure indicating the coverage of the font.
     */
    ntmFontSig : FONTSIGNATURE

}
