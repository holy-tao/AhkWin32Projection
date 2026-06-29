#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct DEBUG_EVENT_CODE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_PROCESS_DEBUG_EVENT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_THREAD_DEBUG_EVENT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXCEPTION_DEBUG_EVENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXIT_PROCESS_DEBUG_EVENT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static EXIT_THREAD_DEBUG_EVENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static LOAD_DLL_DEBUG_EVENT => 6

    /**
     * @type {Integer (UInt32)}
     */
    static OUTPUT_DEBUG_STRING_EVENT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RIP_EVENT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static UNLOAD_DLL_DEBUG_EVENT => 7
}
