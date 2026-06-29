#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }
#Import ".\USB_DRIVER_VERSION_PARAMETERS.ahk" { USB_DRIVER_VERSION_PARAMETERS }

/**
 * The USBUSER_GET_DRIVER_VERSION structure is used with the IOCTL_USB_USER_REQUEST I/O control request to read driver and interface version information.
 * @remarks
 * The <b>USBUSER_GET_DRIVER_VERSION</b> structure is used with the USBUSER_GET_USB_DRIVER_VERSION user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usbuser_get_driver_version
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_GET_DRIVER_VERSION {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> structure that specifies the user-mode request on input to <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a> and provides buffer and status information on output.
     */
    Header : USBUSER_REQUEST_HEADER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_driver_version_parameters">USB_DRIVER_VERSION_PARAMETERS</a> structure that specifies the parameters that are associated with this request.
     */
    Parameters : USB_DRIVER_VERSION_PARAMETERS

}
