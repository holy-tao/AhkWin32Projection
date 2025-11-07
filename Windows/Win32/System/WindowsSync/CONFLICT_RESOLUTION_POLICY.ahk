#Requires AutoHotkey v2.0.0 64-bit

/**
 * Represents the options for the concurrency conflict resolution policy to use for the synchronization session.
 * @remarks
 * 
 * The members of <b>CONFLICT_RESOLUTION_POLICY</b> are used by a synchronization application to specify the policy that the change applier uses to resolve concurrency conflicts that occur during synchronization. Concurrency conflicts occur when the same item or change unit is changed on two different replicas that are later synchronized.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//winsync/ne-winsync-conflict_resolution_policy
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class CONFLICT_RESOLUTION_POLICY{

    /**
     * The change applier notifies the synchronization application of each conflict as it occurs, by using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-isynccallback-onconflict">ISyncCallback::OnConflict</a> method. The application examines the conflicting items and specifies the conflict resolution action by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ichangeconflict-setresolveactionforchange">IChangeConflict::SetResolveActionForChange</a> or <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winsync/nf-winsync-ichangeconflict-setresolveactionforchangeunit">IChangeConflict::SetResolveActionForChangeUnit</a>.
     * @type {Integer (Int32)}
     */
    static CRP_NONE => 0

    /**
     * The change made on the destination replica always wins. This supports the case in which the destination replica does not consume changes that are made by remote clients.
     * @type {Integer (Int32)}
     */
    static CRP_DESTINATION_PROVIDER_WINS => 1

    /**
     * The change made on the source replica always wins. This supports a read-only synchronization solution in which the destination replica is not to be trusted.
     * @type {Integer (Int32)}
     */
    static CRP_SOURCE_PROVIDER_WINS => 2

    /**
     * A placeholder for the last element in the enumeration. Do not use this value.
     * @type {Integer (Int32)}
     */
    static CRP_LAST => 3
}
