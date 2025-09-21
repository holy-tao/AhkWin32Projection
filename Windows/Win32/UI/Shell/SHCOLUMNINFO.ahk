#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PROPERTYKEY.ahk

/**
 * Contains information about the properties of a column. It is used by IColumnProvider::GetColumnInfo.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shcolumninfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SHCOLUMNINFO extends Win32Struct
{
    static sizeof => 448

    static packingSize => 8

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that uniquely identifies the column.
     * @type {PROPERTYKEY}
     */
    scid{
        get {
            if(!this.HasProp("__scid"))
                this.__scid := PROPERTYKEY(this.ptr + 0)
            return this.__scid
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a></b>
     * 
     * The native <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARIANT</a> type of the column's data.
     * @type {Integer}
     */
    vt {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvcolumna">List view format</a>. This member is normally set to LVCFMT_LEFT.
     * @type {Integer}
     */
    fmt {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The default width of the column, in characters.
     * @type {Integer}
     */
    cChars {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags indicating the default column state. It can be a combination of the following flags.
     * @type {Integer}
     */
    csFlags {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * Type: <b>WCHAR[MAX_COLUMN_NAME_LEN]</b>
     * 
     * A null-terminated Unicode string with the column's title. It must contain no more than MAX_COLUMN_NAME_LEN characters, including the terminating <b>NULL</b>.
     * @type {String}
     */
    wszTitle {
        get => StrGet(this.ptr + 32, 79, "UTF-16")
        set => StrPut(value, this.ptr + 32, 79, "UTF-16")
    }

    /**
     * Type: <b>WCHAR[MAX_COLUMN_DESC_LEN]</b>
     * 
     * A null-terminated Unicode string with the column's description. It must contain no more than MAX_COLUMN_DESC_LEN characters, including the terminating <b>NULL</b>.
     * @type {String}
     */
    wszDescription {
        get => StrGet(this.ptr + 192, 127, "UTF-16")
        set => StrPut(value, this.ptr + 192, 127, "UTF-16")
    }
}
