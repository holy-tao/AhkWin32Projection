#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_ENDPOINT_DESCRIPTOR.ahk" { USB_ENDPOINT_DESCRIPTOR }
#Import ".\USBFN_PIPE_INFORMATION.ahk" { USBFN_PIPE_INFORMATION }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_CLASS_INTERFACE_EX {
    #StructPack 4

    BaseInterfaceNumber : Int8

    InterfaceCount : Int8

    PipeCount : Int8

    PipeArr : USBFN_PIPE_INFORMATION[16]

}
