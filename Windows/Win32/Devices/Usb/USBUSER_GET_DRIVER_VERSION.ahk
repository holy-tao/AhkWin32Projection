#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\USB_DRIVER_VERSION_PARAMETERS.ahk

/**
 * The USBUSER_GET_DRIVER_VERSION structure is used with the IOCTL_USB_USER_REQUEST I/O control request to read driver and interface version information.
 * @remarks
 * 
  * The <b>USBUSER_GET_DRIVER_VERSION</b> structure is used with the USBUSER_GET_USB_DRIVER_VERSION user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ns-usbuser-usbuser_get_driver_version
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_GET_DRIVER_VERSION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> structure that specifies the user-mode request on input to <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a> and provides buffer and status information on output.
     * @type {USBUSER_REQUEST_HEADER}
     */
    Header{
        get {
            if(!this.HasProp("__Header"))
                this.__Header := USBUSER_REQUEST_HEADER(this.ptr + 0)
            return this.__Header
        }
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_driver_version_parameters">USB_DRIVER_VERSION_PARAMETERS</a> structure that specifies the parameters that are associated with this request.
     * @type {USB_DRIVER_VERSION_PARAMETERS}
     */
    Parameters{
        get {
            if(!this.HasProp("__Parameters"))
                this.__Parameters := USB_DRIVER_VERSION_PARAMETERS(this.ptr + 16)
            return this.__Parameters
        }
    }
}
