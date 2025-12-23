#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Supplies the identifiers and application-supplied data for two items in a sorted, owner-drawn list box or combo box.
 * @see https://learn.microsoft.com/windows/win32/api/winuser/ns-winuser-compareitemstruct
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class COMPAREITEMSTRUCT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * An ODT_LISTBOX (owner-drawn list box) or ODT_COMBOBOX (an owner-drawn combo box).
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
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HWND</a></b>
     * 
     * A handle to the control.
     * @type {HWND}
     */
    hwndItem{
        get {
            if(!this.HasProp("__hwndItem"))
                this.__hwndItem := HWND(8, this)
            return this.__hwndItem
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the first item in the list box or combo box being compared. This member will be –1 if the item has not been inserted or when searching for a potential item in the list box or combo box.
     * @type {Integer}
     */
    itemID1 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG_PTR</a></b>
     * 
     * Application-supplied data for the first item being compared. (This value was passed as the <i>lParam</i> parameter of the message that added the item to the list box or combo box.)
     * @type {Pointer}
     */
    itemData1 {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The index of the second item in the list box or combo box being compared.
     * @type {Integer}
     */
    itemID2 {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">ULONG_PTR</a></b>
     * 
     * Application-supplied data for the second item being compared. This value was passed as the 
     * 					<i>lParam</i> parameter of the message that added the item to the list box or combo box. This member will be 
     * 					–1 if the item has not been inserted or when searching for a potential item in the list box or combo box.
     * @type {Pointer}
     */
    itemData2 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * The locale identifier. To create a locale identifier, use the <a href="https://docs.microsoft.com/windows/desktop/api/winnt/nf-winnt-makelcid">MAKELCID</a> macro.
     * @type {Integer}
     */
    dwLocaleId {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }
}
