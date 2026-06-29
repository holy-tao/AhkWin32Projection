#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WinRT
 */
export default struct CASTING_CONNECTION_ERROR_STATUS {
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
    static CASTING_CONNECTION_ERROR_STATUS_SUCCEEDED => 0

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_DEVICE_DID_NOT_RESPOND => 1

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_DEVICE_ERROR => 2

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_DEVICE_LOCKED => 3

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_PROTECTED_PLAYBACK_FAILED => 4

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_INVALID_CASTING_SOURCE => 5

    /**
     * @type {Integer (Int32)}
     */
    static CASTING_CONNECTION_ERROR_STATUS_UNKNOWN => 6
}
