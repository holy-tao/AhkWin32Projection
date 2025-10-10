#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data used by SHAddToRecentDocs to identify both an item�in this case by an absolute pointer to an item identifier list (PIDL)�and the process that it is associated with.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ns-shlobj_core-shardappidinfoidlist
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHARDAPPIDINFOIDLIST extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>PCIDLIST_ABSOLUTE</b>
     * 
     * An absolute PIDL that gives the full path of the item in the Shell namespace.
     * @type {Pointer<ITEMIDLIST>}
     */
    pidl {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>PCWSTR</b>
     * 
     * The application-defined AppUserModelID associated with the item.
     * @type {Pointer<Char>}
     */
    pszAppID {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
