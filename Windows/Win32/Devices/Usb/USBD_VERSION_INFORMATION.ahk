#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBD_VERSION_INFORMATION {
    #StructPack 4

    USBDI_Version : UInt32

    Supported_USB_Version : UInt32

}
