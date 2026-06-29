#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_DEVICE_NUMBER.ahk" { STORAGE_DEVICE_NUMBER }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_NUMBERS {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    NumberOfDevices : UInt32

    Devices : STORAGE_DEVICE_NUMBER[1]

}
