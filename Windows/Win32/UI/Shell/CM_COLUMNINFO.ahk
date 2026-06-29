#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Defines column information. Used by members of the IColumnManager interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-cm_columninfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CM_COLUMNINFO {
    #StructPack 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: <b>DWORD</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_mask">CM_MASK</a> enumeration that specify which members of this structure are valid.
     */
    dwMask : UInt32

    /**
     * Type: <b>DWORD</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_state">CM_STATE</a> enumeration that specify the state of the column.
     */
    dwState : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_set_width_value">CM_SET_WIDTH_VALUE</a> enumeration that specifies the column width.
     */
    uWidth : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The default width of the column.
     */
    uDefaultWidth : UInt32

    /**
     * Type: <b>UINT</b>
     * 
     * The ideal width of the column.
     */
    uIdealWidth : UInt32

    /**
     * Type: <b>WCHAR[MAX_COLUMN_NAME_LEN]</b>
     * 
     * A buffer of size MAX_COLUMN_NAME_LEN that contains the name of the column as a null-terminated Unicode string.
     */
    wszName : WCHAR[80]

}
