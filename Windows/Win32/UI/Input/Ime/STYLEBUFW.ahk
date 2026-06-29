#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The STYLEBUFW (Unicode) structure (immdev.h) contains the identifier and name of a style.
 * @remarks
 * > [!NOTE]
 * > The immdev.h header defines STYLEBUF as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/immdev/ns-immdev-stylebufw
 * @namespace Windows.Win32.UI.Input.Ime
 * @charset Unicode
 */
export default struct STYLEBUFW {
    #StructPack 4

    /**
     * Style of the register string. Can be IME_REGWORD_STYLE_EUDC to indicate a string in the EUDC range.
     */
    dwStyle : UInt32

    /**
     * Description of the style.
     */
    szDescription : WCHAR[32]

}
