#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of statuses of a file restore operation.
 * @remarks
 * 
 * If any files managed by a component or, if it defines a component set, any of its subcomponents cannot be 
 *     restored, the value of <b>VSS_FILE_RESTORE_STATUS</b> 
 *     must indicate an error.
 * 
 * Both the values <b>VSS_RS_FAILED</b> and <b>VSS_RS_NONE</b> indicate 
 *     that a restore operation did not complete successfully:
 * 
 * <ul>
 * <li><b>VSS_RS_NONE</b> indicates a restore failed gracefully: no files from the component 
 *       or its subcomponents were restored to disk.</li>
 * <li><b>VSS_RS_FAIL</b> indicates a restore failed gracelessly, leaving some files restored 
 *       to disk and some files unrestored.</li>
 * </ul>
 * Requesters must set a restore status (using 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setfilerestorestatus">IVssBackupComponents::SetFileRestoreStatus</a>) 
 *     for every component (and its component set, if it defines one) explicitly added for restore to the Backup 
 *     Components Document (using either 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setselectedforrestore">IVssBackupComponents::SetSelectedForRestore</a> or 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-addrestoresubcomponent">IVssBackupComponents::AddRestoreSubcomponent</a>).
 * 
 * Writers and requesters can query the status of the restoration of a component or a component set defined by a 
 *     selectable component with calls to 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getfilerestorestatus">IVssComponent::GetFileRestoreStatus</a>. If
 *     this method is called for a component that was not selected, the value returned is undefined.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/ne-vswriter-vss_file_restore_status
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_FILE_RESTORE_STATUS extends Win32Enum{

    /**
     * The restore state is undefined. 
     *       
     * 
     * This value indicates an error, or indicates that a restore operation has not yet started.
     * 
     * This value is not supported for components that are owned by express writers.
     * @type {Integer (Int32)}
     */
    static VSS_RS_UNDEFINED => 0

    /**
     * No files were restored. 
     *       
     * 
     * This value indicates an error in restoration that did not leave any restored files on disk.
     * @type {Integer (Int32)}
     */
    static VSS_RS_NONE => 1

    /**
     * All files were restored. This value indicates success and should be set for each component that was 
     *       restored successfully.
     * @type {Integer (Int32)}
     */
    static VSS_RS_ALL => 2

    /**
     * The restore process failed. 
     *       
     * 
     * This value indicates an error in restoration that did leave some restored files on disk. This means the 
     *        components on disk are now corrupt.
     * @type {Integer (Int32)}
     */
    static VSS_RS_FAILED => 3
}
