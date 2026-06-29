#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A SINGLE_LIST_ENTRY structure describes an entry in a singly linked list, or serves as the header for such a list.
 * @remarks
 * If a <b>SINGLE_LIST_ENTRY</b> structure is used as a list head, initialize the <b>Next</b> member of the structure to be <b>NULL</b>.
 * 
 * A driver can access the <b>Next</b> member of a <b>SINGLE_LIST_ENTRY</b>, but (other than initializing a list head) <b>Next</b> must only be updated by the system routines supplied for this purpose.
 * 
 * For more information about how to use <b>SINGLE_LIST_ENTRY</b> structures to implement a singly linked list, see <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/singly-and-doubly-linked-lists">Singly and Doubly Linked Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntdef/ns-ntdef-single_list_entry
 * @namespace Windows.Win32.System.Kernel
 */
export default struct SINGLE_LIST_ENTRY {
    #StructPack 8

    /**
     * For a <b>SINGLE_LIST_ENTRY</b> that serves as a list entry, the <b>Next</b> member points to the next entry in the list, or <b>NULL</b> if there is no next entry in the list. For a <b>SINGLE_LIST_ENTRY</b> that serves as the list header, the <b>Next</b> member points to the first entry in the list, or <b>NULL</b> if the list is empty.
     */
    Next : SINGLE_LIST_ENTRY.Ptr

}
