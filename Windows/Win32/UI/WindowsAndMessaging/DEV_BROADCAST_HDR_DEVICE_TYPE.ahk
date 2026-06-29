#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct DEV_BROADCAST_HDR_DEVICE_TYPE {
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
    static DBT_DEVTYP_DEVICEINTERFACE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DBT_DEVTYP_HANDLE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DBT_DEVTYP_OEM => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DBT_DEVTYP_PORT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DBT_DEVTYP_VOLUME => 2
}
