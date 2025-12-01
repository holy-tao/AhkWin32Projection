#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines Shell item resource.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-shell_item_resource
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHELL_ITEM_RESOURCE extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * The <b>GUID</b> that identifies the item.
     * @type {Pointer<Guid>}
     */
    guidType {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * The item name. A null-terminated Unicode buffer of size MAX_LENGTH characters.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }
}
