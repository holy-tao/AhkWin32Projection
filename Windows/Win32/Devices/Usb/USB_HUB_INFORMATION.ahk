#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_HUB_DESCRIPTOR.ahk" { USB_HUB_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_INFORMATION {
    #StructPack 2

    HubDescriptor : USB_HUB_DESCRIPTOR

    HubIsBusPowered : BOOLEAN

}
