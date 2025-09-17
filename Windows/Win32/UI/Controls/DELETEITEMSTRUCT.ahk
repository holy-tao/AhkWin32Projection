#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a deleted list box or combo box item.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-deleteitemstruct
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class DELETEITEMSTRUCT extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * @type {Integer}
     */
    CtlType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The identifier of the list box or combo box.
     * @type {Integer}
     */
    CtlID {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the item in the list box or combo box being removed.
     * @type {Integer}
     */
    itemID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the control.
     * @type {Pointer<Void>}
     */
    hwndItem {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG_PTR</a></b>
     * 
     * Application-defined data for the item. This value is passed to the control in the <i>lParam</i> parameter of the message that adds the item to the list box or combo box.
     * @type {Pointer}
     */
    itemData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
