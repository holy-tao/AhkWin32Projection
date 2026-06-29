#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_ENDPOINT_DESCRIPTOR.ahk" { USB_ENDPOINT_DESCRIPTOR }
#Import ".\USBFN_PIPE_INFORMATION.ahk" { USBFN_PIPE_INFORMATION }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USBFN_CLASS_INTERFACE_EX.ahk" { USBFN_CLASS_INTERFACE_EX }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_CLASS_INFORMATION_PACKET_EX {
    #StructPack 4

    FullSpeedClassInterfaceEx : USBFN_CLASS_INTERFACE_EX

    HighSpeedClassInterfaceEx : USBFN_CLASS_INTERFACE_EX

    SuperSpeedClassInterfaceEx : USBFN_CLASS_INTERFACE_EX

    InterfaceName : WCHAR[40]

    InterfaceGuid : WCHAR[39]

    HasInterfaceGuid : BOOLEAN

}
