#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information about a date and time picker (DTP) control.
 * @see https://docs.microsoft.com/windows/win32/api//commctrl/ns-commctrl-datetimepickerinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DATETIMEPICKERINFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Set to <c>sizeof(DATETIMEPICKERINFO)</c>. This member must be set before sending a pointer to this structure with the <a href="https://docs.microsoft.com/windows/desktop/Controls/dtm-getdatetimepickerinfo">DTM_GETDATETIMEPICKERINFO</a> message, or the <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/nf-commctrl-datetime_getdatetimepickerinfo">DateTime_GetDateTimePickerInfo</a> macro.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure describing location of checkbox. If a checkbox is displayed and checked, an edit control should be available to update the selected date-time value.
     * @type {RECT}
     */
    rcCheck{
        get {
            if(!this.HasProp("__rcCheck"))
                this.__rcCheck := RECT(this.ptr + 8)
            return this.__rcCheck
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The state of <b>rcCheck</b>—one of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">Object State Constants</a>, such as <b>STATE_SYSTEM_CHECKED</b> or <b>STATE_SYSTEM_INVISIBLE</b>.
     * @type {Integer}
     */
    stateCheck {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure describing the location of a drop-down grid or up/down control.
     * @type {RECT}
     */
    rcButton{
        get {
            if(!this.HasProp("__rcButton"))
                this.__rcButton := RECT(this.ptr + 32)
            return this.__rcButton
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The state of  <b>rcButton</b>— one or a bitwise combination of the <a href="https://docs.microsoft.com/windows/desktop/WinAuto/object-state-constants">Object State Constants</a>, such as <b>STATE_SYSTEM_UNAVAILABLE</b>, <b>STATE_SYSTEM_INVISIBLE</b>, or <b>STATE_SYSTEM_PRESSED</b>. If the up/down control is in use, the state of the button is  <b>STATE_SYSTEM_INVISIBLE</b>.
     * @type {Integer}
     */
    stateButton {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the edit control. For information see, <a href="https://docs.microsoft.com/windows/desktop/Controls/edit-controls">Edit Controls</a>.
     * @type {HWND}
     */
    hwndEdit{
        get {
            if(!this.HasProp("__hwndEdit"))
                this.__hwndEdit := HWND(this.ptr + 56)
            return this.__hwndEdit
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the up/down control—an alternative to using the drop-down grid (looks like month calendar control). For more information, see <a href="https://docs.microsoft.com/windows/desktop/Controls/up-down-controls">Up-Down Controls</a>.
     * @type {HWND}
     */
    hwndUD{
        get {
            if(!this.HasProp("__hwndUD"))
                this.__hwndUD := HWND(this.ptr + 64)
            return this.__hwndUD
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the drop-down grid.
     * @type {HWND}
     */
    hwndDropDown{
        get {
            if(!this.HasProp("__hwndDropDown"))
                this.__hwndDropDown := HWND(this.ptr + 72)
            return this.__hwndDropDown
        }
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 80
    }
}
