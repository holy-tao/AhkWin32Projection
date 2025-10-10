#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SSortOrder.ahk

/**
 * Do not use. Defines a collection of keys for a table to be used for standard or categorized sorting.
 * @see https://docs.microsoft.com/windows/win32/api//wabdefs/ns-wabdefs-ssortorderset
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SSortOrderSet extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifes the number of <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-ssortorder">SSortOrder</a> structures that are included in the <b>aSort</b> member.
     * @type {Integer}
     */
    cSorts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifes the number of columns that are designated as category columns. Possible values range from zero, which indicates a non-categorized or standard sort, to the number indicated by the <b>cSorts</b> member.
     * @type {Integer}
     */
    cCategories {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>ULONG</b>
     * 
     * Variable of type <b>ULONG</b> that specifies the number of categories that start in an expanded state, where all the rows that apply to the category are visible in the table view. Possible values range from zero to the number indicated by <b>cCategories</b>.
     * @type {Integer}
     */
    cExpanded {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-ssortorder">SSortOrder</a>[MAPI_DIM]</b>
     * 
     * Array of variables of type <a href="https://docs.microsoft.com/windows/desktop/api/wabdefs/ns-wabdefs-ssortorder">SSortOrder</a> that specifies the structures that define a sort order.
     * @type {Array<SSortOrder>}
     */
    aSort{
        get {
            if(!this.HasProp("__aSortProxyArray"))
                this.__aSortProxyArray := Win32FixedArray(this.ptr + 16, 1, SSortOrder, "")
            return this.__aSortProxyArray
        }
    }
}
