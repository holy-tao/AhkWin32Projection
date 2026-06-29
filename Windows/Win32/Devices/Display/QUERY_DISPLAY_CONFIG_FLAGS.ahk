#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct QUERY_DISPLAY_CONFIG_FLAGS {
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
    static QDC_ALL_PATHS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_ONLY_ACTIVE_PATHS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_DATABASE_CURRENT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_VIRTUAL_MODE_AWARE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_INCLUDE_HMD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static QDC_VIRTUAL_REFRESH_RATE_AWARE => 64
}
