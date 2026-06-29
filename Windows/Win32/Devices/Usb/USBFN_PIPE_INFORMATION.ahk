#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USB_ENDPOINT_DESCRIPTOR.ahk" { USB_ENDPOINT_DESCRIPTOR }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBFN_PIPE_INFORMATION {
    #StructPack 4

    EpDesc : USB_ENDPOINT_DESCRIPTOR

    PipeId : UInt32

}
