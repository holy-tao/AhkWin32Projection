#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.DeviceAndDriverInstallation
 */
export default struct SETUP_DI_STATE_CHANGE {
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
    static DICS_ENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_DISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_PROPCHANGE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_START => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DICS_STOP => 5
}
