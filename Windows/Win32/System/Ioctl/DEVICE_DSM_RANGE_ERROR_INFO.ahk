#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_STORAGE_RANGE_ATTRIBUTES.ahk" { DEVICE_STORAGE_RANGE_ATTRIBUTES }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_RANGE_ERROR_INFO {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    TotalNumberOfRanges : UInt32

    NumberOfRangesReturned : UInt32

    Ranges : DEVICE_STORAGE_RANGE_ATTRIBUTES[1]

}
