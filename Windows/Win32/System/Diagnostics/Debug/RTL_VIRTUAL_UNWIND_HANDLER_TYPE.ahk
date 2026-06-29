#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Debug
 */
export default struct RTL_VIRTUAL_UNWIND_HANDLER_TYPE {
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
    static UNW_FLAG_NHANDLER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static UNW_FLAG_EHANDLER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static UNW_FLAG_UHANDLER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static UNW_FLAG_CHAININFO => 4
}
