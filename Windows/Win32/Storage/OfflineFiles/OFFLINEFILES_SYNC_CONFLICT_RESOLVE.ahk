#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifies the conflict resolution code returned by the IOfflineFilesSyncConflictHandler::ResolveConflict method.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_sync_conflict_resolve
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_SYNC_CONFLICT_RESOLVE extends Win32Enum{

    /**
     * No resolution.  The conflict is unresolved.  This allows the conflict to be processed by other handlers in the system.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_RESOLVE_NONE => 0

    /**
     * Keep the local state.  This overwrites the remote copy with the local copy's contents.  If the local copy was deleted, this deletes the remote copy on the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLOCAL => 1

    /**
     * Keep the remote state.  This overwrites the local copy with the remote copy's contents.  If the remote copy was deleted, this deletes the local copy in the Offline Files cache.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPREMOTE => 2

    /**
     * Keeps both copies.  Note that this resolution is valid only for sync conflict states where both the server and client copies exist and where at least one of the items is a file.  The <b>OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPALLCHANGES</b> resolution is not available when one of the items has been deleted or both items are directories.
     * 
     * The list of applicable <a href="https://docs.microsoft.com/windows/desktop/api/cscobj/ne-cscobj-offlinefiles_sync_state">OFFLINEFILES_SYNC_STATE</a> values is as follows:
     * 
     * <b>OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileChangedOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_DirChangedOnClient_FileOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileChangedOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_DirCreatedOnClient_FileOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_DirOnClient_FileChangedOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_DirOnClient_FileOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_FileChangedOnClient_ChangedOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirChangedOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_FileChangedOnClient_DirOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirChangedOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_DirOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileChangedOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_FileCreatedOnClient_FileOnServer</b>
     * <b>OFFLINEFILES_SYNC_STATE_FileOnClient_DirOnServer</b>
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPALLCHANGES => 3

    /**
     * Retains the state of the latest operation as determined by last-change times of the items in conflict.  If the local item was deleted, the time of deletion is used for comparison.
     * 
     * The case where the remote copy was deleted after the client copy was changed is a special case that produces an unexpected result.  The logical expectation is that the later operation (the remote deletion) propagates to the client and deletes the client copy from the cache.  However, the result is that the client copy is restored to the server, reversing the deletion.  This is because Offline Files is a client feature and therefore is unable to know when a remote copy of a cached item was deleted.  If the local copy is modified offline, the last-change time of that local copy will be later than the last-change time for the remote copy recorded when the item was last in sync.  Therefore, an <b>OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLATEST</b> resolution finds the last-change time on the client copy to be later than the last-change time last known for the server copy.  This causes the local copy to be restored to the server.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_RESOLVE_KEEPLATEST => 4

    /**
     * Write an entry to the sync conflict log and perform no further attempts at resolving the conflict.  The interactive user will resolve the conflict through Sync Center at a later time.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_RESOLVE_LOG => 5

    /**
     * Do not resolve the conflict.  Do not record an entry in the sync conflict log.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_RESOLVE_SKIP => 6

    /**
     * Cancel the synchronization operation.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_ABORT => 7

    /**
     * 
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_SYNC_CONFLICT_RESOLVE_NUMCODES => 8
}
