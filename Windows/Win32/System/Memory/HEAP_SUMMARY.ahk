#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The HEAP_SUMMARY structure (heapapi.h) represents a heap summary retrieved with a call to the HeapSummary function.
 * @see https://learn.microsoft.com/windows/win32/api/heapapi/ns-heapapi-heap_summary
 * @namespace Windows.Win32.System.Memory
 */
export default struct HEAP_SUMMARY {
    #StructPack 8

    /**
     * The size of this data structure, in bytes. Set this member to sizeof(HEAP_SUMMARY).
     */
    cb : UInt32

    /**
     * The size of the allocated memory.
     */
    cbAllocated : IntPtr

    /**
     * The size of the committed memory.
     */
    cbCommitted : IntPtr

    /**
     * The size of the reserved memory.
     */
    cbReserved : IntPtr

    /**
     * The size of the maximum reserved memory.
     */
    cbMaxReserve : IntPtr

}
