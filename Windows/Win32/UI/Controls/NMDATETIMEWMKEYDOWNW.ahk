#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Carries information used to describe and handle a DTN_WMKEYDOWN notification code. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The commctrl.h header defines NMDATETIMEWMKEYDOWN as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmdatetimewmkeydownw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class NMDATETIMEWMKEYDOWNW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
     * @type {NMHDR}
     */
    nmhdr{
        get {
            if(!this.HasProp("__nmhdr"))
                this.__nmhdr := NMHDR(this.ptr + 0)
            return this.__nmhdr
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * A virtual key code that represents the key that the user pressed.
     * @type {Integer}
     */
    nVirtKey {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * A zero-terminated substring, taken from the format string, that defines the callback field. The substring is one or more "X" characters, followed by a <b>NULL</b>.
     * @type {PWSTR}
     */
    pszFormat{
        get {
            if(!this.HasProp("__pszFormat"))
                this.__pszFormat := PWSTR(this.ptr + 32)
            return this.__pszFormat
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure containing the current date and time from the DTP control. The owner of the control must modify the time information based on the user's keystroke.
     * @type {SYSTEMTIME}
     */
    st{
        get {
            if(!this.HasProp("__st"))
                this.__st := SYSTEMTIME(this.ptr + 40)
            return this.__st
        }
    }
}
