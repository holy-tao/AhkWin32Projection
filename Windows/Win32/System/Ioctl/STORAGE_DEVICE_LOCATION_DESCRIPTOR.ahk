#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_LOCATION.ahk" { DEVICE_LOCATION }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_LOCATION_DESCRIPTOR {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Location : DEVICE_LOCATION

    StringOffset : UInt32

}
