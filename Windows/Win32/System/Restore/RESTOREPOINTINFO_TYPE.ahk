#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Restore
 */
export default struct RESTOREPOINTINFO_TYPE {
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
    static APPLICATION_INSTALL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APPLICATION_UNINSTALL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_DRIVER_INSTALL => 10

    /**
     * @type {Integer (UInt32)}
     */
    static MODIFY_SETTINGS => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CANCELLED_OPERATION => 13
}
