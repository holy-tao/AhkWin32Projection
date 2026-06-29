#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_GET_FRAME_LENGTH {
    #StructPack 8

    Hdr : _URB_HEADER

    FrameLength : UInt32

    FrameNumber : UInt32

}
