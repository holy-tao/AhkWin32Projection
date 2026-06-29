#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\_URB_HEADER.ahk" { _URB_HEADER }

/**
 * @namespace Windows.Win32.Devices.Usb
 */
export default struct _URB_GET_CURRENT_FRAME_NUMBER {
    #StructPack 8

    Hdr : _URB_HEADER

    FrameNumber : UInt32

}
