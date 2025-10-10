#Requires AutoHotkey v2.0.0 64-bit

/**
 * Each heap property is identified by an ID and has an associated value.
 * @see https://docs.microsoft.com/windows/win32/api//webservices/ne-webservices-ws_heap_property_id
 * @namespace Windows.Win32.Networking.WindowsWebServices
 * @version v4.0.30319
 */
class WS_HEAP_PROPERTY_ID{

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetheapproperty">WsGetHeapProperty</a>.  Returns
 *                     the total number of bytes that can be allocated from the heap.  The total
 *                     number of bytes is defined as sum of the sizes passed in all the calls to
 *                     <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsalloc">WsAlloc</a> since the heap was created / reset.
     * @type {Integer (Int32)}
     */
    static WS_HEAP_PROPERTY_MAX_SIZE => 0

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetheapproperty">WsGetHeapProperty</a>.  
 *                     Returns the maximum number of bytes of memory that the heap will
 *                     retain after a call to <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsresetheap">WsResetHeap</a> call.  This should 
 *                     be treated an approximate value due to heap overhead.  If the
 *                     trim size is larger than the max size, then the size of the
 *                     heap will not be trimmed.
     * @type {Integer (Int32)}
     */
    static WS_HEAP_PROPERTY_TRIM_SIZE => 1

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetheapproperty">WsGetHeapProperty</a>.  Returns the current 
 *                     total number of bytes requested from the heap since the heap was 
 *                     created/reset.
     * @type {Integer (Int32)}
     */
    static WS_HEAP_PROPERTY_REQUESTED_SIZE => 2

    /**
     * Used with <a href="https://docs.microsoft.com/windows/desktop/api/webservices/nf-webservices-wsgetheapproperty">WsGetHeapProperty</a>.  Returns the current
 *                     total number of bytes that the WS_HEAP has allocated from the
 *                     operating system for purposes of providing allocations.
     * @type {Integer (Int32)}
     */
    static WS_HEAP_PROPERTY_ACTUAL_SIZE => 3
}
