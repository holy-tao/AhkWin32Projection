#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct WRITE_USN_REASON_INPUT {
    #StructPack 4

    Flags : UInt32

    UsnReasonToWrite : UInt32

}
