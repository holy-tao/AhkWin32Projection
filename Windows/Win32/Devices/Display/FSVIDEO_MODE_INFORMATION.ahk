#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\VIDEO_MEMORY_INFORMATION.ahk" { VIDEO_MEMORY_INFORMATION }
#Import ".\VIDEO_MODE_INFORMATION.ahk" { VIDEO_MODE_INFORMATION }

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct FSVIDEO_MODE_INFORMATION {
    #StructPack 8

    VideoMode : VIDEO_MODE_INFORMATION

    VideoMemory : VIDEO_MEMORY_INFORMATION

}
