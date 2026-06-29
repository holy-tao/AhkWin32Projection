#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_LOGGING {
    #StructPack 8

    Function : Int8

    BufferAddress : IntPtr

    BufferSize : UInt32

}
