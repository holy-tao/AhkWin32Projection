#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }
#Import ".\USB_SEND_RAW_COMMAND_PARAMETERS.ahk" { USB_SEND_RAW_COMMAND_PARAMETERS }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_SEND_RAW_COMMAND {
    #StructPack 4

    Header : USBUSER_REQUEST_HEADER

    Parameters : USB_SEND_RAW_COMMAND_PARAMETERS

}
