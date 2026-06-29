#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct SD_ENUM_SDS_INPUT {
    #StructPack 8

    StartingOffset : Int64

    MaxSDEntriesToReturn : Int64

}
