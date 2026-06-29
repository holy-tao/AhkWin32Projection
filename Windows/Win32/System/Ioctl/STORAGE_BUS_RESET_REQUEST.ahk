#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_BUS_RESET_REQUEST {
    #StructPack 1

    PathId : Int8

}
