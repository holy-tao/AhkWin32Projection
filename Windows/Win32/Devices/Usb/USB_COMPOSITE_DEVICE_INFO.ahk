#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }
#Import ".\USB_CONFIGURATION_DESCRIPTOR.ahk" { USB_CONFIGURATION_DESCRIPTOR }
#Import ".\USB_COMPOSITE_FUNCTION_INFO.ahk" { USB_COMPOSITE_FUNCTION_INFO }
#Import ".\USB_DEVICE_DESCRIPTOR.ahk" { USB_DEVICE_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_COMPOSITE_DEVICE_INFO {
    #StructPack 2

    DeviceDescriptor : USB_DEVICE_DESCRIPTOR

    CurrentConfigDescriptor : USB_CONFIGURATION_DESCRIPTOR

    CurrentConfigurationValue : Int8

    NumberOfFunctions : Int8

    FunctionInfo : USB_COMPOSITE_FUNCTION_INFO[1]

}
