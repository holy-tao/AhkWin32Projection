#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid flags for a file system.
 * @remarks
 * 
  * This enumeration provides the values for the <i>ulFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_file_system_prop">VDS_FILE_SYSTEM_PROP</a>structure. The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-setfilesystemflags">SetFileSystemFlags</a> method passes the value as an argument to set the <b>VDS_FPF_COMPRESSED</b> flag.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_FILE_SYSTEM_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_FILE_SYSTEM_FLAG</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_file_system_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_FILE_SYSTEM_FLAG{

    /**
     * If set, the file system supports format. The drop-down list of a user interface should display only file systems that support formatting.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_SUPPORT_FORMAT => 1

    /**
     * If set, the file system supports quick format.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_SUPPORT_QUICK_FORMAT => 2

    /**
     * If set, the file system supports file compression.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_SUPPORT_COMPRESS => 4

    /**
     * If set, the file system supports file system labels.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_SUPPORT_SPECIFY_LABEL => 8

    /**
     * If set, the file system supports mounted folders.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_SUPPORT_MOUNT_POINT => 16

    /**
     * If set, the file system supports removable media.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_SUPPORT_REMOVABLE_MEDIA => 32

    /**
     * If set, the file system supports extending volumes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_SUPPORT_EXTEND => 64

    /**
     * If set, the file system supports allocation units of 512 bytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_512 => 65536

    /**
     * If set, the file system supports allocation units of 1 kilobyte.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_1K => 131072

    /**
     * If set, the file system supports allocation units of 2 kilobytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_2K => 262144

    /**
     * If set, the file system supports allocation units of 4 kilobytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_4K => 524288

    /**
     * If set, the file system supports allocation units of 8 kilobytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_8K => 1048576

    /**
     * If set, the file system supports allocation units of 16 kilobytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_16K => 2097152

    /**
     * If set, the file system supports allocation units of 32 kilobytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_32K => 4194304

    /**
     * If set, the file system supports allocation units of 64 kilobytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_64K => 8388608

    /**
     * If set, the file system supports allocation units of 128 kilobytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_128K => 16777216

    /**
     * If set, the file system supports allocation units of 256 kilobytes.
     * @type {Integer (Int32)}
     */
    static VDS_FSF_ALLOCATION_UNIT_256K => 33554432
}
