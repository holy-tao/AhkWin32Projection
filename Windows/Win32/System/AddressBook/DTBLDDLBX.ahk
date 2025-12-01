#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DTBLDDLBX describes a drop-down list control that will be used in a dialog box built from a display table.
 * @remarks
 * A **DTBLDDLBX** structure describes a drop-down list control that is displayed as a single item until the user elects to expand it. 
 *   
 * The three properties identified by the property tags work together to display the information in the list and set a related property. The **ulPRTableName** member is a table object that is accessed through a call to [IMAPIProp::OpenProperty](imapiprop-openproperty.md). The table has two columns: one column for the property identified by the **ulPRDisplayProperty** member and the other for the property identified by the **ulPRSetProperty** member. 
 *   
 * The **ulPRDisplayProperty** property drives the list display. When a user selects one of the values from the display, MAPI calls [IMAPIProp::SetProps](imapiprop-setprops.md) to set the corresponding property as identified by the **ulPRSetProperty** member. This means that the property in the same row as the selected display property. The **ulPRSetProperty** member cannot be set to **PR_NULL** ([PidTagNull](pidtagnull-canonical-property.md)).
 *   
 * An initial value is displayed in the list if MAPI has retrieved the property represented by the **ulPRSetProperty** member through a call to [IMAPIProp::GetProps](imapiprop-getprops.md) and located a row in the table with the value for the **ulPRSetProperty** member. The initial displayed value is the contents of the **ulPRDisplayProperty** column from that row that matches the property in the **ulPRDisplayProperty** member of the structure. The value returned by **GetProps** for the property identified by the **ulPRDisplayProperty** member becomes the initial value that is shown when the list is first displayed. 
 *   
 * For an overview of display tables, see [Display Tables](display-tables.md). For information about how to implement a display table, see [Implementing a Display Table](display-table-implementation.md). For information about property types, see [MAPI Property Type Overview](mapi-property-type-overview.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtblddlbx
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTBLDDLBX extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * > Reserved, must be zero.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Property tag for a property of type PT_TSTRING. This property is one of the columns in the table identified by the **ulPRTableName** member. The values for this property are displayed in the list.
     * @type {Integer}
     */
    ulPRDisplayProperty {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Property tag for a property of any type. This property is one of the columns in the table identified by the **ulPRTableName** member. When the user of the list selects a property value for the **ulPRDisplayProperty** member from the rows of the table identified by the **ulPRTableName** member, the corresponding **ulPRSetProperty** member is set.
     * @type {Integer}
     */
    ulPRSetProperty {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * > Property tag for a table property of type PT_OBJECT that can be opened by using an **OpenProperty** call. The table should have two columns: **ulPRDisplayProperty** and **ulPRSetProperty**. The rows of the table should correspond to items in the list.
     * @type {Integer}
     */
    ulPRTableName {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
