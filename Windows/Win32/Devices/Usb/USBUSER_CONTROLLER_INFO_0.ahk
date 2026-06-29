#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_CONTROLLER_INFO_0.ahk" { USB_CONTROLLER_INFO_0 }
#Import ".\USB_CONTROLLER_FLAVOR.ahk" { USB_CONTROLLER_FLAVOR }
#Import ".\USB_USER_ERROR_CODE.ahk" { USB_USER_ERROR_CODE }
#Import ".\USBUSER_REQUEST_HEADER.ahk" { USBUSER_REQUEST_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBUSER_CONTROLLER_INFO_0 {
    #StructPack 4

    Header : USBUSER_REQUEST_HEADER

    Info0 : USB_CONTROLLER_INFO_0

}
