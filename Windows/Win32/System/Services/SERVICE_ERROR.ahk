#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_ERROR {
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
    static SERVICE_ERROR_CRITICAL => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_IGNORE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_NORMAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ERROR_SEVERE => 2
}
