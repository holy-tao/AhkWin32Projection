#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Stores metadata information about heap allocation.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ns-avrfsdk-avrf_heap_allocation
 * @namespace Windows.Win32.System.ApplicationVerifier
 * @version v4.0.30319
 */
class AVRF_HEAP_ALLOCATION extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * The handle to the heap being enumerated.
     * @type {Integer}
     */
    HeapHandle {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The address of the heap allocation as seen by the application.
     * @type {Integer}
     */
    UserAllocation {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size, in bytes, of the application's allocation on the heap.
     * @type {Integer}
     */
    UserAllocationSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The address of the heap allocation as seen by the operating system.
     * @type {Integer}
     */
    Allocation {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The size, in bytes, of the heap allocation as seen by the operating system.
     * @type {Integer}
     */
    AllocationSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * One of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-euserallocationstate">eUserAllocationState</a> enumerated type.
     * @type {Integer}
     */
    UserAllocationState {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The state of the heap allocation. The user can extract one of the values in the <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ne-avrfsdk-eheapallocationstate">eHeapAllocationState</a> enum after AND-ing the <b>HeapStateMask</b> value.
     * @type {Integer}
     */
    HeapState {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The context of the heap currently allocated.
     * @type {Integer}
     */
    HeapContext {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/avrfsdk/ns-avrfsdk-avrf_backtrace_information">AVRF_BACKTRACE_INFORMATION</a> structure containing information about the last operation that occurred on the allocation. 
     * 
     * When available, it can be the stack backtrace of the place where the address specified in the <b>UserAllocation</b> member of the structure was allocated (if <b>UserAllocationState</b> is <b>AllocationstateBusy</b>) or where the address specified in the <b>UserAllocation</b> member was freed (if <b>UserAllocationState</b> is <b>AllocationStateFree</b>).
     * @type {Pointer<AVRF_BACKTRACE_INFORMATION>}
     */
    BackTraceInformation {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
