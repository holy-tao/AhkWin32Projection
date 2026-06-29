#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_ENDPOINT_DESCRIPTOR.ahk" { USB_ENDPOINT_DESCRIPTOR }
#Import ".\USB_DEVICE_STATE.ahk" { USB_DEVICE_STATE }
#Import ".\USB_CONNECTION_STATUS.ahk" { USB_CONNECTION_STATUS }
#Import ".\USB_DEVICE_DESCRIPTOR.ahk" { USB_DEVICE_DESCRIPTOR }
#Import ".\USB_DEVICE_SPEED.ahk" { USB_DEVICE_SPEED }
#Import ".\USB_PIPE_INFO.ahk" { USB_PIPE_INFO }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_DEVICE_INFO {
    #StructPack 4

    DeviceState : USB_DEVICE_STATE

    PortNumber : UInt16

    DeviceDescriptor : USB_DEVICE_DESCRIPTOR

    CurrentConfigurationValue : Int8

    Speed : USB_DEVICE_SPEED

    DeviceAddress : UInt16

    ConnectionIndex : UInt32

    ConnectionStatus : USB_CONNECTION_STATUS

    PnpHardwareId : WCHAR[128]

    PnpCompatibleId : WCHAR[128]

    SerialNumberId : WCHAR[128]

    PnpDeviceDescription : WCHAR[128]

    NumberOfOpenPipes : UInt32

    PipeList : USB_PIPE_INFO[1]

}
