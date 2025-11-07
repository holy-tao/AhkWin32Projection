#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include .\USB_BANDWIDTH_INFO.ahk

/**
 * The USBUSER_BANDWIDTH_INFO_REQUEST structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve information about the allocated bandwidth.
 * @remarks
 * 
 * The <b>USBUSER_BANDWIDTH_INFO_REQUEST</b> structure is used with the USBUSER_GET_BANDWIDTH_INFORMATION user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ns-usbuser-usbuser_bandwidth_info_request
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_BANDWIDTH_INFO_REQUEST extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> structure that specifies the user-mode request on input to IOCTL_USB_USER_REQUEST and provides buffer and status information on output.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_bandwidth_info">USB_BANDWIDTH_INFO</a> structure that reports bandwidth allocation information.
     * @type {USB_BANDWIDTH_INFO}
     */
    BandwidthInformation{
        get {
            if(!this.HasProp("__BandwidthInformation"))
                this.__BandwidthInformation := USB_BANDWIDTH_INFO(16, this)
            return this.__BandwidthInformation
        }
    }
}
