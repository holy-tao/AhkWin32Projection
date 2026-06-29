#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }

/**
 * The USBUSER_REQUEST_HEADER structure is used with the IOCTL_USB_USER_REQUEST I/O control request to send a user-mode request to the USB host controller driver.
 * @remarks
 * The <b>USBUSER_REQUEST_HEADER</b> structure is used with the <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a> I/O control request to send a user-mode request to the USB port driver.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usbuser_request_header
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_REQUEST_HEADER {
    #StructPack 4

    /**
     * The user-mode request. For a list and description of possible values for this member, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
     */
    UsbUserRequest : UInt32

    /**
     * The status code that is returned by port driver.
     */
    UsbUserStatusCode : USB_USER_ERROR_CODE

    /**
     * The size, in bytes, of the data buffer. The same buffer is used for both input and output.
     */
    RequestBufferLength : UInt32

    /**
     * The size, in bytes, of the data that is retrieved by the request.
     */
    ActualBufferLength : UInt32

}
