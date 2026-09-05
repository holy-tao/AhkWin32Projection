#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates abilities and the conflict resolution activity to follow. Used with ISyncMgrResolutionHandler::QueryAbilities.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_resolution_abilities
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGR_RESOLUTION_ABILITIES extends Win32Enum {

    /**
     * The resolution handler supports merging items and will produce a merged file to keep.
     * Native name: SYNCMGR_RA_KEEPOTHER
     * @type {Integer (Int32)}
     */
    static RA_KEEPOTHER => 1

    /**
     * Enables methods <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keeprecent">ISyncMgrResolutionHandler::KeepRecent</a> and <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keepother">ISyncMgrResolutionHandler::KeepOther</a> to be called.
     * Native name: SYNCMGR_RA_KEEPRECENT
     * @type {Integer (Int32)}
     */
    static RA_KEEPRECENT => 2

    /**
     * Enables method <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-removefromsyncset">ISyncMgrResolutionHandler::RemoveFromSyncSet</a> to be called.
     * Native name: SYNCMGR_RA_REMOVEFROMSYNCSET
     * @type {Integer (Int32)}
     */
    static RA_REMOVEFROMSYNCSET => 4

    /**
     * Not used.
     * Native name: SYNCMGR_RA_KEEP_SINGLE
     * @type {Integer (Int32)}
     */
    static RA_KEEP_SINGLE => 8

    /**
     * Enables method <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrresolutionhandler-keepitems">ISyncMgrResolutionHandler::KeepItems</a> to be called with more than one item in <i>pArray</i>.
     * Native name: SYNCMGR_RA_KEEP_MULTIPLE
     * @type {Integer (Int32)}
     */
    static RA_KEEP_MULTIPLE => 16

    /**
     * A mask for valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_resolution_abilities">SYNCMGR_RESOLUTION_ABILITIES</a> values.
     * Native name: SYNCMGR_RA_VALID
     * @type {Integer (Int32)}
     */
    static RA_VALID => 31
}
