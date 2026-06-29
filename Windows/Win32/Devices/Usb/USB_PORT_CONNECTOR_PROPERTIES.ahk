#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_PORT_PROPERTIES.ahk" { USB_PORT_PROPERTIES }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_PORT_CONNECTOR_PROPERTIES {
    #StructPack 4

    ConnectionIndex : UInt32

    ActualLength : UInt32

    UsbPortProperties : USB_PORT_PROPERTIES

    CompanionIndex : UInt16

    CompanionPortNumber : UInt16

    CompanionHubSymbolicLinkName : WCHAR[1]

}
