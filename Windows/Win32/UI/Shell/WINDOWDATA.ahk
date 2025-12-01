#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores window data.
 * @see https://learn.microsoft.com/windows/win32/api/tlogstg/ns-tlogstg-windowdata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class WINDOWDATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The window ID.
     * @type {Integer}
     */
    dwWindowID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The codepage of the current entry.
     * @type {Integer}
     */
    uiCP {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>PIDLIST_ABSOLUTE</b>
     * 
     * The current PIDL.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer to hold the window URL.
     * @type {PWSTR}
     */
    lpszUrl {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer to hold the window URL Location (local anchor).
     * @type {PWSTR}
     */
    lpszUrlLocation {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: <b>LPWSTR</b>
     * 
     * A pointer to a buffer to hold the window title.
     * @type {PWSTR}
     */
    lpszTitle {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
