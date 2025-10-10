#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Do not use. Defines how to sort rows of a table, describing both the column to use as the sort key and the direction of the sort.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-ssortorder
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SSortOrder extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the property tag identifying either the sort key or, for a categorized sort, the category column.
     * @type {Integer}
     */
    ulPropTag {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the order in which the data is to be sorted. The possible values are as follows.
     * @type {Integer}
     */
    ulOrder {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
