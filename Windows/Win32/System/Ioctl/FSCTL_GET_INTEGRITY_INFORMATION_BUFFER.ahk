#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the integrity information for a file or directory.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-fsctl_get_integrity_information_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FSCTL_GET_INTEGRITY_INFORMATION_BUFFER extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The checksum algorithm used.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHECKSUM_TYPE_NONE"></a><a id="checksum_type_none"></a><dl>
     * <dt><b>CHECKSUM_TYPE_NONE</b></dt>
     * <dt>0x0000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory is not configured to use integrity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CHECKSUM_TYPE_CRC64"></a><a id="checksum_type_crc64"></a><dl>
     * <dt><b>CHECKSUM_TYPE_CRC64</b></dt>
     * <dt>0x0002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The file or directory uses a CRC64 checksum to provide integrity.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>3–0xffff</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Reserved for future use.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    ChecksumAlgorithm {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * Reserved for future use.  Set to 0.
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * Contains one or more flags.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FSCTL_INTEGRITY_FLAG_CHECKSUM_ENFORCEMENT_OFF"></a><a id="fsctl_integrity_flag_checksum_enforcement_off"></a><dl>
     * <dt><b>FSCTL_INTEGRITY_FLAG_CHECKSUM_ENFORCEMENT_OFF</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * If set, the checksum enforcement is disabled.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Size in bytes of the chunks used to calculate checksums.
     * @type {Integer}
     */
    ChecksumChunkSizeInBytes {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Size in bytes of a cluster for this volume. This value must be a power of 2, must be greater than or equal 
     *       to the sector size of the underlying hardware and must be a power of 2 multiple of the sector size.
     * @type {Integer}
     */
    ClusterSizeInBytes {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
