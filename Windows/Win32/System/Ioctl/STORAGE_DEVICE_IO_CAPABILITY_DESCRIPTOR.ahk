#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The output buffer for the StorageDeviceIoCapabilityProperty as defined in STORAGE_PROPERTY_ID.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_io_capability_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_IO_CAPABILITY_DESCRIPTOR {
    #StructPack 4

    /**
     * The version of this structure. The Size serves as the version.
     */
    Version : UInt32

    /**
     * The size of this structure.
     */
    Size : UInt32

    /**
     * The logical unit number (LUN) max outstanding I/O count.
     */
    LunMaxIoCount : UInt32

    /**
     * The adapter max outstanding I/O count.
     */
    AdapterMaxIoCount : UInt32

}
