#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DISK_SPACE_INFORMATION structure contains information about the disk space for a particular volume.
 * @see https://learn.microsoft.com/windows/win32/api/fileapi/ns-fileapi-disk_space_information
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct DISK_SPACE_INFORMATION {
    #StructPack 8

    /**
     * The `ActualTotalAllocationUnits` is the total volume size without considering Quota setting.
     */
    ActualTotalAllocationUnits : Int64

    /**
     * The `ActualTotalAllocationUnits` is the available space for the volume without considering Quota setting.
     */
    ActualAvailableAllocationUnits : Int64

    /**
     * The `ActualPoolUnavailableAllocationUnits` is the unavailable space for the volume due to insufficient free pool space
     */
    ActualPoolUnavailableAllocationUnits : Int64

    /**
     * The `CallerTotalAllocationUnits` is the total volume size limited by Quota setting.
     */
    CallerTotalAllocationUnits : Int64

    /**
     * The `CallerAvailableAllocationUnits` is the available space for the volume limited by Quota setting.
     */
    CallerAvailableAllocationUnits : Int64

    /**
     * The `CallerAvailableAllocationUnits` is the unavailable space for the volume due to insufficient free pool space.
     */
    CallerPoolUnavailableAllocationUnits : Int64

    /**
     * The used space of the volume.
     */
    UsedAllocationUnits : Int64

    /**
     * Total reserved space.
     */
    TotalReservedAllocationUnits : Int64

    /**
     * A special type of reserved space for per-volume storage reserve. This is included in the `TotalReservedAllocationUnits`.
     */
    VolumeStorageReserveAllocationUnits : Int64

    /**
     * The space that has been committed by storage pool but has not been allocated by file system.
     */
    AvailableCommittedAllocationUnits : Int64

    /**
     * Available space in corresponding storage pool. If the volume is not a spaces volume, the `PoolAvailableAllocationUnits` is set to `0`.
     */
    PoolAvailableAllocationUnits : Int64

    /**
     * The number of sectors per allocation unit for the volume.
     */
    SectorsPerAllocationUnit : UInt32

    /**
     * The number of bytes per sector for the volume.
     */
    BytesPerSector : UInt32

}
