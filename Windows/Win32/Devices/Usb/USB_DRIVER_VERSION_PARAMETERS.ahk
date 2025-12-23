#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The USB_DRIVER_VERSION_PARAMETERS structure is used with the IOCTL_USB_USER_REQUEST I/O control request to retrieve version information.
 * @remarks
 * The <b>USB_DRIVER_VERSION_PARAMETERS</b> structure is used with the USBUSER_GET_USB_DRIVER_VERSION user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_driver_version_parameters
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_DRIVER_VERSION_PARAMETERS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * A tracking code that identifies the revision of the USB stack.
     * @type {Integer}
     */
    DriverTrackingCode {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The version of the USB driver interface that the USB stack supports.
     * @type {Integer}
     */
    USBDI_Version {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The version of the USB user interface that the USB stack supports.
     * @type {Integer}
     */
    USBUSER_Version {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * A Boolean value that indicates whether the checked version of the host controller driver is loaded. If <b>TRUE</b>, the checked version of the host controller driver is loaded. If <b>FALSE</b>, the checked version is not loaded.
     * @type {BOOLEAN}
     */
    CheckedPortDriver {
        get => NumGet(this, 12, "char")
        set => NumPut("char", value, this, 12)
    }

    /**
     * A Boolean value that indicates whether the checked version of the host controller miniport driver is loaded. If <b>TRUE</b>, the checked version of the host controller miniport driver is loaded. If <b>FALSE</b>, the checked version is not loaded.
     * @type {BOOLEAN}
     */
    CheckedMiniportDriver {
        get => NumGet(this, 13, "char")
        set => NumPut("char", value, this, 13)
    }

    /**
     * The USB version that the USB stack supports. A value of 0x0110 indicates that the USB stack supports version 1.1. A value of 0x0200 indicates the USB stack supports version 2.0.
     * @type {Integer}
     */
    USB_Version {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }
}
