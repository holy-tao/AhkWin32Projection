#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_CONTAINER_NOTIFICATION_CLASS {
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
    static IoSessionStateNotification => 0

    /**
     * @type {Integer (Int32)}
     */
    static IoMaxContainerNotificationClass => 1
}
