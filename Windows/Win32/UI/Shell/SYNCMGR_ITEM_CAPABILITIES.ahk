#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the actions that can be performed against an item.
 * @remarks
 * Sync Center queries the item for its capabilities through <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getcapabilities">ISyncMgrSyncItem::GetCapabilities</a> whenever the <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrcontrol-updateitem">ISyncMgrControl::UpdateItem</a> method is called.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_item_capabilities
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_ITEM_CAPABILITIES{

    /**
     * No capability flags are set.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_NONE => 0

    /**
     * The item returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">ISyncMgrSyncItem::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_Icon flag.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_PROVIDES_ICON => 1

    /**
     * The item returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">ISyncMgrSyncItem::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_EventStore flag.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_EVENT_STORE => 2

    /**
     * The item returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">ISyncMgrSyncItem::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_ConflictStore flag.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_CONFLICT_STORE => 4

    /**
     * The user is allowed to delete the item from the handler's folder. This can be used by an item to remove itself from the handler's sync set (for instance, remove a folder from the set of Offline Files). If this value is set, the <b>Delete</b> task is shown in the handler's folder when this item is selected.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_CAN_DELETE => 16

    /**
     * The item returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">ISyncMgrSyncItem::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_BrowseContent flag. If this value is set, the <b>Browse Content</b> task is added to the item's shortcut menu.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_CAN_BROWSE_CONTENT => 65536

    /**
     * The item returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">ISyncMgrSyncItem::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_QueryBeforeEnable flag.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_QUERY_BEFORE_ENABLE => 1048576

    /**
     * The item returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">ISyncMgrSyncItem::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_QueryBeforeDisable flag.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_QUERY_BEFORE_DISABLE => 2097152

    /**
     * The item returns a valid object from <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrsyncitem-getobject">ISyncMgrSyncItem::GetObject</a> when that method is called with the SYNCMGR_OBJECTID_QueryBeforeDelete flag.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_QUERY_BEFORE_DELETE => 4194304

    /**
     * A mask used to retrieve valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_item_capabilities">SYNCMGR_ITEM_CAPABILITIES</a> flags.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_ICM_VALID_MASK => 7405591
}
