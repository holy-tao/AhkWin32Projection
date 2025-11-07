#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include .\USB_UNICODE_NAME.ahk

/**
 * The USBUSER_CONTROLLER_UNICODE_NAME structure is used in conjunction with the IOCTL_USB_USER_REQUEST I/O control request to retrieve the USB host controller driverkey name.
 * @remarks
 * 
 * The <b>USBUSER_CONTROLLER_UNICODE_NAME</b> structure is used in conjunction with the USBUSER_GET_CONTROLLER_DRIVER_KEY user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ns-usbuser-usbuser_controller_unicode_name
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_CONTROLLER_UNICODE_NAME extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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
     * Contains a Unicode string of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_unicode_name">USB_UNICODE_NAME</a> that reports the host controller's driverkey name.
     * @type {USB_UNICODE_NAME}
     */
    UnicodeName{
        get {
            if(!this.HasProp("__UnicodeName"))
                this.__UnicodeName := USB_UNICODE_NAME(16, this)
            return this.__UnicodeName
        }
    }
}
