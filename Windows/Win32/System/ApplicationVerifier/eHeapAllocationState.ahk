#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the current heap allocation state.
 * @see https://docs.microsoft.com/windows/win32/api//avrfsdk/ne-avrfsdk-eheapallocationstate
 * @namespace Windows.Win32.System.ApplicationVerifier
 * @version v4.0.30319
 */
class eHeapAllocationState{

    /**
     * Specifies the full-page heap arrangement is being used.
     * @type {Integer (Int32)}
     */
    static HeapFullPageHeap => 1073741824

    /**
     * Specifies the highest bit. When set, it has not been allocated by the user.
     * @type {Integer (Int32)}
     */
    static HeapMetadata => -2147483648

    /**
     * Specifies a value to be used as a mask with the bitwise AND operator to indicate whether the allocation is by the user.
     * @type {Integer (Int32)}
     */
    static HeapStateMask => -65536
}
