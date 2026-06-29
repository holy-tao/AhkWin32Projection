#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\AVRF_BACKTRACE_INFORMATION.ahk" { AVRF_BACKTRACE_INFORMATION }

/**
 * Stores metadata information about heap allocation.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ns-avrfsdk-avrf_heap_allocation
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct AVRF_HEAP_ALLOCATION {
    #StructPack 8

    /**
     * The handle to the heap being enumerated.
     */
    HeapHandle : Int64

    /**
     * The address of the heap allocation as seen by the application.
     */
    UserAllocation : Int64

    /**
     * The size, in bytes, of the application's allocation on the heap.
     */
    UserAllocationSize : Int64

    /**
     * The address of the heap allocation as seen by the operating system.
     */
    Allocation : Int64

    /**
     * The size, in bytes, of the heap allocation as seen by the operating system.
     */
    AllocationSize : Int64

    /**
     * One of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-euserallocationstate">eUserAllocationState</a> enumerated type.
     */
    UserAllocationState : UInt32

    /**
     * The state of the heap allocation. The user can extract one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-eheapallocationstate">eHeapAllocationState</a> enum after AND-ing the <b>HeapStateMask</b> value.
     */
    HeapState : UInt32

    /**
     * The context of the heap currently allocated.
     */
    HeapContext : Int64

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ns-avrfsdk-avrf_backtrace_information">AVRF_BACKTRACE_INFORMATION</a> structure containing information about the last operation that occurred on the allocation. 
     * 
     * When available, it can be the stack backtrace of the place where the address specified in the <b>UserAllocation</b> member of the structure was allocated (if <b>UserAllocationState</b> is <b>AllocationstateBusy</b>) or where the address specified in the <b>UserAllocation</b> member was freed (if <b>UserAllocationState</b> is <b>AllocationStateFree</b>).
     */
    BackTraceInformation : AVRF_BACKTRACE_INFORMATION.Ptr

}
