#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_UNICODE_NAME.ahk" { USB_UNICODE_NAME }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * The USBUSER_CONTROLLER_UNICODE_NAME structure is used in conjunction with the IOCTL_USB_USER_REQUEST I/O control request to retrieve the USB host controller driverkey name.
 * @remarks
 * The <b>USBUSER_CONTROLLER_UNICODE_NAME</b> structure is used in conjunction with the USBUSER_GET_CONTROLLER_DRIVER_KEY user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usbuser_controller_unicode_name
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_CONTROLLER_UNICODE_NAME {
    #StructPack 4

    /**
     * Contains a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> that specifies the user-mode request on input to <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>, and provides buffer and status information on output.
     */
    Header : USBUSER_REQUEST_HEADER

    /**
     * Contains a Unicode string of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_unicode_name">USB_UNICODE_NAME</a> that reports the host controller's driverkey name.
     */
    UnicodeName : USB_UNICODE_NAME

}
