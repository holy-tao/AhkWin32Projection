#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FSCTL_OFFLOAD_WRITE_INPUT {
    #StructPack 8

    Size : UInt32

    Flags : UInt32

    FileOffset : Int64

    CopyLength : Int64

    TransferOffset : Int64

    Token : Int8[512]

}
