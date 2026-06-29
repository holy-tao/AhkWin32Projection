#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_X64_PENDING_INTERRUPTION_TYPE {
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
    static WHvX64PendingInterrupt => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingNmi => 2

    /**
     * @type {Integer (Int32)}
     */
    static WHvX64PendingException => 3
}
