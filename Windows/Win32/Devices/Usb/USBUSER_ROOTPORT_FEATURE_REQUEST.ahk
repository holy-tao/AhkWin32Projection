#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\RAW_ROOTPORT_FEATURE.ahk" { RAW_ROOTPORT_FEATURE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_ROOTPORT_FEATURE_REQUEST {
    #StructPack 4

    Header : USBUSER_REQUEST_HEADER

    Parameters : RAW_ROOTPORT_FEATURE

}
