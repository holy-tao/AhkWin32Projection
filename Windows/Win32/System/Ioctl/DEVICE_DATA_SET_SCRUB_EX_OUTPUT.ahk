#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DEVICE_DATA_SET_RANGE.ahk" { DEVICE_DATA_SET_RANGE }

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DATA_SET_SCRUB_EX_OUTPUT {
    #StructPack 8

    BytesProcessed : Int64

    BytesRepaired : Int64

    BytesFailed : Int64

    ParityExtent : DEVICE_DATA_SET_RANGE

    BytesScrubbed : Int64

}
