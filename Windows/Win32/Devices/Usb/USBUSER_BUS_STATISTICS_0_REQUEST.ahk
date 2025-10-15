#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\USBUSER_REQUEST_HEADER.ahk
#Include ..\..\Foundation\BOOLEAN.ahk
#Include .\USB_BUS_STATISTICS_0.ahk

/**
 * The USBUSER_BUS_STATISTICS_0_REQUEST structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve bus statistics.
 * @remarks
 * 
  * The <b>USBUSER_BUS_STATISTICS_0_REQUEST</b> structure is used with the USBUSER_GET_BUS_STATISTICS_0 user-mode request. For more information about this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ns-usbuser-usbuser_bus_statistics_0_request
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USBUSER_BUS_STATISTICS_0_REQUEST extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usbuser_request_header">USBUSER_REQUEST_HEADER</a> structure that specifies the user-mode request on input to IOCTL_USB_USER_REQUEST and provides buffer and status information on output.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ns-usbuser-usb_bus_statistics_0">USB_BUS_STATISTICS_0</a> structure that reports bus statistics.
     * @type {USB_BUS_STATISTICS_0}
     */
    BusStatistics0{
        get {
            if(!this.HasProp("__BusStatistics0"))
                this.__BusStatistics0 := USB_BUS_STATISTICS_0(this.ptr + 16)
            return this.__BusStatistics0
        }
    }
}
