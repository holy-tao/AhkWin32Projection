#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_ENDPOINT_DESCRIPTOR.ahk" { USB_ENDPOINT_DESCRIPTOR }
#Import ".\USBFN_PIPE_INFORMATION.ahk" { USBFN_PIPE_INFORMATION }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USBFN_CLASS_INTERFACE.ahk" { USBFN_CLASS_INTERFACE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_CLASS_INFORMATION_PACKET {
    #StructPack 4

    FullSpeedClassInterface : USBFN_CLASS_INTERFACE

    HighSpeedClassInterface : USBFN_CLASS_INTERFACE

    InterfaceName : WCHAR[40]

    InterfaceGuid : WCHAR[39]

    HasInterfaceGuid : BOOLEAN

    SuperSpeedClassInterface : USBFN_CLASS_INTERFACE

}
