#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_DEVICE_STATE.ahk" { USB_DEVICE_STATE }
#Import ".\USB_HUB_CAPABILITIES.ahk" { USB_HUB_CAPABILITIES }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_HUB_DESCRIPTOR.ahk" { USB_HUB_DESCRIPTOR }
#Import ".\USB_HUB_PORT_INFORMATION.ahk" { USB_HUB_PORT_INFORMATION }
#Import ".\USB_CONNECTION_STATUS.ahk" { USB_CONNECTION_STATUS }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_HUB_DEVICE_INFO {
    #StructPack 4

    HubDescriptor : USB_HUB_DESCRIPTOR

    HubNumber : UInt32

    DeviceAddress : UInt16

    HubIsSelfPowered : BOOLEAN

    HubIsRootHub : BOOLEAN

    HubCapabilities : USB_HUB_CAPABILITIES

    NumberOfHubPorts : UInt32

    PortInfo : USB_HUB_PORT_INFORMATION[1]

}
