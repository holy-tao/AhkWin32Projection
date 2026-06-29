#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Specifies a keyword to search for and the keyword table to be searched by Windows Help. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The winuser.h header defines MULTIKEYHELP as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-multikeyhelpa
 * @namespace Windows.Win32.UI.Shell
 * @charset ANSI
 */
export default struct MULTIKEYHELPA {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The structure size, in bytes.
     */
    mkSize : UInt32

    /**
     * Type: <b>TCHAR</b>
     * 
     * A single character that identifies the keyword table to search.
     */
    mkKeylist : CHAR

    /**
     * Type: <b>TCHAR[1]</b>
     * 
     * A null-terminated text string that specifies the keyword to locate in the keyword table.
     */
    szKeyphrase : CHAR[1]

}
