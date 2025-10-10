#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Carries information required to process the MCN_SELCHANGE notification code.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmselchange
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMSELCHANGE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification.
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date for the first day in the user's selection range.
     * @type {SYSTEMTIME}
     */
    stSelStart{
        get {
            if(!this.HasProp("__stSelStart"))
                this.__stSelStart := SYSTEMTIME(this.ptr + 24)
            return this.__stSelStart
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the date for the last day in the user's selection range.
     * @type {SYSTEMTIME}
     */
    stSelEnd{
        get {
            if(!this.HasProp("__stSelEnd"))
                this.__stSelEnd := SYSTEMTIME(this.ptr + 40)
            return this.__stSelEnd
        }
    }
}
