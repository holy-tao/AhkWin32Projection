#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents statistics about a single, unidirectional synchronization session.
 * @see https://learn.microsoft.com/windows/win32/api/winsync/ns-winsync-sync_session_statistics
 * @namespace Windows.Win32.System.WindowsSync
 */
export default struct SYNC_SESSION_STATISTICS {
    #StructPack 4

    /**
     * The total number of changes that were successfully applied during the synchronization session. This value is the sum of item changes plus change unit changes.
     */
    dwChangesApplied : UInt32

    /**
     * The total number of changes that were not applied during a session. This value is the sum of item changes plus change unit changes.
     */
    dwChangesFailed : UInt32

}
