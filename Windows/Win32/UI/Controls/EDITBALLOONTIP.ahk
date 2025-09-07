#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a balloon tip associated with a button control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-editballoontip
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class EDITBALLOONTIP extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * A <b>DWORD</b> that contains the size, in bytes, of the structure.
     * @type {Integer}
     */
    cbStruct {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A pointer to a Unicode string that contains the title of the balloon tip.
     * @type {Pointer<Ptr>}
     */
    pszTitle {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">LPCWSTR</a></b>
     * 
     * A pointer to a Unicode string that contains the balloon tip text.
     * @type {Pointer<Ptr>}
     */
    pszText {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">INT</a></b>
     * @type {Integer}
     */
    ttiIcon {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
