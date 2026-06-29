#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * Carries information used to describe and handle a DTN_WMKEYDOWN notification code. (ANSI)
 * @remarks
 * > [!NOTE]
 * > The commctrl.h header defines NMDATETIMEWMKEYDOWN as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmdatetimewmkeydowna
 * @namespace Windows.Win32.UI.Controls
 * @charset ANSI
 */
export default struct NMDATETIMEWMKEYDOWNA {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
     */
    nmhdr : NMHDR

    /**
     * Type: <b>int</b>
     * 
     * A virtual key code that represents the key that the user pressed.
     */
    nVirtKey : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * A zero-terminated substring, taken from the format string, that defines the callback field. The substring is one or more "X" characters, followed by a <b>NULL</b>.
     */
    pszFormat : PSTR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure containing the current date and time from the DTP control. The owner of the control must modify the time information based on the user's keystroke.
     */
    st : SYSTEMTIME

}
