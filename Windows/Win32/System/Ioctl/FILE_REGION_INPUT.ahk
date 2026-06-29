#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_REGION_INPUT {
    #StructPack 8

    FileOffset : Int64

    Length : Int64

    DesiredUsage : UInt32

}
