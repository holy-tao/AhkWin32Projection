#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\WDMUSB_POWER_STATE.ahk" { WDMUSB_POWER_STATE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }
#Import ".\USB_POWER_INFO.ahk" { USB_POWER_INFO }

/**
 * The USBUSER_POWER_INFO_REQUEST structure is used in conjunction with the IOCTL_USB_USER_REQUEST I/O control request to retrieve power policy information concerning the relationship of a specific system state to the power state of the host controller and the root hub.
 * @remarks
 * The <b>USBUSER_POWER_INFO_REQUEST</b> structure is used in conjunction with the USBUSER_GET_POWER_STATE_MAP user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usbuser_power_info_request
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_POWER_INFO_REQUEST {
    #StructPack 4

    /**
     * Contains a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> that specifies the user-mode request on input to <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>, and provides buffer and status information on output.
     */
    Header : USBUSER_REQUEST_HEADER

    /**
     * Contains a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_power_info">USB_POWER_INFO</a> that specifies the parameters associated with this request.
     */
    PowerInformation : USB_POWER_INFO

}
