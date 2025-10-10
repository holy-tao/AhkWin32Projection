#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by a writer at restore time to indicate how all the files included in a selected component, and all the files in any component set it defines, are to be restored.
 * @remarks
 * 
  * A target of <b>VSS_RT_UNDEFINED</b> indicates an error state.
  * 
  * At backup time, writers set the default restore behavior by indicating a restore method 
  *     (<a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restoremethod_enum">VSS_RESTOREMETHOD_ENUM</a>) set with 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-setrestoremethod">IVssCreateWriterMetadata::SetRestoreMethod</a>.
  * 
  * If a writer does not explicitly set the restore target of a component and any component set it defines, by 
  *     default it is set to <b>VSS_RT_ORIGINAL</b>.
  * 
  * At restore time, a <b>VSS_RESTORE_TARGET</b> value other 
  *     than <b>VSS_RT_ORIGINAL</b> overrides the value of the originally specified restore method 
  *     specified by <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restoremethod_enum">VSS_RESTOREMETHOD_ENUM</a> and set by 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscreatewritermetadata-setrestoremethod">IVssCreateWriterMetadata::SetRestoreMethod</a>.
  * 
  * Only writers (using 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-setrestoretarget">IVssComponent::SetRestoreTarget</a>) can set 
  *     a restore target (<b>VSS_RESTORE_TARGET</b>) and change how 
  *     files are restored overriding the restore method).
  * 
  * Requesters and writers can access the current restore target through 
  *     <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/nf-vswriter-ivsscomponent-getrestoretarget">IVssComponent::GetRestoreTarget</a>.
  * 
  * A restore target of <b>VSS_RT_ORIGINAL</b> does not mean that files should be restored to 
  *     their original location, but that the originally specified restore method 
  *     (<a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restoremethod_enum">VSS_RESTOREMETHOD_ENUM</a>) must be 
  *     respected. For instance, if a writer set a restore method of 
  *     <b>VSS_RME_RESTORE_TO_ALTERNATE_LOCATION</b> for a selected component and the restore target 
  *     is <b>VSS_RT_ORIGINAL</b>, files should be restored to the alternate location defined by the 
  *     writer.
  * 
  * (In this example, if a writer has failed to define alternate location mappings, then it is a writer error, and 
  *     the requester should report it.)
  * 
  * A restore target of <b>VSS_RT_ALTERNATE</b> without an alternate location mapping defined 
  *     constitutes a writer error, and the requester should report it as such.
  * 
  * See <a href="https://docs.microsoft.com/windows/desktop/VSS/non-default-backup-and-restore-locations">Non-Default Backup And Restore 
  *     Locations</a> for more information.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//vswriter/ne-vswriter-vss_restore_target
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_RESTORE_TARGET{

    /**
     * No target is defined. 
 *      
 * 
 * This value indicates an error on the part of the writer.
 * 
 * This value is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_RT_UNDEFINED => 0

    /**
     * This is the default restore target. 
 *       
 * 
 * This value indicates that the restoration of the files included in a selected component (or the component set 
 *        defined by that component) should proceed according to the original restore method specified at backup time by 
 *        a <a href="https://docs.microsoft.com/windows/desktop/api/vswriter/ne-vswriter-vss_restoremethod_enum">VSS_RESTOREMETHOD_ENUM</a> value.
     * @type {Integer (Int32)}
     */
    static VSS_RT_ORIGINAL => 1

    /**
     * The files are restored to a location determined from an existing alternate location mapping. 
 *       
 * 
 * The restore target should be set to <b>VSS_RT_ALTERNATE</b> only when alternate location 
 *        mappings have been set for all the files managed by a selected component or component set.
 * 
 * This value is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_RT_ALTERNATE => 2

    /**
     * Use directed targeting by the writer at restore time to restore a file.
 *       
 * 
 * Directed targeting allows a writer to control, on a file-by-file basis, how a file is 
 *        restored—indicating how much of a file is to be restored and into which files the 
 *        backed-up file is to be restored.
 * 
 * This value is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_RT_DIRECTED => 3

    /**
     * The files are restored to the location at which they were at backup time, even if the original 
 *       restore method that was specified at backup time was 
 *       <b>VSS_RME_RESTORE_TO_ALTERNATE_LOCATION</b>.
 *       
 * 
 * <b>Windows Server 2003 and Windows XP:  </b>This value is not supported.
 * 
 * This value is not supported for express writers.
     * @type {Integer (Int32)}
     */
    static VSS_RT_ORIGINAL_LOCATION => 4
}
