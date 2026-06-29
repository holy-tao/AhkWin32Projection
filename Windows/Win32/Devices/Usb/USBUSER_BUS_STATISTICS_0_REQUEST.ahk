#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }
#Import ".\USB_BUS_STATISTICS_0.ahk" { USB_BUS_STATISTICS_0 }

/**
 * The USBUSER_BUS_STATISTICS_0_REQUEST structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve bus statistics.
 * @remarks
 * The <b>USBUSER_BUS_STATISTICS_0_REQUEST</b> structure is used with the USBUSER_GET_BUS_STATISTICS_0 user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usbuser_bus_statistics_0_request
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_BUS_STATISTICS_0_REQUEST {
    #StructPack 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> structure that specifies the user-mode request on input to IOCTL_USB_USER_REQUEST and provides buffer and status information on output.
     */
    Header : USBUSER_REQUEST_HEADER

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_bus_statistics_0">USB_BUS_STATISTICS_0</a> structure that reports bus statistics.
     */
    BusStatistics0 : USB_BUS_STATISTICS_0

}
