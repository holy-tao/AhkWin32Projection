#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\CHARRANGE.ahk" { CHARRANGE }
#Import "..\..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about text to search for in a rich edit control. This structure is used with the EM_FINDTEXTEX message. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The richedit.h header defines FINDTEXTEX as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-findtextexa
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @charset ANSI
 * @architecture X64, Arm64
 */
export default struct FINDTEXTEXA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The range of characters to search. To search forward in the entire control, set <b>cpMin</b> to 0 and <b>cpMax</b> to -1.
     */
    chrg : CHARRANGE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * The null-terminated string to find.
     */
    lpstrText : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The range of characters in which the text was found. If the text was not found, <b>cpMin</b> and <b>cpMax</b> are -1.
     */
    chrgText : CHARRANGE

}
