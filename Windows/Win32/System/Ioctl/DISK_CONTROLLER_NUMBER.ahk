#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct DISK_CONTROLLER_NUMBER {
    #StructPack 4

    ControllerNumber : UInt32

    DiskNumber : UInt32

}
