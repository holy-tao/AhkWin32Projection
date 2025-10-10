#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Passes initialization information to IColumnProvider::Initialize.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj/ns-shlobj-shcolumninit
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHCOLUMNINIT extends Win32Struct
{
    static sizeof => 528

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Initialization flags. Reserved. Set to <b>NULL</b>
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved. Set to <b>NULL</b>.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A pointer to a null-terminated Unicode string with a fully qualified folder path. The string will be empty if multiple folders are specified.
     * @type {String}
     */
    wszFolder {
        get => StrGet(this.ptr + 8, 259, "UTF-16")
        set => StrPut(value, this.ptr + 8, 259, "UTF-16")
    }
}
