#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains information about a date and time picker (DTP) control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-datetimepickerinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct DATETIMEPICKERINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Set to <c>sizeof(DATETIMEPICKERINFO)</c>. This member must be set before sending a pointer to this structure with the <a href="https://docs.microsoft.com/windows/desktop/Controls/dtm-getdatetimepickerinfo">DTM_GETDATETIMEPICKERINFO</a> message, or the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-datetime_getdatetimepickerinfo">DateTime_GetDateTimePickerInfo</a> macro.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure describing location of checkbox. If a checkbox is displayed and checked, an edit control should be available to update the selected date-time value.
     */
    rcCheck : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The state of <b>rcCheck</b>—one of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">Object State Constants</a>, such as <b>STATE_SYSTEM_CHECKED</b> or <b>STATE_SYSTEM_INVISIBLE</b>.
     */
    stateCheck : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure describing the location of a drop-down grid or up/down control.
     */
    rcButton : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The state of  <b>rcButton</b>— one or a bitwise combination of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">Object State Constants</a>, such as <b>STATE_SYSTEM_UNAVAILABLE</b>, <b>STATE_SYSTEM_INVISIBLE</b>, or <b>STATE_SYSTEM_PRESSED</b>. If the up/down control is in use, the state of the button is  <b>STATE_SYSTEM_INVISIBLE</b>.
     */
    stateButton : UInt32

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the edit control. For information see, <a href="https://docs.microsoft.com/windows/desktop/Controls/edit-controls">Edit Controls</a>.
     */
    hwndEdit : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the up/down control—an alternative to using the drop-down grid (looks like month calendar control). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/up-down-controls">Up-Down Controls</a>.
     */
    hwndUD : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the drop-down grid.
     */
    hwndDropDown : HWND

}
