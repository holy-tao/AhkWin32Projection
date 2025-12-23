#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines column information. Used by members of the IColumnManager interface.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-cm_columninfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CM_COLUMNINFO extends Win32Struct
{
    static sizeof => 184

    static packingSize => 4

    /**
     * Type: <b>DWORD</b>
     * 
     * The size of the structure, in bytes.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_mask">CM_MASK</a> enumeration that specify which members of this structure are valid.
     * @type {Integer}
     */
    dwMask {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * One or more values from the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_state">CM_STATE</a> enumeration that specify the state of the column.
     * @type {Integer}
     */
    dwState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * One of the members of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-cm_set_width_value">CM_SET_WIDTH_VALUE</a> enumeration that specifies the column width.
     * @type {Integer}
     */
    uWidth {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The default width of the column.
     * @type {Integer}
     */
    uDefaultWidth {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The ideal width of the column.
     * @type {Integer}
     */
    uIdealWidth {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>WCHAR[MAX_COLUMN_NAME_LEN]</b>
     * 
     * A buffer of size MAX_COLUMN_NAME_LEN that contains the name of the column as a null-terminated Unicode string.
     * @type {String}
     */
    wszName {
        get => StrGet(this.ptr + 24, 79, "UTF-16")
        set => StrPut(value, this.ptr + 24, 79, "UTF-16")
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 184
    }
}
