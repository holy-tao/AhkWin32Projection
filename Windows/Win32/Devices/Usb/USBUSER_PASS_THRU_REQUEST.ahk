#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_PASS_THRU_PARAMETERS.ahk" { USB_PASS_THRU_PARAMETERS }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * The USBUSER_PASS_THRU_REQUEST structure is used in conjunction with the IOCTL_USB_USER_REQUEST I/O control request to send a vendor-specific command to the host controller miniport driver.
 * @remarks
 * The <b>USBUSER_PASS_THRU_REQUEST</b> structure is used in conjunction with the USBUSER_PASS_THRU user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usbuser_pass_thru_request
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_PASS_THRU_REQUEST {
    #StructPack 4

    /**
     * Contains a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> that specifies the user-mode request on input to <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>, and provides buffer and status information on output.
     */
    Header : USBUSER_REQUEST_HEADER

    /**
     * Contains a structure of type <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_pass_thru_parameters">USB_PASS_THRU_PARAMETERS</a> that specifies the parameters associated with this request.
     */
    PassThru : USB_PASS_THRU_PARAMETERS

}
