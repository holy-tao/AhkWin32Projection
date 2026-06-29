#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about header control text filters. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines HD_TEXTFILTER as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-hd_textfilterw
 * @namespace Windows.Win32.UI.Controls
 * @charset Unicode
 */
export default struct HD_TEXTFILTERW {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPTSTR</a></b>
     * 
     * A pointer to the buffer containing the filter.
     */
    pszText : PWSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * 
     * A value specifying the maximum size, in characters, for an edit control buffer.
     */
    cchTextMax : Int32

}
