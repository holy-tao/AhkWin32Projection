#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct SERVICE_TRIGGER_ACTION {
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
    static SERVICE_TRIGGER_ACTION_SERVICE_START => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_ACTION_SERVICE_STOP => 2
}
