#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains combo box status information.
 * @remarks
 * 
 * The following example code retrieves information about the combo box specified by the window handle.
 * 
 * 
 * ```
 * COMBOBOXINFO info = { sizeof(COMBOBOXINFO) };
 * GetComboBoxInfo(hwnd, &info);
 * 
 * ```
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winuser/ns-winuser-comboboxinfo
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class COMBOBOXINFO extends Win32Struct
{
    static sizeof => 72

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size, in bytes, of the structure. The calling application must set this to sizeof(COMBOBOXINFO).
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the coordinates of the edit box.
     * @type {RECT}
     */
    rcItem{
        get {
            if(!this.HasProp("__rcItem"))
                this.__rcItem := RECT(8, this)
            return this.__rcItem
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the coordinates of the button that contains the drop-down arrow.
     * @type {RECT}
     */
    rcButton{
        get {
            if(!this.HasProp("__rcButton"))
                this.__rcButton := RECT(24, this)
            return this.__rcButton
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * @type {Integer}
     */
    stateButton {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the combo box.
     * @type {HWND}
     */
    hwndCombo{
        get {
            if(!this.HasProp("__hwndCombo"))
                this.__hwndCombo := HWND(48, this)
            return this.__hwndCombo
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the edit box.
     * @type {HWND}
     */
    hwndItem{
        get {
            if(!this.HasProp("__hwndItem"))
                this.__hwndItem := HWND(56, this)
            return this.__hwndItem
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the drop-down list.
     * @type {HWND}
     */
    hwndList{
        get {
            if(!this.HasProp("__hwndList"))
                this.__hwndList := HWND(64, this)
            return this.__hwndList
        }
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 72
    }
}
