#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the reason why an item is offline.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_offline_reason
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_OFFLINE_REASON{

    /**
     * The reason is unknown because the method failed.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OFFLINE_REASON_UNKNOWN => 0

    /**
     * The item is online.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OFFLINE_REASON_NOT_APPLICABLE => 1

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> returns this value if the item is offline because the item's scope was forced offline using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitionoffline">IOfflineFilesConnectionInfo::TransitionOffline</a> method.  When an item has been transitioned offline by the Work Offline button in Windows Explorer, the offline reason is forced.  When an item is forced offline, its entire scope is also forced offline.  Assuming the remote share is reachable, a scope that is forced offline may be transitioned online using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitiononline">IOfflineFilesConnectionInfo::TransitionOnline</a> method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OFFLINE_REASON_CONNECTION_FORCED => 2

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> returns this value if the item is offline because the item's connection is considered slow.  The parameters that define a slow connection are defined by Group Policy.  When an item is offline because of a slow connection, its entire scope is also offline for the same reason.  Assuming the remote share is reachable, a scope that is offline because of a slow connection may be transitioned online using the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-transitiononline">IOfflineFilesConnectionInfo::TransitionOnline</a> method.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OFFLINE_REASON_CONNECTION_SLOW => 3

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> returns this value if the item is offline because of an error in network communications.  This normally means that the client computer is disconnected from the network, the server computer is unavailable, or the network shared folder is no longer available.  After the source of the error is corrected and the remote share is again reachable, the scope is automatically transitioned online by Offline Files.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OFFLINE_REASON_CONNECTION_ERROR => 4

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> returns this value if the item is offline because of an unresolved sync conflict.  While working offline, an item was changed both on the client and the server.  A subsequent sync operation detected the sync conflict and placed a record of that conflict in the sync conflict store.  Sync conflicts may be reviewed in Sync Center's Sync Conflicts folder.  To resolve a conflict programmatically, call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilescache-synchronize">IOfflineFilesCache::Synchronize</a> with the appropriate conflict resolution mechanism.  For more information, see <b>IOfflineFilesCache::Synchronize</b>.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OFFLINE_REASON_ITEM_VERSION_CONFLICT => 5

    /**
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscobj/nf-cscobj-iofflinefilesconnectioninfo-getconnectstate">IOfflineFilesConnectionInfo::GetConnectState</a> returns this value if the item is offline because it was suspended.  Suspending an item is a way to force it to be always available offline.  It is primarily used by Windows features that want to use the offline availability and synchronization capabilities of Offline Files but that also want to control the synchronization.  Suspended items are never synchronized automatically by Offline Files.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OFFLINE_REASON_ITEM_SUSPENDED => 6
}
