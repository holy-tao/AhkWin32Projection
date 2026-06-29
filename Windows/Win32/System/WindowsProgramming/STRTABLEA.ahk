#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STRENTRYA.ahk" { STRENTRYA }

/**
 * Represents a table of registry string replacements. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The advpub.h header defines STRTABLE as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/advpub/ns-advpub-strtablea
 * @namespace Windows.Win32.System.WindowsProgramming
 * @charset ANSI
 */
export default struct STRTABLEA {
    #StructPack 8

    /**
     * The number of entries in the table.
     */
    cEntries : UInt32

    /**
     * And array of entries.
     */
    pse : STRENTRYA.Ptr

}
