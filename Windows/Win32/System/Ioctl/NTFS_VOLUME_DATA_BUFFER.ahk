#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents volume data.
 * @remarks
 * 
 * Reserved clusters are the free clusters reserved for later use by Windows.
 * 
 * The <b>NTFS_VOLUME_DATA_BUFFER</b> structure represents the basic information returned by <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_volume_data">FSCTL_GET_NTFS_VOLUME_DATA</a>. For extended volume information,  pass a buffer that is the combined size of the <b>NTFS_VOLUME_DATA_BUFFER</b>  and <b>NTFS_EXTENDED_VOLUME_DATA</b> structures. Upon success, the  buffer returned by <b>FSCTL_GET_NTFS_VOLUME_DATA</b> will contain the information associated with both structures. The <b>NTFS_VOLUME_DATA_BUFFER</b> structure will always be filled starting at the beginning of the buffer, with the <b>NTFS_EXTENDED_VOLUME_DATA</b> structure immediately following. The <b>NTFS_EXTENDED_VOLUME_DATA</b> structure is defined as follows: 
 * 				
 * 
 * <div class="code"><span codelanguage="ManagedCPlusPlus"><table>
 * <tr>
 * <th>C++</th>
 * </tr>
 * <tr>
 * <td>
 * <pre>typedef struct {
 *     ULONG ByteCount;
 *     USHORT MajorVersion;
 *     USHORT MinorVersion;
 * } NTFS_EXTENDED_VOLUME_DATA, *PNTFS_EXTENDED_VOLUME_DATA;</pre>
 * </td>
 * </tr>
 * </table></span></div>
 * This structure contains the major and minor version information for an NTFS volume. The <b>ByteCount</b> member will return the total bytes  of the output buffer used for this structure by the call to <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_volume_data">FSCTL_GET_NTFS_VOLUME_DATA</a>. This value should be <c>sizeof(NTFS_EXTENDED_VOLUME_DATA)</code> if the buffer passed was large enough to hold it, otherwise the value will be less than <code>sizeof(NTFS_EXTENDED_VOLUME_DATA)</c>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-ntfs_volume_data_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class NTFS_VOLUME_DATA_BUFFER extends Win32Struct
{
    static sizeof => 96

    static packingSize => 8

    /**
     * The serial number of the volume. This is a unique number assigned to the volume media by the operating system.
     * @type {Integer}
     */
    VolumeSerialNumber {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The number of sectors in the specified volume.
     * @type {Integer}
     */
    NumberSectors {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The number of used and free clusters in the specified volume.
     * @type {Integer}
     */
    TotalClusters {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * The number of free clusters in the specified volume.
     * @type {Integer}
     */
    FreeClusters {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }

    /**
     * The number of reserved clusters in the specified volume.
     * @type {Integer}
     */
    TotalReserved {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }

    /**
     * The number of bytes in a sector on the specified volume.
     * @type {Integer}
     */
    BytesPerSector {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * The number of bytes in a cluster on the specified volume. This value is also known as the cluster factor.
     * @type {Integer}
     */
    BytesPerCluster {
        get => NumGet(this, 44, "uint")
        set => NumPut("uint", value, this, 44)
    }

    /**
     * The number of bytes in a file record segment.
     * @type {Integer}
     */
    BytesPerFileRecordSegment {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * The number of clusters in a file record segment.
     * @type {Integer}
     */
    ClustersPerFileRecordSegment {
        get => NumGet(this, 52, "uint")
        set => NumPut("uint", value, this, 52)
    }

    /**
     * The length of the master file table, in bytes.
     * @type {Integer}
     */
    MftValidDataLength {
        get => NumGet(this, 56, "int64")
        set => NumPut("int64", value, this, 56)
    }

    /**
     * The starting logical cluster number of the master file table.
     * @type {Integer}
     */
    MftStartLcn {
        get => NumGet(this, 64, "int64")
        set => NumPut("int64", value, this, 64)
    }

    /**
     * The starting logical cluster number of the master file table mirror.
     * @type {Integer}
     */
    Mft2StartLcn {
        get => NumGet(this, 72, "int64")
        set => NumPut("int64", value, this, 72)
    }

    /**
     * The starting logical cluster number of the master file table zone.
     * @type {Integer}
     */
    MftZoneStart {
        get => NumGet(this, 80, "int64")
        set => NumPut("int64", value, this, 80)
    }

    /**
     * The ending logical cluster number of the master file table zone.
     * @type {Integer}
     */
    MftZoneEnd {
        get => NumGet(this, 88, "int64")
        set => NumPut("int64", value, this, 88)
    }
}
