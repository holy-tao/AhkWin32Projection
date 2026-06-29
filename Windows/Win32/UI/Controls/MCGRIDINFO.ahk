#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MCGRIDINFO_PART.ahk" { MCGRIDINFO_PART }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\MCGRIDINFO_FLAGS.ahk" { MCGRIDINFO_FLAGS }
#Import "..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * Contains information about part of a calendar control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-mcgridinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct MCGRIDINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of this structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwPart : MCGRIDINFO_PART

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    dwFlags : MCGRIDINFO_FLAGS

    /**
     * Type: <b>int</b>
     * 
     * If <b>dwPart</b> is MCGIP_CALENDAR, MCGIP_CALENDARHEADER, MCGIP_CALENDARBODY, MCGIP_CALENDARROW, or MCGIP_CALENDARCELL, this member specifies the index of the calendar for which to retrieve information. For those parts, this must be a valid value even if there is only one calendar that is currently in the control.
     */
    iCalendar : Int32

    /**
     * Type: <b>int</b>
     * 
     * If <b>dwPart</b> is MCGIP_CALENDARROW, specifies the row for which to return information.
     */
    iRow : Int32

    /**
     * Type: <b>int</b>
     * 
     * If <b>dwPart</b> is MCGIP_CALENDARCELL, specifies the column of the cell for which to return information. The <b>iRow</b> member provides the row of the cell for which to return information.
     */
    iCol : Int32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * If <b>dwPart</b> is MCGIP_CALENDARCELL, indicates if the cell described by <b>iRow</b> and <b>iCol</b> is currently selected.
     */
    bSelected : BOOL

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * Returns the start date specified by iCalendar. Used only when <b>dwFlags</b> contains MCGIF_DATE.
     */
    stStart : SYSTEMTIME

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * Returns the end date specified by iCalendar. Used only when <b>dwFlags</b> contains MCGIF_DATE.
     */
    stEnd : SYSTEMTIME

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * Returns the rectangle of the part specified in <b>dwPart</b>. Set only if <b>dwFlags</b> contains MCGIF_RECT.
     */
    rc : RECT

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
     */
    pszName : PWSTR

    /**
     * Type: <b>size_t</b>
     * 
     * Length of <b>pszName</b>, in characters.
     */
    cchName : IntPtr

}
