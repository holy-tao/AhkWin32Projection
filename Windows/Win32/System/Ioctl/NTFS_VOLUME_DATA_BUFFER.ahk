#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents volume data. (NTFS_VOLUME_DATA_BUFFER)
 * @remarks
 * Reserved clusters are the free clusters reserved for later use by Windows.
 * 
 * The <b>NTFS_VOLUME_DATA_BUFFER</b> structure represents the basic information returned by <a href="https://docs.microsoft.com/windows/desktop/api/winioctl/ni-winioctl-fsctl_get_ntfs_volume_data">FSCTL_GET_NTFS_VOLUME_DATA</a>. For extended volume information,  pass a buffer that is the combined size of the <b>NTFS_VOLUME_DATA_BUFFER</b>  and <b>NTFS_EXTENDED_VOLUME_DATA</b> structures. Upon success, the  buffer returned by <b>FSCTL_GET_NTFS_VOLUME_DATA</b> will contain the information associated with both structures. The <b>NTFS_VOLUME_DATA_BUFFER</b> structure will always be filled starting at the beginning of the buffer, with the <b>NTFS_EXTENDED_VOLUME_DATA</b> structure immediately following. The <b>NTFS_EXTENDED_VOLUME_DATA</b> structure is defined as follows: 
 * 				
 * 
 * <div class="code"><span><table>
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
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-ntfs_volume_data_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct NTFS_VOLUME_DATA_BUFFER {
    #StructPack 8

    /**
     * The serial number of the volume. This is a unique number assigned to the volume media by the operating system.
     */
    VolumeSerialNumber : Int64

    /**
     * The number of sectors in the specified volume.
     */
    NumberSectors : Int64

    /**
     * The number of used and free clusters in the specified volume.
     */
    TotalClusters : Int64

    /**
     * The number of free clusters in the specified volume.
     */
    FreeClusters : Int64

    /**
     * The number of reserved clusters in the specified volume.
     */
    TotalReserved : Int64

    /**
     * The number of bytes in a sector on the specified volume.
     */
    BytesPerSector : UInt32

    /**
     * The number of bytes in a cluster on the specified volume. This value is also known as the cluster factor.
     */
    BytesPerCluster : UInt32

    /**
     * The number of bytes in a file record segment.
     */
    BytesPerFileRecordSegment : UInt32

    /**
     * The number of clusters in a file record segment.
     */
    ClustersPerFileRecordSegment : UInt32

    /**
     * The length of the master file table, in bytes.
     */
    MftValidDataLength : Int64

    /**
     * The starting logical cluster number of the master file table.
     */
    MftStartLcn : Int64

    /**
     * The starting logical cluster number of the master file table mirror.
     */
    Mft2StartLcn : Int64

    /**
     * The starting logical cluster number of the master file table zone.
     */
    MftZoneStart : Int64

    /**
     * The ending logical cluster number of the master file table zone.
     */
    MftZoneEnd : Int64

}
