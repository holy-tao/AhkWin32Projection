#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FSCTL_OFFLOAD_WRITE_OUTPUT {
    #StructPack 8

    Size : UInt32

    Flags : UInt32

    LengthWritten : Int64

}
