#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct DEVICE_USAGE_NOTIFICATION_TYPE {
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
    static DeviceUsageTypeUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypePaging => 1

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeHibernation => 2

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeDumpFile => 3

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeBoot => 4

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypePostDisplay => 5

    /**
     * @type {Integer (Int32)}
     */
    static DeviceUsageTypeGuestAssigned => 6
}
