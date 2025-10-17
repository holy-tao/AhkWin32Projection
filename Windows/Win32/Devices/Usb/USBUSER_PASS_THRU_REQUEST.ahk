#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include .\USB_PASS_THRU_PARAMETERS.ahk

/**
 * The USBUSER_PASS_THRU_REQUEST structure is used in conjunction with the IOCTL_USB_USER_REQUEST I/O control request to send a vendor-specific command to the host controller miniport driver.
 * @remarks
 * 
  * The <b>USBUSER_PASS_THRU_REQUEST</b> structure is used in conjunction with the USBUSER_PASS_THRU user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ns-usbuser-usbuser_pass_thru_request
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_PASS_THRU_REQUEST extends Win32Struct
{
    static sizeof => 32

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
     * Contains a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_pass_thru_parameters">USB_PASS_THRU_PARAMETERS</a> that specifies the parameters associated with this request.
     * @type {USB_PASS_THRU_PARAMETERS}
     */
    PassThru{
        get {
            if(!this.HasProp("__PassThru"))
                this.__PassThru := USB_PASS_THRU_PARAMETERS(16, this)
            return this.__PassThru
        }
    }
}
