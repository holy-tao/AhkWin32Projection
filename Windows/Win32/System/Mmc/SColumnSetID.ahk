#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SColumnSetID structure is introduced in MMC 1.2.
 * @remarks
 * 
 * For details on using the 
 * <b>SColumnSetID</b> structure with the CCF_COLUMN_SET_ID clipboard format, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/ccf-column-set-id">CCF_COLUMN_SET_ID</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ns-mmc-scolumnsetid
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class SColumnSetID extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * Reserved for future use. Must be 0.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The count of bytes in the <b>id</b> array.
     * @type {Integer}
     */
    cBytes {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The bytes that contains the column set ID.
     * @type {Array<Byte>}
     */
    id{
        get {
            if(!this.HasProp("__idProxyArray"))
                this.__idProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__idProxyArray
        }
    }
}
