#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_BANDWIDTH_INFO.ahk" { USB_BANDWIDTH_INFO }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }

/**
 * The USBUSER_BANDWIDTH_INFO_REQUEST structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve information about the allocated bandwidth.
 * @remarks
 * The <b>USBUSER_BANDWIDTH_INFO_REQUEST</b> structure is used with the USBUSER_GET_BANDWIDTH_INFORMATION user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usbuser_bandwidth_info_request
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_BANDWIDTH_INFO_REQUEST {
    #StructPack 4

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> structure that specifies the user-mode request on input to IOCTL_USB_USER_REQUEST and provides buffer and status information on output.
     */
    Header : USBUSER_REQUEST_HEADER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_bandwidth_info">USB_BANDWIDTH_INFO</a> structure that reports bandwidth allocation information.
     */
    BandwidthInformation : USB_BANDWIDTH_INFO

}
