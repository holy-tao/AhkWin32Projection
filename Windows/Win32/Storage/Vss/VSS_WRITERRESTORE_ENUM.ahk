#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicate to a requester the conditions under which it will handle events generated during a restore operation.
 * @remarks
 * 
 * A writer passes a value of 
 *     <b>VSS_WRITERRESTORE_ENUM</b> to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-setrestoremethod">IVssCreateWriterMetadata::SetRestoreMethod</a> 
 *     to indicate through its metadata how it interacts with requesters during a restore operation.
 * 
 * A requester retrieves information about a writer's participation by calling 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssexaminewritermetadata-getrestoremethod">IVssExamineWriterMetadata::GetRestoreMethod</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/ne-vswriter-vss_writerrestore_enum
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_WRITERRESTORE_ENUM{

    /**
     * It is not known whether the writer will perform special operations during the restore operation. 
 *       
 * 
 * This state indicates a writer error.
     * @type {Integer (Int32)}
     */
    static VSS_WRE_UNDEFINED => 0

    /**
     * The writer does not require restore events.
     * @type {Integer (Int32)}
     */
    static VSS_WRE_NEVER => 1

    /**
     * Indicates that the writer always expects to handle a 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-prerestore">PreRestore</a> 
 *       (<a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onprerestore">CvssWriter::OnPreRestore</a>) event, but expects 
 *       to handle a <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-postrestore">PostRestore</a> event 
 *       (<a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-cvsswriter-onpostrestore">CvssWriter::OnPostRestore</a>) only if a restore 
 *       fails when implementing either a <b>VSS_RME_RESTORE_IF_NOT_THERE</b> or 
 *       <b>VSS_RME_RESTORE_IF_CAN_REPLACE</b> restore method 
 *       (<a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restoremethod_enum">VSS_RESTOREMETHOD_ENUM</a>).
     * @type {Integer (Int32)}
     */
    static VSS_WRE_IF_REPLACE_FAILS => 2

    /**
     * The writer always performs special operations during the restore operation.
     * @type {Integer (Int32)}
     */
    static VSS_WRE_ALWAYS => 3
}
