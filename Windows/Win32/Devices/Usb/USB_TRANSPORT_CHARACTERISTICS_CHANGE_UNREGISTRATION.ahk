#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_CHANGE_REGISTRATION_HANDLE.ahk" { USB_CHANGE_REGISTRATION_HANDLE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_TRANSPORT_CHARACTERISTICS_CHANGE_UNREGISTRATION {
    #StructPack 8

    Handle : USB_CHANGE_REGISTRATION_HANDLE

}
