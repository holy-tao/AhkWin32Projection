#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Provides information about tooltip text that is to be set.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-lvsetinfotip
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class LVSETINFOTIP extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * Size of the <b>LVSETINFOTIP</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * Flag that specifies how the text should be set. Set to zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPWSTR</a></b>
     * 
     * Pointer to a Unicode string that contains the tooltip text.
     * @type {PWSTR}
     */
    pszText {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that contains the 
     * zero-based index of the item to which this structure refers.
     * @type {Integer}
     */
    iItem {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>int</b>
     * 
     * Value of type <b>int</b> that contains the one-based index of the subitem to which this structure refers.
     * @type {Integer}
     */
    iSubItem {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 24
    }
}
