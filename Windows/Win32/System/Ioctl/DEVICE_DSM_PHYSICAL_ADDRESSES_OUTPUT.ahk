#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_STORAGE_ADDRESS_RANGE.ahk" { DEVICE_STORAGE_ADDRESS_RANGE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_PHYSICAL_ADDRESSES_OUTPUT {
    #StructPack 8

    Version : UInt32

    Flags : UInt32

    TotalNumberOfRanges : UInt32

    NumberOfRangesReturned : UInt32

    Ranges : DEVICE_STORAGE_ADDRESS_RANGE[1]

}
