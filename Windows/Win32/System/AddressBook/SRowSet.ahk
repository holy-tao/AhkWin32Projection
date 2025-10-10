#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SRow.ahk

/**
 * Do not use. Contains an array of SRow structures. Each SRow structure describes a row from a table.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-srowset
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SRowSet extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the number of <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-srow">SRow</a> structures in the <b>aRow</b> member.
     * @type {Integer}
     */
    cRows {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-srow">SRow</a>[MAPI_DIM]</b>
     * 
     * Array of variables of type <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-srow">SRow</a> that specifies the structures that represent the rows in the table.
     * @type {Array<SRow>}
     */
    aRow{
        get {
            if(!this.HasProp("__aRowProxyArray"))
                this.__aRowProxyArray := Win32FixedArray(this.ptr + 8, 1, SRow, "")
            return this.__aRowProxyArray
        }
    }
}
