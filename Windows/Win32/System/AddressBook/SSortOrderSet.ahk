#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SSortOrder.ahk

/**
 * Defines a collection of sort keys for a table that is used for standard or categorized sorting.
 * @remarks
 * A **SSortOrderSet** structure is used for defining multiple sort orders for standard and categorized sorting. 
  *   
  * Each **SSortOrderSet** structure contains at least one **SSortOrder** structure defining the direction of the sort and the column that will be used as the sort key. For categorized sorting, this column is used as the category. When the value of the **cSorts** member exceeds the value of the **cCategories** member, there are more sort keys than categories, and categories are created from the columns that appear first in the **SSortOrder** array. 
  *   
  * For example, if **cSorts** is set to 3 and **cCategories** is set to 2, the columns described by the **ulPropTag** member of the first two entries in the **SSortOrder** array are used as the category columns. The first entry serves as the top-level category grouping; the second entry as the secondary grouping. All of the rows that match the two category columns are sorted by using the sort key defined in the third entry. 
  *   
  * The **cExpanded** member specifies the number of categories that are at first expanded. When there are multiple categories, the table implementation starts with the first column to be designated as a category and continues in sequential order with the subsequent category columns until the number of **cCategories** has been exceeded. If there are more category columns than there are expanded columns, the category columns are collapsed. If **cExpanded** is equal to zero, only the top level heading row is available to the table user for display. If **cExpanded** is equal to one less than the number of categories, then all of the heading rows and none of the leaf rows are available. If **cExpanded** is equal to the number of categories, then the table is fully expanded. 
  *   
  * For more information about standard and categorized sorting, see [Sorting and Categorization](sorting-and-categorization.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/ssortorderset
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SSortOrderSet extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * > Count of [SSortOrder](ssortorder.md) structures that are included in the **aSort** member.
     * @type {Integer}
     */
    cSorts {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Count of columns that are designated as category columns. Possible values range from zero, which indicates a non-categorized or standard sort, to the number indicated by the **cSorts** member.
     * @type {Integer}
     */
    cCategories {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Count of categories that start in an expanded state, where all of the rows that apply to the category are visible in the table view. Possible values range from 0 to the number indicated by **cCategories**.
     * @type {Integer}
     */
    cExpanded {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * > Array of **SSortOrder** structures, each defining a sort order.
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
