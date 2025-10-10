#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains category information. A component category is a group of logically-related Component Object Model (COM) classes that share a common category identifier (CATID).
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ns-shobjidl_core-category_info
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CATEGORY_INFO extends Win32Struct
{
    static sizeof => 524

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-categoryinfo_flags">CATEGORYINFO_FLAGS</a></b>
     * 
     * A flag from <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-categoryinfo_flags">CATEGORYINFO_FLAGS</a> that specifies the type of information to retrieve.
     * @type {Integer}
     */
    cif {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>WCHAR[260]</b>
     * 
     * A character array that specifies the name of the category.
     * @type {String}
     */
    wszName {
        get => StrGet(this.ptr + 4, 259, "UTF-16")
        set => StrPut(value, this.ptr + 4, 259, "UTF-16")
    }
}
