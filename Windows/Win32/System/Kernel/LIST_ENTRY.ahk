#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * A LIST_ENTRY structure describes an entry in a doubly linked list or serves as the header for such a list.
 * @remarks
 * A <b>LIST_ENTRY</b> structure that describes the list head must have been initialized by calling <a href="https://docs.microsoft.com/windows-hardware/drivers/ddi/content/wdm/nf-wdm-initializelisthead">InitializeListHead</a>.
 * 
 * A driver can access the <b>Flink</b> or <b>Blink</b> members of a <b>LIST_ENTRY</b>, but the members must only be updated by the system routines supplied for this purpose.
 * 
 * For more information about how to use <b>LIST_ENTRY</b> structures to implement a doubly linked list, see <a href="https://docs.microsoft.com/windows-hardware/drivers/kernel/singly-and-doubly-linked-lists">Singly and Doubly Linked Lists</a>.
 * @see https://learn.microsoft.com/windows/win32/api/ntdef/ns-ntdef-list_entry
 * @namespace Windows.Win32.System.Kernel
 */
export default struct LIST_ENTRY {
    #StructPack 8

    /**
     * For a <b>LIST_ENTRY</b> structure that serves as a list entry, the <b>Flink</b> member points to the next entry in the list or to the list header if there is no next entry in the list. 
     * 
     * For a <b>LIST_ENTRY</b> structure that serves as the list header, the <b>Flink</b> member points to the first entry in the list or to the LIST_ENTRY structure itself if the list is empty.
     */
    Flink : LIST_ENTRY.Ptr

    /**
     * For a <b>LIST_ENTRY</b> structure that serves as a list entry, the <b>Blink</b> member points to the previous entry in the list or to the list header if there is no previous entry in the list.
     * 
     * For a <b>LIST_ENTRY</b> structure that serves as the list header, the <b>Blink</b> member points to the last entry in the list or to the <b>LIST_ENTRY</b> structure itself if the list is empty.
     */
    Blink : LIST_ENTRY.Ptr

}
