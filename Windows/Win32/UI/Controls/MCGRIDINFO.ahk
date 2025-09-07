#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\SYSTEMTIME.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information about part of a calendar control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-mcgridinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class MCGRIDINFO extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of this structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwPart {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * If <b>dwPart</b> is MCGIP_CALENDAR, MCGIP_CALENDARHEADER, MCGIP_CALENDARBODY, MCGIP_CALENDARROW, or MCGIP_CALENDARCELL, this member specifies the index of the calendar for which to retrieve information. For those parts, this must be a valid value even if there is only one calendar that is currently in the control.
     * @type {Integer}
     */
    iCalendar {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * Type: <b>int</b>
     * 
     * If <b>dwPart</b> is MCGIP_CALENDARROW, specifies the row for which to return information.
     * @type {Integer}
     */
    iRow {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * If <b>dwPart</b> is MCGIP_CALENDARCELL, specifies the column of the cell for which to return information. The <b>iRow</b> member provides the row of the cell for which to return information.
     * @type {Integer}
     */
    iCol {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>dwPart</b> is MCGIP_CALENDARCELL, indicates if the cell described by <b>iRow</b> and <b>iCol</b> is currently selected.
     * @type {Integer}
     */
    bSelected {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * Returns the start date specified by iCalendar. Used only when <b>dwFlags</b> contains MCGIF_DATE.
     * @type {SYSTEMTIME}
     */
    stStart{
        get {
            if(!this.HasProp("__stStart"))
                this.__stStart := SYSTEMTIME(this.ptr + 32)
            return this.__stStart
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * Returns the end date specified by iCalendar. Used only when <b>dwFlags</b> contains MCGIF_DATE.
     * @type {SYSTEMTIME}
     */
    stEnd{
        get {
            if(!this.HasProp("__stEnd"))
                this.__stEnd := SYSTEMTIME(this.ptr + 48)
            return this.__stEnd
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * Returns the rectangle of the part specified in <b>dwPart</b>. Set only if <b>dwFlags</b> contains MCGIF_RECT.
     * @type {RECT}
     */
    rc{
        get {
            if(!this.HasProp("__rc"))
                this.__rc := RECT(this.ptr + 64)
            return this.__rc
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">PWSTR</a></b>
     * 
     * Pointer to a string for which <b>cchName</b> is the length. Set only if <b>dwFlags</b> contains MCGIF_NAME, and only for the following parts, as described in the <b>dwPart</b> member.
     *                 
     * 
     * <ul>
     * <li>MCGIP_CALENDAR: Returns the text of the selected dates. In the case of multiple selection, returns the date at the start of the selection.</li>
     * <li>MCGIP_CALENDARCELL: Returns the text of the cell indicated by <b>iRow</b> and <b>iCol</b>, for instance "11" if the 11th day was specified.</li>
     * <li>MCGIP_CALENDARHEADER: Returns the text of what it says in the calendar header, for instance "July, 2006".</li>
     * </ul>
     * @type {PWSTR}
     */
    pszName{
        get {
            if(!this.HasProp("__pszName"))
                this.__pszName := PWSTR(this.ptr + 80)
            return this.__pszName
        }
    }

    /**
     * Type: <b>size_t</b>
     * 
     * Length of <b>pszName</b>, in characters.
     * @type {Pointer}
     */
    cchName {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 96
    }
}
