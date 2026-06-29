#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDEO_HARDWARE_STATE_HEADER.ahk" { VIDEO_HARDWARE_STATE_HEADER }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_HARDWARE_STATE {
    #StructPack 8

    StateHeader : VIDEO_HARDWARE_STATE_HEADER.Ptr

    StateLength : UInt32

}
