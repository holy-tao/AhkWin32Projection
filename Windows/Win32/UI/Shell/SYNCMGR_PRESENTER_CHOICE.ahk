#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes what choice a user makes about a sync manager conflict resolution. Used by ISyncMgrConflictPresenter.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ne-syncmgr-syncmgr_presenter_choice
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_PRESENTER_CHOICE extends Win32Enum{

    /**
     * The user is skipping this conflict, or conflict resolution is being canceled.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PC_NO_CHOICE => 0

    /**
     * The user chooses to keep only one item.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PC_KEEP_ONE => 1

    /**
     * The user chooses to keep multiple items.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PC_KEEP_MULTIPLE => 2

    /**
     * The user chooses to keep the most recent item.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PC_KEEP_RECENT => 3

    /**
     * The item is to be removed from the sync set.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PC_REMOVE_FROM_SYNC_SET => 4

    /**
     * The item is not being resolved now but is instead being skipped so that it can be resolved later.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PC_SKIP => 5
}
