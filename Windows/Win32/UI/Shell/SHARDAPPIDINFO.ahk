#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data used by SHAddToRecentDocs to identify both an item�in this case as an IShellItem�and the process that it is associated with.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-shardappidinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHARDAPPIDINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a>*</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitem">IShellItem</a> object that represents the object in the Shell namespace.
     * @type {IShellItem}
     */
    psi {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>PCWSTR</b>
     * 
     * The application-defined AppUserModelID associated with the item.
     * @type {PWSTR}
     */
    pszAppID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
