#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the current heap allocation state.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-eheapallocationstate
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
class eHeapAllocationState extends Win32Enum {

    /**
     * Specifies the full-page heap arrangement is being used.
     * Native name: HeapFullPageHeap
     * @type {Integer (Int32)}
     */
    static FullPageHeap => 1073741824

    /**
     * Specifies the highest bit. When set, it has not been allocated by the user.
     * Native name: HeapMetadata
     * @type {Integer (Int32)}
     */
    static Metadata => -2147483648

    /**
     * Specifies a value to be used as a mask with the bitwise AND operator to indicate whether the allocation is by the user.
     * Native name: HeapStateMask
     * @type {Integer (Int32)}
     */
    static Mask => -65536
}
