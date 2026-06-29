#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DATA_SET_SCRUB_OUTPUT {
    #StructPack 8

    BytesProcessed : Int64

    BytesRepaired : Int64

    BytesFailed : Int64

}
