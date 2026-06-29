#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_LOST_QUERY_OUTPUT {
    #StructPack 8

    Version : UInt32

    Size : UInt32

    Alignment : Int64

    NumberOfBits : UInt32

    BitMap : UInt32[1]

}
