#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines the set of valid types for a file system.
 * @remarks
 * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_file_system_prop">VDS_FILE_SYSTEM_PROP</a>structure includes a <b>VDS_FILE_SYSTEM_TYPE</b> value as a member to indicate an existing file system type.
  * 
  * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_FILE_SYSTEM_TYPE</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_FILE_SYSTEM_TYPE</b> enumeration constant.</div>
  * <div> </div>
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_file_system_type
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_FILE_SYSTEM_TYPE{

    /**
     * The file system is unknown. The <a href="https://docs.microsoft.com/windows/desktop/api/vds/nf-vds-ivdsvolumemf-getfilesystemproperties">IVdsVolumeMF::GetFileSystemProperties</a> method returns this value in the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_file_system_prop">VDS_FILE_SYSTEM_PROP</a> structure for BitLocker-encrypted volumes.
     * @type {Integer (Int32)}
     */
    static VDS_FST_UNKNOWN => 0

    /**
     * The file system is raw.
     * @type {Integer (Int32)}
     */
    static VDS_FST_RAW => 1

    /**
     * The file system is file allocation table (FAT).
     * @type {Integer (Int32)}
     */
    static VDS_FST_FAT => 2

    /**
     * The file system is file allocation table for 32-bit computers (FAT32).
     * @type {Integer (Int32)}
     */
    static VDS_FST_FAT32 => 3

    /**
     * The file system is the NT file system (NTFS).
     * @type {Integer (Int32)}
     */
    static VDS_FST_NTFS => 4

    /**
     * The file system is the CD-ROM file system (CDFS).
     * @type {Integer (Int32)}
     */
    static VDS_FST_CDFS => 5

    /**
     * The file system is Universal Disk Format (UDF).
     * @type {Integer (Int32)}
     */
    static VDS_FST_UDF => 6

    /**
     * The file system is extended file allocation table (exFAT).
 * 
 * <b>Windows Server 2008, Windows Vista and Windows Server 2003:  </b>The VDS_FST_EXFAT file type value is not supported.
     * @type {Integer (Int32)}
     */
    static VDS_FST_EXFAT => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDS_FST_CSVFS => 8

    /**
     * 
     * @type {Integer (Int32)}
     */
    static VDS_FST_REFS => 9
}
