#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\COMBOBOXINFO_BUTTON_STATE.ahk" { COMBOBOXINFO_BUTTON_STATE }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * Contains combo box status information.
 * @remarks
 * The following example code retrieves information about the combo box specified by the window handle.
 * 
 * 
 * ```
 * COMBOBOXINFO info = { sizeof(COMBOBOXINFO) };
 * GetComboBoxInfo(hwnd, &info);
 * 
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-comboboxinfo
 * @namespace Windows.Win32.UI.Controls
 */
export default struct COMBOBOXINFO {
    #StructPack 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The size, in bytes, of the structure. The calling application must set this to sizeof(COMBOBOXINFO).
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the coordinates of the edit box.
     */
    rcItem : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that specifies the coordinates of the button that contains the drop-down arrow.
     */
    rcButton : RECT

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     */
    stateButton : COMBOBOXINFO_BUTTON_STATE

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the combo box.
     */
    hwndCombo : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the edit box.
     */
    hwndItem : HWND

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the drop-down list.
     */
    hwndList : HWND

}
