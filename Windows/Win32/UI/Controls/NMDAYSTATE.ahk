#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\NMHDR.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk

/**
 * Carries information required to process the MCN_GETDAYSTATE notification code. All members of this structure are for input, except prgDayState, which the receiving application must set when processing MCN_GETDAYSTATE.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-nmdaystate
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class NMDAYSTATE extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about this notification code.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains the starting date.
     * @type {SYSTEMTIME}
     */
    stStart{
        get {
            if(!this.HasProp("__stStart"))
                this.__stStart := SYSTEMTIME(this.ptr + 24)
            return this.__stStart
        }
    }

    /**
     * Type: <b>int</b>
     * 
     * INT value specifying the total number of elements that must be in the array at 
     * 					<b>prgDayState</b>.
     * @type {Integer}
     */
    cDayState {
        get => NumGet(this, 40, "int")
        set => NumPut("int", value, this, 40)
    }

    /**
     * Type: <b>LPMONTHDAYSTATE</b>
     * 
     * Address of an array of <a href="https://docs.microsoft.com/windows/desktop/Controls/monthdaystate">MONTHDAYSTATE</a> values. The buffer at this address must be large enough to contain at least 
     * 					<b>cDayState</b> elements. The first element in the array corresponds to the date in 
     * 					<b>stStart</b>.
     * @type {Pointer<UInt32>}
     */
    prgDayState {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
