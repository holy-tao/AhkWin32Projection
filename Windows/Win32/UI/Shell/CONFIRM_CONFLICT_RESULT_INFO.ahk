#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines conflict result information structure.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ns-syncmgr-confirm_conflict_result_info
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CONFIRM_CONFLICT_RESULT_INFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>LPWSTR</b>
     * 
     * The new item name.
     * @type {PWSTR}
     */
    pszNewName {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The item index.
     * @type {Integer}
     */
    iItemIndex {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
