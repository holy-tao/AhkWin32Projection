#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Holds an extra data block used by IShellLinkDataList. It holds expandable environment strings for the icon or target.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj_core/ns-shlobj_core-exp_sz_link
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EXP_SZ_LINK extends Win32Struct
{
    static sizeof => 1048

    static packingSize => 1

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the <b>EXP_SZ_LINK</b> structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwSignature {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>__wchar_t[MAX_PATH]</b>
     * 
     * The null-terminated ANSI string with the path of the target or icon.
     * @type {String}
     */
    szTarget {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * The null-terminated Unicode string with the path of the target or icon.
     * @type {String}
     */
    swzTarget {
        get => StrGet(this.ptr + 528, 259, "UTF-16")
        set => StrPut(value, this.ptr + 528, 259, "UTF-16")
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 1048
    }
}
