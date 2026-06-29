#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_ENDPOINT_DESCRIPTOR.ahk" { USB_ENDPOINT_DESCRIPTOR }
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_CONNECTION_STATUS.ahk" { USB_CONNECTION_STATUS }
#Import ".\USB_DEVICE_DESCRIPTOR.ahk" { USB_DEVICE_DESCRIPTOR }
#Import ".\USB_PIPE_INFO.ahk" { USB_PIPE_INFO }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_NODE_CONNECTION_INFORMATION {
    #StructPack 4

    ConnectionIndex : UInt32

    DeviceDescriptor : USB_DEVICE_DESCRIPTOR

    CurrentConfigurationValue : Int8

    LowSpeed : BOOLEAN

    DeviceIsHub : BOOLEAN

    DeviceAddress : UInt16

    NumberOfOpenPipes : UInt32

    ConnectionStatus : USB_CONNECTION_STATUS

    PipeList : USB_PIPE_INFO[1]

}
