#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USBUSER_REQUEST_HEADER structure is used with the IOCTL_USB_USER_REQUEST I/O control request to send a user-mode request to the USB host controller driver.
 * @remarks
 * 
 * The <b>USBUSER_REQUEST_HEADER</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a> I/O control request to send a user-mode request to the USB port driver.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ns-usbuser-usbuser_request_header
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_REQUEST_HEADER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The user-mode request. For a list and description of possible values for this member, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
     * @type {Integer}
     */
    UsbUserRequest {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The status code that is returned by port driver.
     * @type {Integer}
     */
    UsbUserStatusCode {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The size, in bytes, of the data buffer. The same buffer is used for both input and output.
     * @type {Integer}
     */
    RequestBufferLength {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size, in bytes, of the data that is retrieved by the request.
     * @type {Integer}
     */
    ActualBufferLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
