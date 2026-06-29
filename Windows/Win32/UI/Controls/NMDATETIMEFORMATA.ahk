#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }
#Import "..\..\Foundation\CHAR.ahk" { CHAR }

/**
 * Contains information about a portion of the format string that defines a callback field within a date and time picker (DTP) control. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMDATETIMEFORMAT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmdatetimeformata
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMDATETIMEFORMATA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * A pointer to the substring that defines a DTP control callback field. The substring consists of one or more "X" characters followed by a NULL character. (For more information about callback fields, see <a href="https://docs.microsoft.com/windows/desktop/Controls/date-and-time-picker-controls">Callback fields</a>.)
     */
    pszFormat : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to be formatted.
     */
    st : SYSTEMTIME

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * A pointer to a null-terminated string that contains the display text of the control. By default, this is the address of the 
     * 					<b>szDisplay</b> member of this structure. It is acceptable to have <b>pszDisplay</b> point to an existing string. In this case, you do not need to assign a value to <b>szDisplay</b>. However, the string that 
     * <b>pszDisplay</b> points to must remain valid until another <a href="https://docs.microsoft.com/windows/desktop/Controls/dtn-format">DTN_FORMAT</a> notification is sent, or until the control is destroyed.
     */
    pszDisplay : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">TCHAR</a></b>
     * 
     * 64-character buffer that is to receive the zero-terminated string that the DTP control will display. It is not necessary to fill the entire buffer.
     */
    szDisplay : CHAR[64]

}
