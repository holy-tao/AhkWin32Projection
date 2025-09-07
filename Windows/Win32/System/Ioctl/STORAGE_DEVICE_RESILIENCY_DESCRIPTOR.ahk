#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Reserved for system use. (STORAGE_DEVICE_RESILIENCY_DESCRIPTOR)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_resiliency_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_RESILIENCY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure. Set to 
     *       <c>sizeof(STORAGE_DEVICE_RESILIENCY_DESCRIPTOR)</c>.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Byte offset to the null-terminated ASCII string containing the resiliency properties Name. For devices with 
     *       no Name property, this will be zero.
     * @type {Integer}
     */
    NameOffset {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Number of logical copies of data that are available.
     * @type {Integer}
     */
    NumberOfLogicalCopies {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Number of complete copies of data that are stored.
     * @type {Integer}
     */
    NumberOfPhysicalCopies {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Number of disks that can fail without leading to data loss.
     * @type {Integer}
     */
    PhysicalDiskRedundancy {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Number of columns in the storage device.
     * @type {Integer}
     */
    NumberOfColumns {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Size of a stripe unit of the storage device, in bytes. This is also referred to as the stripe width or 
     *       interleave of the storage device.
     * @type {Integer}
     */
    Interleave {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
