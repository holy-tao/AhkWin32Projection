#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_PIPE_REQUEST {
    #StructPack 8

    Hdr : _URB_HEADER

    PipeHandle : IntPtr

    Reserved : UInt32

}
