#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the application's current heap allocation state.
 * @see https://docs.microsoft.com/windows/win32/api//avrfsdk/ne-avrfsdk-euserallocationstate
 * @namespace Windows.Win32.System.ApplicationVerifier
 * @version v4.0.30319
 */
class eUserAllocationState{

    /**
     * The allocation state cannot be determined.
     * @type {Integer (Int32)}
     */
    static AllocationStateUnknown => 0

    /**
     * The allocation state is currently in use.
     * @type {Integer (Int32)}
     */
    static AllocationStateBusy => 1

    /**
     * Memory has been freed from the stack but has not been returned to the heap yet.
     * @type {Integer (Int32)}
     */
    static AllocationStateFree => 2
}
