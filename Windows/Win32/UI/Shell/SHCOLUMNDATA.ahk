#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains information that identifies a particular file. It is used by IColumnProvider::GetItemData when requesting data for a particular file.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shcolumndata
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHCOLUMNDATA extends Win32Struct
{
    static sizeof => 544

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Flags used to specify the nature of the request.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * @type {Integer}
     */
    dwFileAttributes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Reserved. Set to <b>NULL</b>.
     * @type {Integer}
     */
    dwReserved {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>WCHAR*</b>
     * 
     * A pointer to a null-terminated Unicode string with a file name extension.
     * @type {PWSTR}
     */
    pwszExt{
        get {
            if(!this.HasProp("__pwszExt"))
                this.__pwszExt := PWSTR(this.ptr + 16)
            return this.__pwszExt
        }
    }

    /**
     * Type: <b>WCHAR[MAX_PATH]</b>
     * 
     * A null-terminated Unicode string containing a fully qualified file path.
     * @type {String}
     */
    wszFile {
        get => StrGet(this.ptr + 24, 259, "UTF-16")
        set => StrPut(value, this.ptr + 24, 259, "UTF-16")
    }
}
