#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the application's current heap allocation state.
 * @see https://learn.microsoft.com/windows/win32/api/avrfsdk/ne-avrfsdk-euserallocationstate
 * @namespace Windows.Win32.System.ApplicationVerifier
 */
export default struct eUserAllocationState {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
