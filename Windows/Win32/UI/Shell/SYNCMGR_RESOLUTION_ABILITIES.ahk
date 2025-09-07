#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates abilities and the conflict resolution activity to follow. Used with ISyncMgrResolutionHandler::QueryAbilities.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_resolution_abilities
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_RESOLUTION_ABILITIES{

    /**
     * The resolution handler supports merging items and will produce a merged file to keep.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RA_KEEPOTHER => 1

    /**
     * Enables methods <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keeprecent">ISyncMgrResolutionHandler::KeepRecent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keepother">ISyncMgrResolutionHandler::KeepOther</a> to be called.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RA_KEEPRECENT => 2

    /**
     * Enables method <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-removefromsyncset">ISyncMgrResolutionHandler::RemoveFromSyncSet</a> to be called.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RA_REMOVEFROMSYNCSET => 4

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RA_KEEP_SINGLE => 8

    /**
     * Enables method <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keepitems">ISyncMgrResolutionHandler::KeepItems</a> to be called with more than one item in <i>pArray</i>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RA_KEEP_MULTIPLE => 16

    /**
     * A mask for valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_abilities">SYNCMGR_RESOLUTION_ABILITIES</a> values.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RA_VALID => 31
}
