#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct REQUEST_RAW_ENCRYPTED_DATA {
    #StructPack 8

    FileOffset : Int64

    Length : UInt32

}
