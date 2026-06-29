#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct GP_LOG_PAGE_DESCRIPTOR {
    #StructPack 2

    LogAddress : UInt16

    LogSectors : UInt16

}
