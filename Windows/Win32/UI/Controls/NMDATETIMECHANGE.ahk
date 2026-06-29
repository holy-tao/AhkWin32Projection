#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\NMHDR.ahk" { NMHDR }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\SYSTEMTIME.ahk" { SYSTEMTIME }
#Import ".\NMDATETIMECHANGE_FLAGS.ahk" { NMDATETIMECHANGE_FLAGS }

/**
 * Contains information about a change that has taken place in a date and time picker (DTP) control. This structure is used with the DTN_DATETIMECHANGE notification code.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-nmdatetimechange
 * @namespace Windows.Win32.UI.Controls
 */
export default struct NMDATETIMECHANGE {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a></b>
     * 
     * An <a href="https://docs.microsoft.com/windows/desktop/api/richedit/ns-richedit-nmhdr">NMHDR</a> structure that contains information about the notification code.
     */
    nmhdr : NMHDR

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A value that indicates if the control was set to "no date" status (for <a href="https://docs.microsoft.com/windows/desktop/Controls/date-and-time-picker-control-styles">DTS_SHOWNONE</a> only). This flag also specifies whether the contents of the <b>st</b> member are valid and contain current time information. This value can be one of the following: 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GDT_NONE"></a><a id="gdt_none"></a><dl>
     * <dt><b>GDT_NONE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control is set to "no date" status. The "no date" status applies only to controls that are set to the <a href="https://docs.microsoft.com/windows/desktop/Controls/date-and-time-picker-control-styles">DTS_SHOWNONE</a> style.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="GDT_VALID"></a><a id="gdt_valid"></a><dl>
     * <dt><b>GDT_VALID</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The control is not set to the "no date" status. The 
     * 						<b>st</b> member contains the current date and time.
     * 
     * </td>
     * </tr>
     * </table>
     */
    dwFlags : NMDATETIMECHANGE_FLAGS

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-systemtime">SYSTEMTIME</a> structure that contains information about the current system date and time.
     */
    st : SYSTEMTIME

}
