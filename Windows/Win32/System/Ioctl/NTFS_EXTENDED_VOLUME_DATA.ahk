#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents volume data.N
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
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-ntfs_extended_volume_data
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct NTFS_EXTENDED_VOLUME_DATA {
    #StructPack 4

    ByteCount : UInt32

    MajorVersion : UInt16

    MinorVersion : UInt16

    BytesPerPhysicalSector : UInt32

    LfsMajorVersion : UInt16

    LfsMinorVersion : UInt16

    MaxDeviceTrimExtentCount : UInt32

    MaxDeviceTrimByteCount : UInt32

    MaxVolumeTrimExtentCount : UInt32

    MaxVolumeTrimByteCount : UInt32

}
