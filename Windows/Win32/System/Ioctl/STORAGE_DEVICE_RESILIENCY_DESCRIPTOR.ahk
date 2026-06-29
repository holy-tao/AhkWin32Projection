#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Reserved for system use. (STORAGE_DEVICE_RESILIENCY_DESCRIPTOR)
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_device_resiliency_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_DEVICE_RESILIENCY_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure. Set to 
     *       <c>sizeof(STORAGE_DEVICE_RESILIENCY_DESCRIPTOR)</c>.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

    /**
     * Byte offset to the null-terminated ASCII string containing the resiliency properties Name. For devices with 
     *       no Name property, this will be zero.
     */
    NameOffset : UInt32

    /**
     * Number of logical copies of data that are available.
     */
    NumberOfLogicalCopies : UInt32

    /**
     * Number of complete copies of data that are stored.
     */
    NumberOfPhysicalCopies : UInt32

    /**
     * Number of disks that can fail without leading to data loss.
     */
    PhysicalDiskRedundancy : UInt32

    /**
     * Number of columns in the storage device.
     */
    NumberOfColumns : UInt32

    /**
     * Size of a stripe unit of the storage device, in bytes. This is also referred to as the stripe width or 
     *       interleave of the storage device.
     */
    Interleave : UInt32

}
