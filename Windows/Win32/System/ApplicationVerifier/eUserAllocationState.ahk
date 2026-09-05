#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the application's current heap allocation state.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-euserallocationstate
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
class eUserAllocationState extends Win32Enum {

    /**
     * The allocation state cannot be determined.
     * Native name: AllocationStateUnknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The allocation state is currently in use.
     * Native name: AllocationStateBusy
     * @type {Integer (Int32)}
     */
    static Busy => 1

    /**
     * Memory has been freed from the stack but has not been returned to the heap yet.
     * Native name: AllocationStateFree
     * @type {Integer (Int32)}
     */
    static Free => 2
}
