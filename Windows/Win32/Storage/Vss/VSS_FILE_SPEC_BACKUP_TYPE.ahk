#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used by writers to indicate their support of certain backup operations.
 * @remarks
 * 
 * When a writer sets a backup-required value of the 
 *     <b>VSS_FILE_SPEC_BACKUP_TYPE</b> enumeration, it is 
 *     indicating that the requester perform the backup in such a way that, when the backup is restored, the current 
 *     version of the file set is restored. Typically, this means that the file set is copied as part of the backup.
 * 
 * This setting can be overridden if a file is added to the Backup Components Document as a differenced file 
 *     (using 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-adddifferencedfilesbylastmodifytime">IVssComponent::AddDifferencedFilesByLastModifyTime</a>) 
 *     or as a partial file (using 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-addpartialfile">IVssComponent::AddPartialFile</a>).
 * 
 * If a file is added as a differenced file, the writer establishes criteria by which the requester should decide 
 *     whether or not to actually copy a file to a backup medium. A writer typically adds differenced files to the Backup 
 *     Components Document for inclusion in a backup 
 *     <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PostSnapshot</a> event (see 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostsnapshot">CVssWriter::OnPostSnapshot</a>). See 
 *     <a href="https://docs.microsoft.com/windows/desktop/VSS/incremental-and-differential-backups">Incremental and Differential Backups</a> 
 *     for details.
 * 
 * When a writer sets a shadow copy-required value of the 
 *     <b>VSS_FILE_SPEC_BACKUP_TYPE</b> enumeration, it 
 *     indicates that the file set should be backed up from a shadow-copied volume. File sets not tagged with a 
 *     shadow copy-required value can be backed up from the original volume.
 * 
 * Writers set <b>VSS_FILE_SPEC_BACKUP_TYPE</b> values 
 *     while handling an <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-i">Identify</a> event (see 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onidentify">CVssWriter::OnIdentify</a>).
 * 
 * A bit mask (or bitwise OR) of 
 *     <b>VSS_FILE_SPEC_BACKUP_TYPE</b> values can be applied 
 *     to a file set when adding it to a component using the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-addfilestofilegroup">IVssCreateWriterMetadata::AddFilesToFileGroup</a>, 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabasefiles">IVssCreateWriterMetadata::AddDatabaseFiles</a>, or 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-adddatabaselogfiles">IVssCreateWriterMetadata::AddDatabaseLogFiles</a> 
 *     method.
 * 
 * If no explicit file specification backup type is supplied during the addition of a file specification to a 
 *     component, the specification is tagged with the default 
 *     <b>VSS_FILE_SPEC_BACKUP_TYPE</b> value:
 *     (VSS_FSBT_ALL_BACKUP_REQUIRED | VSS_FSBT_ALL_SNAPSHOT_REQUIRED).
 * 
 * Requesters or writers can recover a file set's file specification backup type by using the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsswmfiledesc-getbackuptypemask">IVssWMFiledesc::GetBackupTypeMask</a> 
 *     method.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_file_spec_backup_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_FILE_SPEC_BACKUP_TYPE extends Win32Enum{

    /**
     * A file set tagged with this value must be involved in all types of backup operations. 
     *      
     * 
     * A writer tags a file set with this value to indicate to the requester that it expects a copy of the current 
     *       version of the file set to be available following the restore of any backup operation with a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> of 
     *       <b>VSS_BT_FULL</b>.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_FULL_BACKUP_REQUIRED => 1

    /**
     * A writer tags a file set with this value to indicate to the requester that it expects a copy of the current 
     *       version of the file set to be available following the restore of any backup operation with a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> of 
     *       <b>VSS_BT_DIFFERENTIAL</b>.
     * 
     * This value is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_DIFFERENTIAL_BACKUP_REQUIRED => 2

    /**
     * A writer tags a file set with this value to indicate to the requester that it expects a copy of the current 
     *       version of the file set to be available following the restore of any backup operation with a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> of 
     *       <b>VSS_BT_INCREMENTAL</b>.
     * 
     * This value is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_INCREMENTAL_BACKUP_REQUIRED => 4

    /**
     * A writer tags a file set with this value to indicate to the requester that it expects a copy of the current 
     *       version of the file set to be available following the restore of any backup operation with a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> of 
     *       <b>VSS_BT_LOG</b>.
     * 
     * This value is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_LOG_BACKUP_REQUIRED => 8

    /**
     * A file set tagged with this value must be backed up from a shadow copy of a volume (and never from the 
     *       original volume) when participating in a backup operation with a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> of 
     *       <b>VSS_BT_FULL</b>.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_FULL_SNAPSHOT_REQUIRED => 256

    /**
     * A file set tagged with this value must be backed up from a shadow copy of a volume (and never from the 
     *       original volume) when participating in a backup operation with a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> of 
     *       <b>VSS_BT_DIFFERENTIAL</b>.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_DIFFERENTIAL_SNAPSHOT_REQUIRED => 512

    /**
     * A file set tagged with this value must be backed up from a shadow copy of a volume (and never from the 
     *       original volume) when participating in a backup operation with a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> of 
     *       <b>VSS_BT_INCREMENTAL</b>.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_INCREMENTAL_SNAPSHOT_REQUIRED => 1024

    /**
     * A file set tagged with this value must be backed up from a shadow copy of a volume (and never from the 
     *       original volume) when participating in a backup operation with a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_backup_type">VSS_BACKUP_TYPE</a> of 
     *       <b>VSS_BT_LOG</b>).
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_LOG_SNAPSHOT_REQUIRED => 2048

    /**
     * A writer tags a file set with this value to indicate to the requester that they expect the file to be created during the snapshot sequence.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_CREATED_DURING_BACKUP => 65536

    /**
     * The default file backup specification type. A file set tagged with this value must always participate in 
     *       backup and restore operations.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_ALL_BACKUP_REQUIRED => 15

    /**
     * The shadow copy requirement for backup. A file set tagged with this value must always be backed up from a 
     *       shadow copy of a volume (and never from the original volume) when participating in a backup operation.
     * @type {Integer (Int32)}
     */
    static VSS_FSBT_ALL_SNAPSHOT_REQUIRED => 3840
}
