#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USB_POWER_INFO structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve device power state that the host controller power policy specifies for the indicated system power state.
 * @remarks
 * The <b>USB_POWER_INFO</b> structure is used with the USBUSER_GET_POWER_STATE_MAP user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_power_info
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_POWER_INFO extends Win32Struct
{
    static sizeof => 34

    static packingSize => 1

    /**
     * On input, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies the system power state.
     * @type {Integer}
     */
    SystemState {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * On output, an <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies the device power state of the host controller.
     * @type {Integer}
     */
    HcDevicePowerState {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies whether the host controller is in a wake state.
     * @type {Integer}
     */
    HcDeviceWake {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies whether the host controller can wake the system.
     * @type {Integer}
     */
    HcSystemWake {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies the device power state of the root hub.
     * @type {Integer}
     */
    RhDevicePowerState {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies whether the root hub is in a wake state.
     * @type {Integer}
     */
    RhDeviceWake {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies whether the root hub can wake the system.
     * @type {Integer}
     */
    RhSystemWake {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies the last system sleep state.
     * @type {Integer}
     */
    LastSystemSleepState {
        get => NumGet(this, 28, "int")
        set => NumPut("int", value, this, 28)
    }

    /**
     * A Boolean value that indicates whether the host controller device can wake up the system from the specified system power state. If <b>TRUE</b>, the host controller device can wake up the system. If <b>FALSE</b>, the host controller cannot wake up the system.
     * @type {Integer}
     */
    CanWakeup {
        get => NumGet(this, 32, "char")
        set => NumPut("char", value, this, 32)
    }

    /**
     * A Boolean value that indicates whether the host controller is powered when in the specified system power state. If <b>TRUE</b>, the host controller is powered. If <b>FALSE</b>, the host controller is not powered.
     * @type {Integer}
     */
    IsPowered {
        get => NumGet(this, 33, "char")
        set => NumPut("char", value, this, 33)
    }
}
