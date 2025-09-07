#Requires AutoHotkey v2.0.0 64-bit

/**
 * The WDMUSB_POWER_STATE enumeration indicates the power state of a host controller or root hub.
 * @remarks
 * The USB stack uses the <b>WDMUSB_POWER_STATE</b> enumeration to report the power state of the host controller after receiving a USBUSER_GET_POWER_STATE_MAP request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ne-usbuser-wdmusb_power_state
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class WDMUSB_POWER_STATE{

    /**
     * Power state information is not mapped.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerNotMapped => 0

    /**
     * Power state information is not available.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerSystemUnspecified => 100

    /**
     * The system is in the working state.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerSystemWorking => 101

    /**
     * The system is in the S1 power state.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerSystemSleeping1 => 102

    /**
     * The system is in the S2 power state.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerSystemSleeping2 => 103

    /**
     * The system is in the S3 power state.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerSystemSleeping3 => 104

    /**
     * The system is hibernating.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerSystemHibernate => 105

    /**
     * The system is shutdown.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerSystemShutdown => 106

    /**
     * A device is not specified.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerDeviceUnspecified => 200

    /**
     * The host controller is in the D0 power state.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerDeviceD0 => 201

    /**
     * The host controller is in the D1 power state.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerDeviceD1 => 202

    /**
     * The host controller is in the D2 power state.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerDeviceD2 => 203

    /**
     * The host controller is in the D3 power state.
     * @type {Integer (Int32)}
     */
    static WdmUsbPowerDeviceD3 => 204
}
