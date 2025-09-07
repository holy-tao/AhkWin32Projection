#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a row from a table that contains selected properties for a specific object. When more than one row needs to be described, an SRowSet structure is used.
 * @remarks
 * An **SRow** structure describes a row in a table. It is included in the [TABLE_NOTIFICATION](table_notification.md) structure that accompanies a table notification. 
  *   
  * **SRow** structures are used in the following methods: 
  *   
  * - [IAddrBook::GetSearchPath](iaddrbook-getsearchpath.md)
  *     
  * - [IAddrBook::SetSearchPath](iaddrbook-setsearchpath.md)
  *     
  * - [IMAPITable::QueryRows](imapitable-queryrows.md)
  *     
  * - [IMAPITable::ExpandRow](imapitable-expandrow.md)
  *     
  * - [ITableData : IUnknown](itabledataiunknown.md) (many methods) 
  *     
  * - [FBadRowSet](fbadrowset.md)
  *     
  * - [FreeProws](freeprows.md)
  *     
  * - [HrQueryAllRows](hrqueryallrows.md)
  *     
  * When more than one row needs to be described, an [SRowSet](srowset.md) structure is used. An **SRowSet** structure contains an array of **SRow** structures and a count of structures in the array. 
  *   
  * The following illustration shows the relationship between an **SRow** and an **SRowSet** data structure. 
  *   
  * **Relationship between SRow and SRowSet**
  *   
  * ![Relationship between SRow and SRowSet](media/amapi_17.gif "Relationship between SRow and SRowSet")
  *   
  * **SRow** structures are defined the same as [ADRENTRY](adrentry.md) structures. Therefore, a row of a recipient table and an entry in an address list can be treated the same. 
  *   
  * For information about how the memory for **SRow** structures should be allocated, see [Managing Memory for ADRLIST and SRowSet Structures](managing-memory-for-adrlist-and-srowset-structures.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/srow
 * @namespace Windows.Win32.System.AddressBook
 * @version v4.0.30319
 */
class SRow extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * > Padding bytes to properly align the property values pointed to by the **lpProps** member.
     * @type {Integer}
     */
    ulAdrEntryPad {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * > Count of property values pointed to by **lpProps**.
     * @type {Integer}
     */
    cValues {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * > Pointer to an array of [SPropValue](spropvalue.md) structures that describe the property values for the columns in the row.
     * @type {Pointer<SPropValue>}
     */
    lpProps {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
