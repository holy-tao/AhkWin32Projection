#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The output buffer for the StorageDeviceIoCapabilityProperty as defined in STORAGE_PROPERTY_ID.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_io_capability_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_IO_CAPABILITY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The version of this structure. The Size serves as the version.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of this structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The logical unit number (LUN) max outstanding I/O count.
     * @type {Integer}
     */
    LunMaxIoCount {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The adapter max outstanding I/O count.
     * @type {Integer}
     */
    AdapterMaxIoCount {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
