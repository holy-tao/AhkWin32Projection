#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\WDMUSB_POWER_STATE.ahk" { WDMUSB_POWER_STATE }

/**
 * The USB_POWER_INFO structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve device power state that the host controller power policy specifies for the indicated system power state.
 * @remarks
 * The <b>USB_POWER_INFO</b> structure is used with the USBUSER_GET_POWER_STATE_MAP user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_power_info
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_POWER_INFO {
    #StructPack 4

    /**
     * On input, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies the system power state.
     */
    SystemState : WDMUSB_POWER_STATE

    /**
     * On output, an <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies the device power state of the host controller.
     */
    HcDevicePowerState : WDMUSB_POWER_STATE

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies whether the host controller is in a wake state.
     */
    HcDeviceWake : WDMUSB_POWER_STATE

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies whether the host controller can wake the system.
     */
    HcSystemWake : WDMUSB_POWER_STATE

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies the device power state of the root hub.
     */
    RhDevicePowerState : WDMUSB_POWER_STATE

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies whether the root hub is in a wake state.
     */
    RhDeviceWake : WDMUSB_POWER_STATE

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies whether the root hub can wake the system.
     */
    RhSystemWake : WDMUSB_POWER_STATE

    /**
     * On output, a <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ne-usbuser-wdmusb_power_state">WDMUSB_POWER_STATE</a>-type enumerator value that specifies the last system sleep state.
     */
    LastSystemSleepState : WDMUSB_POWER_STATE

    /**
     * A Boolean value that indicates whether the host controller device can wake up the system from the specified system power state. If <b>TRUE</b>, the host controller device can wake up the system. If <b>FALSE</b>, the host controller cannot wake up the system.
     */
    CanWakeup : BOOLEAN

    /**
     * A Boolean value that indicates whether the host controller is powered when in the specified system power state. If <b>TRUE</b>, the host controller is powered. If <b>FALSE</b>, the host controller is not powered.
     */
    IsPowered : BOOLEAN

}
