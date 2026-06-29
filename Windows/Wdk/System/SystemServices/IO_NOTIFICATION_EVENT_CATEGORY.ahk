#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct IO_NOTIFICATION_EVENT_CATEGORY {
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
    static EventCategoryReserved => 0

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryHardwareProfileChange => 1

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryDeviceInterfaceChange => 2

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryTargetDeviceChange => 3

    /**
     * @type {Integer (Int32)}
     */
    static EventCategoryKernelSoftRestart => 4
}
