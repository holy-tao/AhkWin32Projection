#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the class of heap information to be set or retrieved.
 * @remarks
 * To retrieve information about a heap, use the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapqueryinformation">HeapQueryInformation</a> function. To enable features for a heap, use the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapsetinformation">HeapSetInformation</a> function.
  * 
  * <b>Windows XP and Windows Server 2003:  </b> A look-aside list is a fast memory allocation mechanism that contains only fixed-sized blocks. Look-aside lists are enabled by default for heaps that support them. Starting with Windows Vista, look-aside lists are not used and the LFH is enabled by default.
  * 
  * Look-aside lists are faster than general pool allocations that vary in size, because the system does not search for free memory that fits the allocation. In addition, access to look-aside lists is generally synchronized using fast atomic processor exchange instructions instead of mutexes or spinlocks. Look-aside lists can be created by the system or drivers. They can be allocated from paged or nonpaged pool.
 * @see https://learn.microsoft.com/windows/win32/api/winnt/ne-winnt-heap_information_class
 * @namespace Windows.Win32.System.Memory
 * @version v4.0.30319
 */
class HEAP_INFORMATION_CLASS{

    /**
     * The heap features that are enabled. The available features vary based on operating system. Depending on the <i>HeapInformation</i> parameter in the <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapqueryinformation">HeapQueryInformation</a> or <a href="https://docs.microsoft.com/windows/desktop/api/heapapi/nf-heapapi-heapsetinformation">HeapSetInformation</a> functions, specifying this enumeration value can indicate one of the following features:
 * 
 * <ul>
 * <li>A standard heap that does not support look-aside lists.</li>
 * <li>A heap that supports look-aside lists.</li>
 * <li>A <a href="https://docs.microsoft.com/windows/desktop/Memory/low-fragmentation-heap">low-fragmentation heap</a> (LFH), which does not support look-aside lists.</li>
 * </ul>
 * For more information about look-aside lists, see the Remarks section.
     * @type {Integer (Int32)}
     */
    static HeapCompatibilityInformation => 0

    /**
     * The terminate-on-corruption feature. If the heap manager detects an error in any heap used by the 
 *          process, it calls the Windows Error Reporting service and terminates the process.
 * 
 * After a process enables this feature, it cannot be disabled.
     * @type {Integer (Int32)}
     */
    static HeapEnableTerminationOnCorruption => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static HeapOptimizeResources => 3

    /**
     * @type {Integer (Int32)}
     */
    static HeapTag => 7
}
