#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Provides information about the title of a tooltip control.
 * @see https://learn.microsoft.com/windows/win32/api/commctrl/ns-commctrl-ttgettitle
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 */
class TTGETTITLE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">DWORD</a></b>
     * 
     * <b>DWORD</b> that specifies size of structure. Set to sizeof(TTGETTITLE).
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * <b>UINT</b> that specifies the tooltip icon.
     * @type {Integer}
     */
    uTitleBitmap {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * <b>UINT</b> that specifies the number of characters in the title.
     * @type {Integer}
     */
    cch {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">WCHAR</a>*</b>
     * 
     * Pointer to a wide character string that contains the title.
     * @type {PWSTR}
     */
    pszTitle{
        get {
            if(!this.HasProp("__pszTitle"))
                this.__pszTitle := PWSTR(this.ptr + 16)
            return this.__pszTitle
        }
    }
}
