#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include .\USB_POWER_INFO.ahk

/**
 * The USBUSER_POWER_INFO_REQUEST structure is used in conjunction with the IOCTL_USB_USER_REQUEST I/O control request to retrieve power policy information concerning the relationship of a specific system state to the power state of the host controller and the root hub.
 * @remarks
 * The <b>USBUSER_POWER_INFO_REQUEST</b> structure is used in conjunction with the USBUSER_GET_POWER_STATE_MAP user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usbuser_power_info_request
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_POWER_INFO_REQUEST extends Win32Struct
{
    static sizeof => 52

    static packingSize => 4

    /**
     * Contains a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> that specifies the user-mode request on input to <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>, and provides buffer and status information on output.
     * @type {USBUSER_REQUEST_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := USBUSER_REQUEST_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * Contains a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_power_info">USB_POWER_INFO</a> that specifies the parameters associated with this request.
     * @type {USB_POWER_INFO}
     */
    PowerInformation{
        get {
            if(!this.HasProp("__PowerInformation"))
                this.__PowerInformation := USB_POWER_INFO(16, this)
            return this.__PowerInformation
        }
    }
}
