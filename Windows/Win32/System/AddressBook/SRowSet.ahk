#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SRow.ahk" { SRow }
#Import ".\SPropValue.ahk" { SPropValue }

/**
 * Contains an array of SRow structures. Each SRow structure describes a row from a table.
 * @remarks
 * An **SRowSet** structure is used to describe multiple rows of data from a table. **SRowSet** structures are used in the [IAddrBook](iaddrbookimapiprop.md), [ITableData](itabledataiunknown.md), and [IMAPITable](imapitableiunknown.md) interface methods, in addition to the following functions: 
 *   
 * - [HrQueryAllRows](hrqueryallrows.md)
 *     
 * - [FBadRowSet](fbadrowset.md)
 *     
 * - [FreeProws](freeprows.md)
 *     
 *  **SRowSet** structures are defined the same as [ADRLIST](adrlist.md) structures to allow the rows of a recipient table and the entries in an address list to be treated the same. Both **SRowSet** structures and **ADRLIST** structures can be passed to methods such as [IMessage::ModifyRecipients](imessage-modifyrecipients.md) and [IAddrBook::Address](iaddrbook-address.md). 
 *   
 * Also, the rules for memory allocation for **SRowSet** structures are the same as for **ADRLIST** structures. To summarize, each [SPropValue](spropvalue.md) structure in the array pointed to by the **lpProps** member of each row in the row set must be allocated separately using [MAPIAllocateBuffer](mapiallocatebuffer.md). Each property value structure must also be deallocated using [MAPIFreeBuffer](mapifreebuffer.md) before the deallocation of its **SRowSet** structure so that pointers to the allocated **SPropValue** structures are not lost. A row's allocated memory can then be preserved and reused outside the context of the **SRowSet** structure. 
 *   
 * For more information about how the memory for **SRowSet** structures should be allocated, see [Managing Memory for ADRLIST and SRowSet Structures](managing-memory-for-adrlist-and-srowset-structures.md).
 * @see https://learn.microsoft.com/office/client-developer/outlook/mapi/srowset
 * @namespace Windows.Win32.System.AddressBook
 */
export default struct SRowSet {
    #StructPack 8

    /**
     * > Count of **SRow** structures in the **aRow** member.
     */
    cRows : UInt32

    /**
     * > Array of **SRow** structures. There is one structure for each row in the table.
     */
    aRow : SRow[1]

}
