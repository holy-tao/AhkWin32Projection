#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the integrity information for a file or directory.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-fsctl_get_integrity_information_buffer
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct FSCTL_GET_INTEGRITY_INFORMATION_BUFFER {
    #StructPack 4

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
     */
    ChecksumAlgorithm : UInt16

    /**
     * Reserved for future use.  Set to 0.
     */
    Reserved : UInt16

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
     */
    Flags : UInt32

    /**
     * Size in bytes of the chunks used to calculate checksums.
     */
    ChecksumChunkSizeInBytes : UInt32

    /**
     * Size in bytes of a cluster for this volume. This value must be a power of 2, must be greater than or equal 
     *       to the sector size of the underlying hardware and must be a power of 2 multiple of the sector size.
     */
    ClusterSizeInBytes : UInt32

}
