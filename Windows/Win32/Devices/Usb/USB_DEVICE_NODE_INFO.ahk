#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_DEVICE_DESCRIPTOR.ahk" { USB_DEVICE_DESCRIPTOR }
#Import ".\USB_CONFIGURATION_DESCRIPTOR.ahk" { USB_CONFIGURATION_DESCRIPTOR }
#Import ".\USB_HUB_DEVICE_INFO.ahk" { USB_HUB_DEVICE_INFO }
#Import ".\USB_HUB_CAPABILITIES.ahk" { USB_HUB_CAPABILITIES }
#Import ".\USB_DEVICE_SPEED.ahk" { USB_DEVICE_SPEED }
#Import ".\USB_CONNECTION_STATUS.ahk" { USB_CONNECTION_STATUS }
#Import ".\USB_COMPOSITE_DEVICE_INFO.ahk" { USB_COMPOSITE_DEVICE_INFO }
#Import ".\USB_WMI_DEVICE_NODE_TYPE.ahk" { USB_WMI_DEVICE_NODE_TYPE }
#Import ".\USB_HUB_DESCRIPTOR.ahk" { USB_HUB_DESCRIPTOR }
#Import ".\USB_CONTROLLER_DEVICE_INFO.ahk" { USB_CONTROLLER_DEVICE_INFO }
#Import ".\USB_HUB_PORT_INFORMATION.ahk" { USB_HUB_PORT_INFORMATION }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_PIPE_INFO.ahk" { USB_PIPE_INFO }
#Import ".\USB_TOPOLOGY_ADDRESS.ahk" { USB_TOPOLOGY_ADDRESS }
#Import ".\USB_COMPOSITE_FUNCTION_INFO.ahk" { USB_COMPOSITE_FUNCTION_INFO }
#Import ".\USB_ENDPOINT_DESCRIPTOR.ahk" { USB_ENDPOINT_DESCRIPTOR }
#Import ".\USB_DEVICE_INFO.ahk" { USB_DEVICE_INFO }
#Import ".\USB_DEVICE_STATE.ahk" { USB_DEVICE_STATE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_NODE_INFO {
    #StructPack 4

    Sig : UInt32

    LengthInBytes : UInt32

    DeviceDescription : WCHAR[40]

    NodeType : USB_WMI_DEVICE_NODE_TYPE

    BusAddress : USB_TOPOLOGY_ADDRESS

    UsbDeviceInfo : USB_DEVICE_INFO

    static __New() {
        DefineProp(this.Prototype, 'HubDeviceInfo', { type: USB_HUB_DEVICE_INFO, offset: 124 })
        DefineProp(this.Prototype, 'CompositeDeviceInfo', { type: USB_COMPOSITE_DEVICE_INFO, offset: 124 })
        DefineProp(this.Prototype, 'ControllerDeviceInfo', { type: USB_CONTROLLER_DEVICE_INFO, offset: 124 })
        DefineProp(this.Prototype, 'DeviceInformation', { type: Int8[4], offset: 124 })
        this.DeleteProp("__New")
    }
}
