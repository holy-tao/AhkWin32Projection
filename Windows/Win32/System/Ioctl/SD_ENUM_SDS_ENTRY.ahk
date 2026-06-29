#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SD_ENUM_SDS_ENTRY {
    #StructPack 8

    Hash : UInt32

    SecurityId : UInt32

    Offset : Int64

    Length : UInt32

    Descriptor : Int8[1]

}
