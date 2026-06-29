#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\SIZE.ahk" { SIZE }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Contains information about a date and time picker (DTP) control callback field. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMDATETIMEFORMATQUERY as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmdatetimeformatquerya
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMDATETIMEFORMATQUERYA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * A pointer to a substring that defines a DTP control callback field. The substring is one or more "X" characters followed by a <b>NULL</b>. (For additional information about callback fields, see <a href="https://docs.microsoft.com/windows/desktop/Controls/date-and-time-picker-controls">Callback fields</a>.)
     */
    pszFormat : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/win32/api/windef/ns-windef-size">SIZE</a> structure that must be filled with the maximum size of the text that will be displayed in the callback field.
     */
    szMax : SIZE

}
