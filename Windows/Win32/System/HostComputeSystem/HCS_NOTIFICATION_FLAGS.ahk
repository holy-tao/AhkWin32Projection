#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.HostComputeSystem
 */
export default struct HCS_NOTIFICATION_FLAGS {
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
    static HcsNotificationFlagSuccess => 0

    /**
     * @type {Integer (Int32)}
     */
    static HcsNotificationFlagFailure => -2147483648
}
