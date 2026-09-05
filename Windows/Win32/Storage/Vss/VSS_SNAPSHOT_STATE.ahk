#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specify the state of a given shadow copy operation.
 * @remarks
 * The shadow copy state is contained in the <b>m_eStatus</b> member of a 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> object, which can be obtained for a 
 *     single shadow copy by calling 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getsnapshotproperties">IVssBackupComponents::GetSnapshotProperties</a>.
 * 
 * Because 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getsnapshotproperties">IVssBackupComponents::GetSnapshotProperties</a> 
 *     fails during shadow copy creation with <b>VSS_E_OBJECT_NOT_FOUND</b>, a requester cannot obtain 
 *     any <b>VSS_SNAPSHOT_STATE</b> value other than 
 *     <b>VSS_SS_CREATED</b>.
 * 
 * Calls to <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-query">IVssBackupComponents::Query</a> can 
 *     also be used to obtain the shadow copy state. 
 *     <b>IVssBackupComponents::Query</b> is used to return 
 *     lists of shadow copies, which may be iterated over by means of the 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/nn-vss-ivssenumobject">IVssEnumObject</a> interface to obtain 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vss/ns-vss-vss_snapshot_prop">VSS_SNAPSHOT_PROP</a> objects for each shadow copy that 
 *     have completed on a given system. This means that, like 
 *     <a href="https://docs.microsoft.com/windows/desktop/api/vsbackup/nf-vsbackup-ivssbackupcomponents-getsnapshotproperties">IVssBackupComponents::GetSnapshotProperties</a>, 
 *     the <b>IVssBackupComponents::Query</b> method can 
 *     return only a shadow copy state of <b>VSS_SS_CREATED</b>.
 * @see https://learn.microsoft.com/windows/win32/api/vss/ne-vss-vss_snapshot_state
 * @namespace Windows.Win32.Storage.Vss
 */
class VSS_SNAPSHOT_STATE extends Win32Enum {

    /**
     * Reserved for system use. 
     *       
     * 
     * Unknown shadow copy state.
     * Native name: VSS_SS_UNKNOWN
     * @type {Integer (Int32)}
     */
    static SS_UNKNOWN => 0

    /**
     * Reserved for system use. 
     *       
     * 
     * Shadow copy is being prepared.
     * Native name: VSS_SS_PREPARING
     * @type {Integer (Int32)}
     */
    static SS_PREPARING => 1

    /**
     * Reserved for system use. 
     *       
     * 
     * Processing of the shadow copy preparation is in progress.
     * Native name: VSS_SS_PROCESSING_PREPARE
     * @type {Integer (Int32)}
     */
    static SS_PROCESSING_PREPARE => 2

    /**
     * Reserved for system use. 
     *       
     * 
     * Shadow copy has been prepared.
     * Native name: VSS_SS_PREPARED
     * @type {Integer (Int32)}
     */
    static SS_PREPARED => 3

    /**
     * Reserved for system use. 
     *       
     * 
     * Processing of the shadow copy precommit is in process.
     * Native name: VSS_SS_PROCESSING_PRECOMMIT
     * @type {Integer (Int32)}
     */
    static SS_PROCESSING_PRECOMMIT => 4

    /**
     * Reserved for system use. 
     *       
     * 
     * Shadow copy is precommitted.
     * Native name: VSS_SS_PRECOMMITTED
     * @type {Integer (Int32)}
     */
    static SS_PRECOMMITTED => 5

    /**
     * Reserved for system use. 
     *       
     * 
     * Processing of the shadow copy commit is in process.
     * Native name: VSS_SS_PROCESSING_COMMIT
     * @type {Integer (Int32)}
     */
    static SS_PROCESSING_COMMIT => 6

    /**
     * Reserved for system use. 
     *       
     * 
     * Shadow copy is committed.
     * Native name: VSS_SS_COMMITTED
     * @type {Integer (Int32)}
     */
    static SS_COMMITTED => 7

    /**
     * Reserved for system use. 
     *       
     * 
     * Processing of the shadow copy postcommit is in process.
     * Native name: VSS_SS_PROCESSING_POSTCOMMIT
     * @type {Integer (Int32)}
     */
    static SS_PROCESSING_POSTCOMMIT => 8

    /**
     * Reserved for system use.
     *       
     * 
     * Processing of the shadow copy file commit operation is underway.
     * Native name: VSS_SS_PROCESSING_PREFINALCOMMIT
     * @type {Integer (Int32)}
     */
    static SS_PROCESSING_PREFINALCOMMIT => 9

    /**
     * Reserved for system use. 
     *       
     * 
     * Processing of the shadow copy file commit operation is done.
     * Native name: VSS_SS_PREFINALCOMMITTED
     * @type {Integer (Int32)}
     */
    static SS_PREFINALCOMMITTED => 10

    /**
     * Reserved for system use.
     *       
     * 
     * Processing of the shadow copy following the final commit and prior to shadow copy create is underway.
     * Native name: VSS_SS_PROCESSING_POSTFINALCOMMIT
     * @type {Integer (Int32)}
     */
    static SS_PROCESSING_POSTFINALCOMMIT => 11

    /**
     * Shadow copy is created.
     * Native name: VSS_SS_CREATED
     * @type {Integer (Int32)}
     */
    static SS_CREATED => 12

    /**
     * Reserved for system use. 
     *       
     * 
     * Shadow copy creation is aborted.
     * Native name: VSS_SS_ABORTED
     * @type {Integer (Int32)}
     */
    static SS_ABORTED => 13

    /**
     * Reserved for system use. 
     *       
     * 
     * Shadow copy has been deleted.
     * Native name: VSS_SS_DELETED
     * @type {Integer (Int32)}
     */
    static SS_DELETED => 14

    /**
     * Native name: VSS_SS_POSTCOMMITTED
     * @type {Integer (Int32)}
     */
    static SS_POSTCOMMITTED => 15

    /**
     * Reserved value.
     * Native name: VSS_SS_COUNT
     * @type {Integer (Int32)}
     */
    static SS_COUNT => 16
}
