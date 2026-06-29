#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\RAW_ROOTPORT_PARAMETERS.ahk" { RAW_ROOTPORT_PARAMETERS }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_ROOTPORT_PARAMETERS {
    #StructPack 4

    Header : USBUSER_REQUEST_HEADER

    Parameters : RAW_ROOTPORT_PARAMETERS

}
