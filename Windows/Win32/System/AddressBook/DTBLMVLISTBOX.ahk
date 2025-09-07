#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * DTBLMVLISTBOX describes a multi-valued list that will be displayed in a dialog box that is built from a display table.
 * @remarks
 * A **DTBLMVLISTBOX** structure describes a standard multi-valued list that has a read-only list of items. By using a standard multi-valued list, the values are displayed immediately. 
  *   
  * The data that is displayed comes from the property identified in the **ulMVPropTag** member. There is no requirement to read from the property interface that is associated with the display table. Also, because users are not able to make selections from these types of lists, data is not written to the property interface. 
  *   
  * Only multi-valued string properties are supported for the multi-valued list; other multi-valued property types are not supported. 
  *   
  * For an overview of display tables, see [Display Tables](display-tables.md). For information about how to implement a display table, see [Implementing a Display Table](display-table-implementation.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/dtblmvlistbox
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class DTBLMVLISTBOX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * > Reserved; must be zero.
     * @type {Integer}
     */
    ulFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Property tag for a multi-valued property of type PT_MV_TSTRING.
     * @type {Integer}
     */
    ulMVPropTag {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
