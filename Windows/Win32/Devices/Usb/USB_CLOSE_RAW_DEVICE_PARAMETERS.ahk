#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * This structure is not supported. The USB_CLOSE_RAW_DEVICE_PARAMETERS structure is used with the IOCTL_USB_USER_REQUEST I/O control request to close raw access to devices on the bus.
 * @remarks
 * The USB_CLOSE_RAW_DEVICE_PARAMETERS structure is used with the USBUSER_OP_CLOSE_RAW_DEVICE user-mode request. For a description of this request, see <a href="https://docs.microsoft.com/windows/desktop/api/usbuser/ni-usbuser-ioctl_usb_user_request">IOCTL_USB_USER_REQUEST</a>.
 * @see https://learn.microsoft.com/windows/win32/api/usbuser/ns-usbuser-usb_close_raw_device_parameters
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_CLOSE_RAW_DEVICE_PARAMETERS {
    #StructPack 4

    /**
     * Reserved.
     */
    xxx : UInt32

}
