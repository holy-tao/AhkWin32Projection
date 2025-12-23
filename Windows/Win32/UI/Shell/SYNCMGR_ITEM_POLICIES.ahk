#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies an item's policies to control how they can be enabled or disabled by group policy.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_item_policies
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_ITEM_POLICIES extends Win32Enum{

    /**
     * No policy flags are set.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_NONE => 0

    /**
     * Enabling of the item is not supported at the time of the call. This value can be used by an item to implement support for group policy that prevents the item from being enabled. If this value is set, the <b>Enable</b> task is not shown in the handler's folder when this item is selected. The item should provide a comment—returned from its implementation of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynciteminfo-getcomment">ISyncMgrSyncItemInfo::GetComment</a>—to let the user know why the <b>Enable</b> task is not available. Most items should not set this value.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_PREVENT_ENABLE => 1

    /**
     * Disabling of the item is not supported at the time of the call. This value can be used by an item to implement support for group policy that prevents the item from being disabled. If this value is set, the <b>Disable</b> task is not shown in the handler's folder when this item is selected. The item should provide a comment—returned from its implementation of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsynciteminfo-getcomment">ISyncMgrSyncItemInfo::GetComment</a>—to let the user know why the <b>Disable</b> task is not available. Most items should not set this value.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_PREVENT_DISABLE => 2

    /**
     * Starting a sync through the user interface or through the APIs is not supported.  Sync can be started only by an external application that creates a session creator to report progress. If this value is set, then the Start Sync task will not be shown in the handler's folder when the sync item is selected. Note that Start Sync must be supported on a handler in order for it to be supported on a sync item. Most sync items should not set this value.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_PREVENT_START_SYNC => 4

    /**
     * Stopping a sync through the user interface or through the APIs is not supported. If this value is set, the Stop Sync task is not shown in the handler's folder when the sync item is selected. Note that Stop Sync must be supported on a handler in order for it to be supported on a sync item. Most sync items should not set this value.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_PREVENT_STOP_SYNC => 8

    /**
     * The enable task should be disabled when it is shown for this sync item. With this policy set, the <b>Enable</b> option appears in the context menu, if SYNCMGR_IPM_PREVENT_ENABLE is not set, but is disabled.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_DISABLE_ENABLE => 16

    /**
     * The disable task should be disabled when it is shown for this sync item. With this policy set, the <b>Disable</b> option appears in the context menu, if SYNCMGR_IPM_PREVENT_DISABLE is not set, but is disabled.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_DISABLE_DISABLE => 32

    /**
     * The Start Sync task should be disabled when it is shown for this sync item. With this policy set, the <b>Start Sync</b> option appears in the context menu, if SYNCMGR_IPM_PREVENT_START_SYNC is not set and if SYNCMGR_HPM_PREVENT_START_SYNC is not set on the handle, but is disabled.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_DISABLE_START_SYNC => 64

    /**
     * The <b>Stop Sync</b> task should be disabled when it is shown for this sync item. With this policy set, the <b>Stop Sync</b> option appears in the context menu, if SYNCMGR_IPM_PREVENT_STOP_SYNC is not set and if SYNCMGR_HPM_PREVENT_STOP_SYNC is not set on the handler, but is disabled.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_DISABLE_STOP_SYNC => 128

    /**
     * The <b>Browse</b> task should be disabled when it is shown for this sync item. The <b>Browse</b> task is shown only if the SYNCMGR_ICM_CAN_BROWSE_CONTENT value is returned from the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities">ISyncMgrSyncItem::GetCapabilities</a> method.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_DISABLE_BROWSE => 256

    /**
     * The handler normally supports deleting items, but that this item cannot be deleted at the time of the call. With this policy set, the <b>Delete</b> option appears as disabled in the context menu for the sync item.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_DISABLE_DELETE => 512

    /**
     * The item should be hidden from the user unless the <b>Show Hidden Files</b> option has been enabled. This policy only applies the first time the item is loaded. After that, the hidden state is maintained by Sync Center and can be changed by the user through the property sheet.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_HIDDEN_BY_DEFAULT => 65536

    /**
     * A mask used to retrieve valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_policies">SYNCMGR_ITEM_POLICIES</a> flags.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_IPM_VALID_MASK => 66303
}
