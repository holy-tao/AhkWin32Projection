#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Contains information about a portion of the format string that defines a callback field within a date and time picker (DTP) control. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The commctrl.h header defines NMDATETIMEFORMAT as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmdatetimeformatw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class NMDATETIMEFORMATW extends Win32Struct
{
    static sizeof => 184

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * A pointer to the substring that defines a DTP control callback field. The substring consists of one or more "X" characters followed by a NULL character. (For more information about callback fields, see <a href="https://docs.microsoft.com/windows/desktop/Controls/date-and-time-picker-controls">Callback fields</a>.)
     * @type {Pointer<PWSTR>}
     */
    pszFormat {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date and time to be formatted.
     * @type {SYSTEMTIME}
     */
    st{
        get {
            if(!this.HasProp("__st"))
                this.__st := SYSTEMTIME(this.ptr + 32)
            return this.__st
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCTSTR</a></b>
     * 
     * A pointer to a null-terminated string that contains the display text of the control. By default, this is the address of the 
     * 					<b>szDisplay</b> member of this structure. It is acceptable to have <b>pszDisplay</b> point to an existing string. In this case, you do not need to assign a value to <b>szDisplay</b>. However, the string that 
     * <b>pszDisplay</b> points to must remain valid until another <a href="https://docs.microsoft.com/windows/desktop/Controls/dtn-format">DTN_FORMAT</a> notification is sent, or until the control is destroyed.
     * @type {Pointer<PWSTR>}
     */
    pszDisplay {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">TCHAR</a></b>
     * 
     * 64-character buffer that is to receive the zero-terminated string that the DTP control will display. It is not necessary to fill the entire buffer.
     * @type {String}
     */
    szDisplay {
        get => StrGet(this.ptr + 56, 63, "UTF-16")
        set => StrPut(value, this.ptr + 56, 63, "UTF-16")
    }
}
