#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USBD_PIPE_TYPE.ahk" { USBD_PIPE_TYPE }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct USBD_PIPE_INFORMATION {
    #StructPack 8

    MaximumPacketSize : UInt16

    EndpointAddress : Int8

    Interval : Int8

    PipeType : USBD_PIPE_TYPE

    PipeHandle : IntPtr

    MaximumTransferSize : UInt32

    PipeFlags : UInt32

}
