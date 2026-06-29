#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Represents a registry string replacement. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The advpub.h header defines STRENTRY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/advpub/ns-advpub-strentryw
 * @namespace Windows.Win32.System.WindowsProgramming
 * @charset Unicode
 */
export default struct STRENTRYW {
    #StructPack 8

    /**
     * The name of the string to substitute.
     */
    pszName : PWSTR

    /**
     * The replacement string.
     */
    pszValue : PWSTR

}
