#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents an item in a singly linked list. (SLIST_ENTRY)
 * @remarks
 * All list items must be aligned on a  <b>MEMORY_ALLOCATION_ALIGNMENT</b> boundary. Unaligned items can cause unpredictable results. See <b>_aligned_malloc</b>.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ns-winnt-slist_entry
 * @namespace Windows.Win32.System.Kernel
 */
export default struct SLIST_ENTRY {
    #StructPack 8

    /**
     * A pointer to an 
     * <b>SLIST_ENTRY</b> structure that represents the next item in a singly linked list.
     */
    Next : SLIST_ENTRY.Ptr

}
