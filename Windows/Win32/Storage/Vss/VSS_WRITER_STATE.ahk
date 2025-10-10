#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the current state of the writer.
 * @remarks
 * 
  * A requester determines the state of a writer through 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getwriterstatus">IVssBackupComponents::GetWriterStatus</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_writer_state
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_WRITER_STATE{

    /**
     * The writer's state is not known. 
 *       
 * 
 * This indicates an error on the part of the writer.
     * @type {Integer (Int32)}
     */
    static VSS_WS_UNKNOWN => 0

    /**
     * The writer has completed processing current shadow copy events and is ready to proceed, or 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpreparesnapshot">CVssWriter::OnPrepareSnapshot</a> has not yet 
 *       been called.
     * @type {Integer (Int32)}
     */
    static VSS_WS_STABLE => 1

    /**
     * The writer is waiting for the freeze state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_WAITING_FOR_FREEZE => 2

    /**
     * The writer is waiting for the thaw state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_WAITING_FOR_THAW => 3

    /**
     * The writer is waiting for the 
 *      <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PostSnapshot</a> state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_WAITING_FOR_POST_SNAPSHOT => 4

    /**
     * The writer is waiting for the requester to finish its backup operation.
     * @type {Integer (Int32)}
     */
    static VSS_WS_WAITING_FOR_BACKUP_COMPLETE => 5

    /**
     * The writer vetoed the shadow copy creation process at the writer identification state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_IDENTIFY => 6

    /**
     * The writer vetoed the shadow copy creation process during the backup preparation state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_PREPARE_BACKUP => 7

    /**
     * The writer vetoed the shadow copy creation process during the <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PrepareForSnapshot</a> state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_PREPARE_SNAPSHOT => 8

    /**
     * The writer vetoed the shadow copy creation process during the freeze state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_FREEZE => 9

    /**
     * The writer vetoed the shadow copy creation process during the thaw state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_THAW => 10

    /**
     * The writer vetoed the shadow copy creation process during the 
 *      <a href="https://docs.microsoft.com/windows/desktop/VSS/vssgloss-p">PostSnapshot</a> state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_POST_SNAPSHOT => 11

    /**
     * The shadow copy has been created and the writer failed during the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-backupcomplete">BackupComplete</a> state. A writer 
 *       should save information about this failure to the error log. For additional information on logging, see 
 *       <a href="https://docs.microsoft.com/windows/desktop/VSS/event-and-error-handling-under-vss">Event and Error Handling Under VSS</a>.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_BACKUP_COMPLETE => 12

    /**
     * The writer failed during the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">PreRestore</a> state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_PRE_RESTORE => 13

    /**
     * The writer failed during the 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-postrestore">PostRestore</a> state.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_POST_RESTORE => 14

    /**
     * The writer failed during the shutdown of the backup application.
     * @type {Integer (Int32)}
     */
    static VSS_WS_FAILED_AT_BACKUPSHUTDOWN => 15

    /**
     * Reserved value.
     * @type {Integer (Int32)}
     */
    static VSS_WS_COUNT => 16
}
