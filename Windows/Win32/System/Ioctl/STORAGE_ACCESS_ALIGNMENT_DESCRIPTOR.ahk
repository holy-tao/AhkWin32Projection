#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used in conjunction with the IOCTL_STORAGE_QUERY_PROPERTY control code to retrieve the storage access alignment descriptor data for a device.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-storage_access_alignment_descriptor
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_ACCESS_ALIGNMENT_DESCRIPTOR extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * Contains the size of this structure, in bytes. The value of this member will change as members are added to 
     *       the structure.
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
     * The number of bytes in a cache line of the device.
     * @type {Integer}
     */
    BytesPerCacheLine {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The address offset necessary for proper cache access alignment, in bytes.
     * @type {Integer}
     */
    BytesOffsetForCacheAlignment {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * The number of bytes in a logical sector of the device.
     * @type {Integer}
     */
    BytesPerLogicalSector {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of bytes in a physical sector of the device.
     * @type {Integer}
     */
    BytesPerPhysicalSector {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * The logical sector offset within the first physical sector where the first logical sector is placed, in bytes.
     * 
     * Example:  Offset = 3 Logical sectors
     * 
     * <pre class="syntax" xml:space="preserve"><code>+---------+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
     * |LBA      |##|##|##|00|01|02|03|04|05|06|07|08|09|10|11|12|13|14|15|16|17|
     * +---------+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+--+
     * |Physical |                       |                       |                ...
     * |Sector   |           0           |           1           |           2
     * +---------+-----------------------+-----------------------+---------------</code></pre>
     * In this example, <c>BytesOffsetForSectorAlignment = 3 * BytesPerLogicalSector</c>.
     * @type {Integer}
     */
    BytesOffsetForSectorAlignment {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
