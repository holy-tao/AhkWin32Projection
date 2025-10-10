#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used by an IEnumExtraSearch enumerator object to return information on the search objects supported by a Shell Folder object.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-extrasearch
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EXTRASEARCH extends Win32Struct
{
    static sizeof => 4336

    static packingSize => 8

    /**
     * Type: <b>GUID</b>
     * 
     * A search object's GUID.
     * @type {Pointer<Guid>}
     */
    guidSearch {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>WCHAR[80]</b>
     * 
     * A Unicode string containing the search object's friendly name. It will be used to identify the search engine on the Search Assistant menu.
     * @type {String}
     */
    wszFriendlyName {
        get => StrGet(this.ptr + 8, 79, "UTF-16")
        set => StrPut(value, this.ptr + 8, 79, "UTF-16")
    }

    /**
     * Type: <b>WCHAR[2084]</b>
     * 
     * The URL that will be displayed in the search pane.
     * @type {String}
     */
    wszUrl {
        get => StrGet(this.ptr + 168, 2083, "UTF-16")
        set => StrPut(value, this.ptr + 168, 2083, "UTF-16")
    }
}
