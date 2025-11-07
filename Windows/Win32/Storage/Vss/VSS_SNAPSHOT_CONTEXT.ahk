#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specify how a shadow copy is to be created, queried, or deleted and the degree of writer involvement.
 * @remarks
 * 
 * The data type to be used with values of 
 *     <b>_VSS_SNAPSHOT_CONTEXT</b> is 
 *     <b>LONG</b>.
 * 
 * The default context for VSS shadow copies is <b>VSS_CTX_BACKUP</b>.
 * 
 * <b>Windows XP:  </b>The only supported context is the default, <b>VSS_CTX_BACKUP</b>. Calling 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setcontext">IVssBackupComponents::SetContext</a> will 
 *      return <b>E_NOTIMPL</b>.
 * 
 * For details on how to use VSS shadow copies contexts, see 
 *     <a href="https://docs.microsoft.com/windows/desktop/VSS/implementation-details-for-creating-shadow-copies">Implementation Details for 
 *     Creating Shadow Copies</a>.
 * 
 * Shadow copy behavior can be further controlled by using a bitwise OR to combine a supported 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> with valid 
 *     <b>_VSS_SNAPSHOT_CONTEXT</b> values as an argument to the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-setcontext">IVssBackupComponents::SetContext</a> 
 *     method.
 * 
 * Currently, the only supported modifications are the bitwise OR of a 
 *      <b>_VSS_SNAPSHOT_CONTEXT</b> value with the
 *      <b>VSS_VOLSNAP_ATTR_TRANSPORTABLE</b> and either the 
 *      <b>VSS_VOLSNAP_ATTR_DIFFERENTIAL</b> or the <b>VSS_VOLSNAP_ATTR_PLEX</b> 
 *      value of the 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/vss/ne-vss-vss_volume_snapshot_attributes">_VSS_VOLUME_SNAPSHOT_ATTRIBUTES</a> 
 *      enumeration.
 * 
 * However, these values cannot be used to modify <b>VSS_CTX_CLIENT_ACCESSIBLE</b> 
 *      context.
 * 
 * The use of <b>VSS_VOLSNAP_ATTR_TRANSPORTABLE</b> is limited to systems running 
 *     Windows Server 2008 Enterprise, Windows Server 2008 Datacenter, Windows Server 2003, Enterprise Edition, or Windows Server 2003, Datacenter Edition.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vss/ne-vss-vss_snapshot_context
 * @namespace Windows.Win32.Storage.Vss
 * @version v4.0.30319
 */
class VSS_SNAPSHOT_CONTEXT{

    /**
     * The standard backup context. Specifies an auto-release, nonpersistent shadow copy in which writers are 
     *       involved in the creation.
     * @type {Integer (Int32)}
     */
    static VSS_CTX_BACKUP => 0

    /**
     * Specifies an auto-release, nonpersistent shadow copy created without writer involvement.
     * @type {Integer (Int32)}
     */
    static VSS_CTX_FILE_SHARE_BACKUP => 16

    /**
     * Specifies a persistent, non-auto-release shadow copy without writer involvement. This context should be 
     *       used when there is no need for writer involvement to ensure that files are in a consistent state at the time 
     *       of the shadow copy. 
     *       
     * 
     * Lightweight automated file rollback mechanisms or persistent shadow copies of file shares or data volumes 
     *        that are not expected to contain any system-related files or databases might run under this context. For 
     *        example, a requester could use this context for creating a shadow copy of a NAS volume hosting documents and 
     *        simple user shares. Those types of data do not need writer involvement to create a consistent shadow copy.
     * @type {Integer (Int32)}
     */
    static VSS_CTX_NAS_ROLLBACK => 25

    /**
     * Specifies a persistent, non-auto-release shadow copy with writer involvement. This context is designed 
     *       to be used when writers are needed to ensure that files are in a well-defined state prior to shadow copy.
     *       
     * 
     * Automated file rollback mechanisms of system volumes and shadow copies to be used in data mining or restore 
     *        operations might run under this context. This context is similar to <b>VSS_CTX_BACKUP</b> 
     *        but allows a requester more control over the persistence of the shadow copy.
     * @type {Integer (Int32)}
     */
    static VSS_CTX_APP_ROLLBACK => 9

    /**
     * Specifies a read-only, <a href="https://docs.microsoft.com/windows/win32/vss/vssgloss-c">client-accessible shadow copy</a> that supports Shadow Copies for Shared Folders and is created without writer involvement. Only the system provider (the default provider available on the system) can create this type of shadow copy.
     * 
     * Most requesters will want to use the <b>VSS_CTX_NAS_ROLLBACK</b> context for persistent, non-auto-release shadow copies without writer involvement.
     * @type {Integer (Int32)}
     */
    static VSS_CTX_CLIENT_ACCESSIBLE => 29

    /**
     * Specifies a read-only, <a href="https://docs.microsoft.com/windows/win32/vss/vssgloss-c">client-accessible shadow copy</a> that is created with writer involvement. Only the system provider (the default provider available on the system) can create this type of shadow copy.
     * 
     * Most requesters will want to use the <b>VSS_CTX_APP_ROLLBACK</b> context for persistent, non-auto-release shadow copies with writer involvement.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>This context is not supported by Windows Server 2003 and Windows XP.
     * @type {Integer (Int32)}
     */
    static VSS_CTX_CLIENT_ACCESSIBLE_WRITERS => 13

    /**
     * All types of currently live shadow copies are available for administrative operations, such as shadow copy 
     *       queries (see <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-query">IVssBackupComponents::Query</a>). 
     *       <b>VSS_CTX_ALL</b> is a valid context for all VSS interfaces except 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-startsnapshotset">IVssBackupComponents::StartSnapshotSet</a> 
     *       and 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-dosnapshotset">IVssBackupComponents::DoSnapshotSet</a>.
     * @type {Integer (Int32)}
     */
    static VSS_CTX_ALL => -1
}
