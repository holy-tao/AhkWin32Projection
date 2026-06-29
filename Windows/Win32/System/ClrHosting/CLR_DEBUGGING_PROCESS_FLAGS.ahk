#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ClrHosting
 */
export default struct CLR_DEBUGGING_PROCESS_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static CLR_DEBUGGING_MANAGED_EVENT_PENDING => 1

    /**
     * @type {Integer (Int32)}
     */
    static CLR_DEBUGGING_MANAGED_EVENT_DEBUGGER_LAUNCH => 2
}
