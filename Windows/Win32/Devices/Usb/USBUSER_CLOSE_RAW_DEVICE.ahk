#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_CLOSE_RAW_DEVICE_PARAMETERS.ahk" { USB_CLOSE_RAW_DEVICE_PARAMETERS }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_CLOSE_RAW_DEVICE {
    #StructPack 4

    Header : USBUSER_REQUEST_HEADER

    Parameters : USB_CLOSE_RAW_DEVICE_PARAMETERS

}
