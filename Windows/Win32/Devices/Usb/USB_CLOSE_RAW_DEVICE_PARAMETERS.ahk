#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * This structure is not supported. The USB_CLOSE_RAW_DEVICE_PARAMETERS structure is used with the IOCTL_USB_USER_REQUEST I/O control request to close raw access to devices on the bus.
 * @remarks
 * 
  * The USB_CLOSE_RAW_DEVICE_PARAMETERS structure is used with the USBUSER_OP_CLOSE_RAW_DEVICE user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//usbuser/ns-usbuser-usb_close_raw_device_parameters
 * @namespace Windows.Win32.Devices.Usb
 * @version v4.0.30319
 */
class USB_CLOSE_RAW_DEVICE_PARAMETERS extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Reserved.
     * @type {Integer}
     */
    xxx {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
