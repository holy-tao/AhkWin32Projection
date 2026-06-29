#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.UI.WindowsAndMessaging
 */
export default struct REGISTER_NOTIFICATION_FLAGS {
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
    static DEVICE_NOTIFY_SERVICE_HANDLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOTIFY_CALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOTIFY_WINDOW_HANDLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DEVICE_NOTIFY_ALL_INTERFACE_CLASSES => 4
}
