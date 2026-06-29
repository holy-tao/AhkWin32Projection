#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\CHARRANGE.ahk" { CHARRANGE }

/**
 * Contains information about a search operation in a rich edit control. This structure is used with the EM_FINDTEXT message. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The richedit.h header defines FINDTEXT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/richedit/ns-richedit-findtextw
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @charset Unicode
 * @architecture X64, Arm64
 */
export default struct FINDTEXTW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/richedit/ns-richedit-charrange">CHARRANGE</a></b>
     * 
     * The range of characters to search.
     */
    chrg : CHARRANGE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * The null-terminated string used in the find operation.
     */
    lpstrText : PWSTR

}
