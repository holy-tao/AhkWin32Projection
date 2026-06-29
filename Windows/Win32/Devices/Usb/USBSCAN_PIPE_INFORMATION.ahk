#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RAW_PIPE_TYPE.ahk" { RAW_PIPE_TYPE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBSCAN_PIPE_INFORMATION {
    #StructPack 4

    MaximumPacketSize : UInt16

    EndpointAddress : Int8

    Interval : Int8

    PipeType : RAW_PIPE_TYPE

}
