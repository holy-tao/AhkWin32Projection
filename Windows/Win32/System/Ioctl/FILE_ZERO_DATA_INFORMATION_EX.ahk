#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FILE_ZERO_DATA_INFORMATION_EX {
    #StructPack 8

    FileOffset : Int64

    BeyondFinalZero : Int64

    Flags : UInt32

}
