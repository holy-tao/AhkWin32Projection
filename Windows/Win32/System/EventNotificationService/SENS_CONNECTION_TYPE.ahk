#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.EventNotificationService
 */
export default struct SENS_CONNECTION_TYPE {
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
    static CONNECTION_LAN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CONNECTION_WAN => 1
}
