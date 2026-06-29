#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Services
 */
export default struct ENUM_SERVICE_STATE {
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
    static SERVICE_ACTIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_INACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STATE_ALL => 3
}
