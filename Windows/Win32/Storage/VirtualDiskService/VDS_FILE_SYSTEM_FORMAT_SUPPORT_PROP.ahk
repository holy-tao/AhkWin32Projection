#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Provides information about file systems that are supported for formatting volumes.
 * @remarks
 * If an OEM partition is formatted as FAT or FAT32, the partition type does not change. If it is formatted with NTFS, the partition type changes to PARTITION_IFS (0x07). For information about partition types, see <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-create_partition_parameters">CREATE_PARTITION_PARAMETERS</a>.
 * @see https://learn.microsoft.com/windows/win32/api/vds/ns-vds-vds_file_system_format_support_prop
 * @namespace Windows.Win32.Storage.VirtualDiskService
 */
export default struct VDS_FILE_SYSTEM_FORMAT_SUPPORT_PROP {
    #StructPack 4

    /**
     * Bitwise-OR of any of the values defined in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ne-vds-vds_file_system_format_support_flag">VDS_FILE_SYSTEM_FORMAT_SUPPORT_FLAG</a> enumeration.
     */
    ulFlags : UInt32

    /**
     * The revision of the file system, if any.  This member is expressed as a 16-bit binary-coded decimal number, where a decimal point is implied between the second and third digits. For example, a value of 0x0250 indicates revision 2.50.
     */
    usRevision : UInt16

    /**
     * Default allocation unit size, in bytes, that will be used by the file system for formatting the volume.  This value must be a power of 2 and must also appear in the <b>rgulAllowedUnitAllocationSizes</b> member.
     */
    ulDefaultUnitAllocationSize : UInt32

    /**
     * A zero-terminated array of allocation unit sizes, in bytes, that are supported by the file system for formatting the volume.  The case where the array will not be zero-terminated is if there are MAX_FS_ALLOWED_CLUSTER_SIZES_SIZE number of elements in the array.  Each of the values in the array must be a power of 2.
     */
    rgulAllowedUnitAllocationSizes : UInt32[32]

    /**
     * Null-terminated Unicode string indicating the name of the file system. Possible values include the following.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>L"CDFS"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * CD-ROM file system (CDFS)
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>L"FAT"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FAT file system
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>L"FAT32"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * FAT32 file system
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>L"NTFS"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * NTFS file system
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>L"UDF"</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Universal Disk Format (UDF) file system
     * 
     * </td>
     * </tr>
     * </table>
     */
    wszName : WCHAR[32]

}
