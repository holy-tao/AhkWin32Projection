#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_ENDPOINT_DESCRIPTOR.ahk" { USB_ENDPOINT_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USB_PIPE_INFO {
    #StructPack 4

    EndpointDescriptor : USB_ENDPOINT_DESCRIPTOR

    ScheduleOffset : UInt32

}
