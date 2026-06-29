#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY control code to retrieve the storage access alignment descriptor data for a device.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-storage_access_alignment_descriptor
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_ACCESS_ALIGNMENT_DESCRIPTOR {
    #StructPack 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
     */
    Version : UInt32

    /**
     * Specifies the total size of the data returned, in bytes. This may include data that follows this 
     *       structure.
     */
    Size : UInt32

    /**
     * The number of bytes in a cache line of the device.
     */
    BytesPerCacheLine : UInt32

    /**
     * The address offset necessary for proper cache access alignment, in bytes.
     */
    BytesOffsetForCacheAlignment : UInt32

    /**
     * The number of bytes in a logical sector of the device.
     */
    BytesPerLogicalSector : UInt32

    /**
     * The number of bytes in a physical sector of the device.
     */
    BytesPerPhysicalSector : UInt32

    /**
     * The logical sector offset within the first physical sector where the first logical sector is placed, in bytes.
     * 
     * Example:  Offset = 3 Logical sectors
     * 
     * 
     * ``` syntax
     * +---------+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
     * |LBA      |##|##|##|00|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|
     * +---------+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
     * |Physical |                       |                       |                ...
     * |Sector   |           0           |           1           |           2
     * +---------+-----------------------+-----------------------+---------------
     * ```
     * 
     * In this example, <c>BytesOffsetForSectorAlignment = 3 * BytesPerLogicalSector</c>.
     */
    BytesOffsetForSectorAlignment : UInt32

}
