#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines Shell item resource.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-shell_item_resource
 * @namespace Windows.Win32.UI.Shell
 */
class SHELL_ITEM_RESOURCE extends Win32Struct {
    static sizeof => 536

    static packingSize => 4

    /**
     * Type: <b>GUID</b>
     * 
     * The <b>GUID</b> that identifies the item.
     * @type {Guid}
     */
    guidType {
        get {
            if(!this.HasProp("__guidType"))
                this.__guidType := Guid(0, this)
            return this.__guidType
        }
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * The item name. A null-terminated Unicode buffer of size MAX_LENGTH characters.
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 16, 259, "UTF-16")
        set => StrPut(value, this.ptr + 16, 259, "UTF-16")
    }
}
