#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 * @version v4.0.30319
 */
class WHV_VPCI_DEVICE_NOTIFICATION_TYPE{

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciDeviceNotificationUndefined => 0

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciDeviceNotificationMmioRemapping => 1

    /**
     * @type {Integer (Int32)}
     */
    static WHvVpciDeviceNotificationSurpriseRemoval => 2
}
