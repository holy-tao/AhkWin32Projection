#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct NOTIFICATION_CONFIG_FLAGS {
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
    static NOTIFICATION_CONFIG_CREATE_EVENT => 1

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_CONFIG_REGISTER_CALLBACK => 2

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_CONFIG_EVENT_TRIGGER => 4

    /**
     * @type {Integer (Int32)}
     */
    static NOTIFICATION_CONFIG_ASYNC_CHANNEL => 8
}
