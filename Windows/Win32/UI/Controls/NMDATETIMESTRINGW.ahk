#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Contains information specific to an edit operation that has taken place in a date and time picker (DTP) control. This message is used with the DTN_USERSTRING notification code. (Unicode)
 * @remarks
 * > [!NOTE]
  * > The commctrl.h header defines NMDATETIMESTRING as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmdatetimestringw
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset Unicode
 */
class NMDATETIMESTRINGW extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
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
     * The address of the zero-terminated string that the user entered.
     * @type {Pointer<PWSTR>}
     */
    pszUserString {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that must be filled in by the owner when handling the <a href="https://docs.microsoft.com/windows/desktop/Controls/dtn-userstring">DTN_USERSTRING</a> notification code.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The return field. Set this member to GDT_VALID to indicate that the 
     * 					<b>st</b> member is valid or to GDT_NONE to set the control to "no date" status (<a href="https://docs.microsoft.com/windows/desktop/Controls/date-and-time-picker-control-styles">DTS_SHOWNONE</a> style only).
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
