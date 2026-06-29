#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_UNSAFE_SHUTDOWN_COUNT {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    UnsafeShutdownCount : UInt32

}
