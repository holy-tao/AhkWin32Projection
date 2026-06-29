#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DEVICE_DSM_LOST_QUERY_PARAMETERS {
    #StructPack 8

    Version : UInt32

    Granularity : Int64

}
