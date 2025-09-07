#Requires AutoHotkey v2.0.0 64-bit

/**
 * Describes conflict item type.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_conflict_item_type
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_CONFLICT_ITEM_TYPE{

    /**
     * The conflict item was updated.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CIT_UPDATED => 1

    /**
     * The conflict item was deleted.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CIT_DELETED => 2
}
