#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\USBD_STREAM_INFORMATION.ahk" { USBD_STREAM_INFORMATION }
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_OPEN_STATIC_STREAMS {
    #StructPack 8

    Hdr : _URB_HEADER

    PipeHandle : IntPtr

    NumberOfStreams : UInt32

    StreamInfoVersion : UInt16

    StreamInfoSize : UInt16

    Streams : USBD_STREAM_INFORMATION.Ptr

}
