#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct EXTENDED_ENCRYPTED_DATA_INFO {
    #StructPack 4

    ExtendedCode : UInt32

    Length : UInt32

    Flags : UInt32

    Reserved : UInt32

}
