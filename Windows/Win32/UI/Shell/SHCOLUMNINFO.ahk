#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\System\Variant\VARENUM.ahk" { VARENUM }
#Import "..\..\Foundation\PROPERTYKEY.ahk" { PROPERTYKEY }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains information about the properties of a column. It is used by IColumnProvider::GetColumnInfo.
 * @see https://learn.microsoft.com/windows/win32/api/shlobj/ns-shlobj-shcolumninfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct SHCOLUMNINFO {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a></b>
     * 
     * A <a href="https://docs.microsoft.com/windows/desktop/shell/objects">SHCOLUMNID</a> structure that uniquely identifies the column.
     */
    scid : PROPERTYKEY

    /**
     * Type: <b><a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARTYPE</a></b>
     * 
     * The native <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms221127(v=vs.85)">VARIANT</a> type of the column's data.
     */
    vt : VARENUM

    /**
     * Type: <b>DWORD</b>
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/commctrl/ns-commctrl-lvcolumna">List view format</a>. This member is normally set to LVCFMT_LEFT.
     */
    fmt : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The default width of the column, in characters.
     */
    cChars : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * Flags indicating the default column state. It can be a combination of the following flags.
     */
    csFlags : UInt32

    /**
     * Type: <b>WCHAR[MAX_COLUMN_NAME_LEN]</b>
     * 
     * A null-terminated Unicode string with the column's title. It must contain no more than MAX_COLUMN_NAME_LEN characters, including the terminating <b>NULL</b>.
     */
    wszTitle : WCHAR[80]

    /**
     * Type: <b>WCHAR[MAX_COLUMN_DESC_LEN]</b>
     * 
     * A null-terminated Unicode string with the column's description. It must contain no more than MAX_COLUMN_DESC_LEN characters, including the terminating <b>NULL</b>.
     */
    wszDescription : WCHAR[128]

}
