#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MMC_NOTIFY_TYPE enumeration defines the notifications of user actions that can be sent to a snap-in by the console's Node Manager when it calls IComponentData::Notify, IComponent::Notify, or IExtendControlbar::ControlbarNotify.
 * @see https://docs.microsoft.com/windows/win32/api//mmc/ne-mmc-mmc_notify_type
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class MMC_NOTIFY_TYPE{

    /**
     * A window for which the snap-in owns the result view is being activated or deactivated.
     * @type {Integer (Int32)}
     */
    static MMCN_ACTIVATE => 32769

    /**
     * The snap-in is being notified to add images for the result pane.
     * @type {Integer (Int32)}
     */
    static MMCN_ADD_IMAGES => 32770

    /**
     * The user clicked a toolbar button.
     * @type {Integer (Int32)}
     */
    static MMCN_BTN_CLICK => 32771

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static MMCN_CLICK => 32772

    /**
     * The user clicked a list view column header.
     * @type {Integer (Int32)}
     */
    static MMCN_COLUMN_CLICK => 32773

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static MMCN_CONTEXTMENU => 32774

    /**
     * Items owned by the snap-in have been cut or moved.
     * @type {Integer (Int32)}
     */
    static MMCN_CUTORMOVE => 32775

    /**
     * The user double-clicked a mouse button on a list view item or on a scope item in the result pane.
     * @type {Integer (Int32)}
     */
    static MMCN_DBLCLICK => 32776

    /**
     * Sent to 
 *      inform the snap-in that an object should be deleted.
     * @type {Integer (Int32)}
     */
    static MMCN_DELETE => 32777

    /**
     * Sent to the virtual list view when all items of an owner-data result pane are deselected.
     * @type {Integer (Int32)}
     */
    static MMCN_DESELECT_ALL => 32778

    /**
     * Sent when a scope item must be expanded or collapsed.
     * @type {Integer (Int32)}
     */
    static MMCN_EXPAND => 32779

    /**
     * Not used.
     * @type {Integer (Int32)}
     */
    static MMCN_HELP => 32780

    /**
     * Sent when the user clicks a snap-in defined menu button.
     * @type {Integer (Int32)}
     */
    static MMCN_MENU_BTNCLICK => 32781

    /**
     * Sent when a window is being minimized or maximized.
     * @type {Integer (Int32)}
     */
    static MMCN_MINIMIZED => 32782

    /**
     * Notifies the snap-in's scope item to paste selected result items.
     * @type {Integer (Int32)}
     */
    static MMCN_PASTE => 32783

    /**
     * Informs the snap-in of property changes.
     * @type {Integer (Int32)}
     */
    static MMCN_PROPERTY_CHANGE => 32784

    /**
     * Sent to determine whether the snap-in can paste  items from a given data object.
     * @type {Integer (Int32)}
     */
    static MMCN_QUERY_PASTE => 32785

    /**
     * Sent when the refresh verb is selected.
     * @type {Integer (Int32)}
     */
    static MMCN_REFRESH => 32786

    /**
     * Notifies the snap-in when to delete all the child items (the entire subtree) below a specified item.
     * @type {Integer (Int32)}
     */
    static MMCN_REMOVE_CHILDREN => 32787

    /**
     * A scope or result item must be renamed.
     * @type {Integer (Int32)}
     */
    static MMCN_RENAME => 32788

    /**
     * An item has been selected in either the scope pane or result pane.
     * @type {Integer (Int32)}
     */
    static MMCN_SELECT => 32789

    /**
     * Sent when a scope item is selected or deselected.
     * @type {Integer (Int32)}
     */
    static MMCN_SHOW => 32790

    /**
     * Sent to inform  the snap-in that the view should be updated.
     * @type {Integer (Int32)}
     */
    static MMCN_VIEW_CHANGE => 32791

    /**
     * The user requested help about the snap-in.
     * @type {Integer (Int32)}
     */
    static MMCN_SNAPINHELP => 32792

    /**
     * The user requested help about a selected item.
     * @type {Integer (Int32)}
     */
    static MMCN_CONTEXTHELP => 32793

    /**
     * Sent when a custom OCX is initialized for the first time.
     * @type {Integer (Int32)}
     */
    static MMCN_INITOCX => 32794

    /**
     * Sent when the filter value for a filtered result view column has been changed.
     * @type {Integer (Int32)}
     */
    static MMCN_FILTER_CHANGE => 32795

    /**
     * The user clicked the filter button on the header control of a filtered view.
     * @type {Integer (Int32)}
     */
    static MMCN_FILTERBTN_CLICK => 32796

    /**
     * Sent when the result pane for a scope item must be restored.
     * @type {Integer (Int32)}
     */
    static MMCN_RESTORE_VIEW => 32797

    /**
     * Sent when the user clicks the <b>Print</b> button or selects the <b>Print</b> menu item.
     * @type {Integer (Int32)}
     */
    static MMCN_PRINT => 32798

    /**
     * Sent if the snap-in supports the CCF_SNAPIN_PRELOADS format.
     * @type {Integer (Int32)}
     */
    static MMCN_PRELOAD => 32799

    /**
     * Sent when the list control for the list view taskpad is being attached or detached.
     * @type {Integer (Int32)}
     */
    static MMCN_LISTPAD => 32800

    /**
     * Sent when MMC requires a scope item to be expanded synchronously.
     * @type {Integer (Int32)}
     */
    static MMCN_EXPANDSYNC => 32801

    /**
     * Sent when the user hides columns or makes columns visible in the list view.
     * @type {Integer (Int32)}
     */
    static MMCN_COLUMNS_CHANGED => 32802

    /**
     * Sent by MMC to determine whether the snap-in supports paste operations from another MMC process.
     * @type {Integer (Int32)}
     */
    static MMCN_CANPASTE_OUTOFPROC => 32803
}
