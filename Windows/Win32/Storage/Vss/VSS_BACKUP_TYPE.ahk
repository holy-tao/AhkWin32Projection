#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the type of backup to be performed.
 * @remarks
 * 
 * An implementation of a backup type defined by a 
 *     <b>VSS_BACKUP_TYPE</b> value must be done using the VSS API.
 * 
 * This is particularly true in the case of incremental (<b>VSS_BT_INCREMENTAL</b>) and 
 *     differential (<b>VSS_BT_DIFFERENTIAL</b>) backups. In these cases, requesters and writers 
 *     work together using the file backup specification masks 
 *     (<a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_file_spec_backup_type">VSS_FILE_SPEC_BACKUP_TYPE</a>), and designations of 
 *     files as being part of partial and differenced file operations to select which files must be backed up.
 * 
 * A requester may also use other more traditional techniques to implement an incremental or differential 
 *     restore, but it must not override the information provided through the VSS interfaces.
 * 
 * If a requester, when processing a given backup type, encounters a writer that does not support that backup 
 *     type, the requester performs backup or restore operations for that particular writer's data as if the backup type 
 *     was <b>VSS_BT_FULL</b>.
 * 
 * Requesters set the backup type with a call to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setbackupstate">IVssBackupComponents::SetBackupState</a>.
 * 
 * Writers use 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-getbackuptype">CVssWriter::GetBackupType</a> to determine the 
 *     backup type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_backup_type
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_BACKUP_TYPE{

    /**
     * The backup type is not known. 
 *       
 * 
 * This value indicates an application error.
     * @type {Integer (Int32)}
     */
    static VSS_BT_UNDEFINED => 0

    /**
     * Full backup: all files, regardless of whether they have been marked as backed up or not, are saved. This is 
 *       the default backup type and schema, and all writers support it. 
 *       
 * 
 * Each file's backup history will be updated to reflect that it was backed up.
     * @type {Integer (Int32)}
     */
    static VSS_BT_FULL => 1

    /**
     * Incremental backup: files created or changed since the last full or incremental backup are saved. Files are 
 *       marked as having been backed up. 
 *       
 * 
 * A requester can implement this sort of backup on a particular writer only if it supports the 
 *        <b>VSS_BS_INCREMENTAL</b> schema.
 * 
 * If a requester's backup type is <b>VSS_BT_INCREMENTAL</b> and a particular writer's 
 *        backup schema does not support that sort of backup, the requester will always perform a full 
 *        (<b>VSS_BT_FULL</b>) backup on that writer's data.
     * @type {Integer (Int32)}
     */
    static VSS_BT_INCREMENTAL => 2

    /**
     * Differential backup: files created or changed since the last full backup are saved. Files are not marked as 
 *       having been backed up. 
 *       
 * 
 * A requester can implement this sort of backup on a particular writer only if it supports the
 *        <b>VSS_BS_DIFFERENTIAL</b> schema.
 * 
 * If a requester's backup type is <b>VSS_BT_DIFFERENTIAL</b> and a particular writer's 
 *        backup schema does not support that sort of backup, the requester will always perform a full 
 *        (<b>VSS_BT_FULL</b>) backup on that writer's data.
     * @type {Integer (Int32)}
     */
    static VSS_BT_DIFFERENTIAL => 3

    /**
     * The log file of a writer is to participate in backup or restore operations. 
 *       
 * 
 * A requester can implement this sort of backup on a particular writer only if it supports the 
 *        <b>VSS_BS_LOG</b> schema.
 * 
 * If a requester's backup type is <b>VSS_BT_LOG</b> and a particular writer's backup 
 *        schema does not support that sort of backup, the requester will always perform a full 
 *        (<b>VSS_BT_FULL</b>) backup on that writer's data.
     * @type {Integer (Int32)}
     */
    static VSS_BT_LOG => 4

    /**
     * Files on disk will be copied to a backup medium regardless of the state of each file's backup history, and 
 *       the backup history will not be updated. 
 *       
 * 
 * A requester can implement this sort of backup on a particular writer only if it supports the 
 *        <b>VSS_BS_COPY</b> schema.
 * 
 * If a requester's backup type is <b>VSS_BT_COPY</b> and a particular writer's backup 
 *        schema does not support that sort of backup, the requester will always perform a full 
 *        (<b>VSS_BT_FULL</b>) backup on that writer's data.
     * @type {Integer (Int32)}
     */
    static VSS_BT_COPY => 5

    /**
     * Backup type that is not full, copy, log, incremental, or differential.
     * @type {Integer (Int32)}
     */
    static VSS_BT_OTHER => 6
}
