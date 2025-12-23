#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class NTFS_EXTENDED_VOLUME_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 4

    /**
     * 
     * @type {Integer}
     */
    ByteCount {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    MajorVersion {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    MinorVersion {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * 
     * @type {Integer}
     */
    BytesPerPhysicalSector {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * 
     * @type {Integer}
     */
    LfsMajorVersion {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * 
     * @type {Integer}
     */
    LfsMinorVersion {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * 
     * @type {Integer}
     */
    MaxDeviceTrimExtentCount {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * 
     * @type {Integer}
     */
    MaxDeviceTrimByteCount {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * 
     * @type {Integer}
     */
    MaxVolumeTrimExtentCount {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * 
     * @type {Integer}
     */
    MaxVolumeTrimByteCount {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }
}
