#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * The USB_DRIVER_VERSION_PARAMETERS structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve version information.
 * @remarks
 * The <b>USB_DRIVER_VERSION_PARAMETERS</b> structure is used with the USBUSER_GET_USB_DRIVER_VERSION user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_driver_version_parameters
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DRIVER_VERSION_PARAMETERS {
    #StructPack 4

    /**
     * A tracking code that identifies the revision of the USB stack.
     */
    DriverTrackingCode : UInt32

    /**
     * The version of the USB driver interface that the USB stack supports.
     */
    USBDI_Version : UInt32

    /**
     * The version of the USB user interface that the USB stack supports.
     */
    USBUSER_Version : UInt32

    /**
     * A Boolean value that indicates whether the checked version of the host controller driver is loaded. If <b>TRUE</b>, the checked version of the host controller driver is loaded. If <b>FALSE</b>, the checked version is not loaded.
     */
    CheckedPortDriver : BOOLEAN

    /**
     * A Boolean value that indicates whether the checked version of the host controller miniport driver is loaded. If <b>TRUE</b>, the checked version of the host controller miniport driver is loaded. If <b>FALSE</b>, the checked version is not loaded.
     */
    CheckedMiniportDriver : BOOLEAN

    /**
     * The USB version that the USB stack supports. A value of 0x0110 indicates that the USB stack supports version 1.1. A value of 0x0200 indicates the USB stack supports version 2.0.
     */
    USB_Version : UInt16

}
