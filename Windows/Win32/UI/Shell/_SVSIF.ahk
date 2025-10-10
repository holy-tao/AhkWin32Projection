#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates flags used by IFolderView, IFolderView2, IShellView and IShellView2 to specify a type of selection to apply.
 * @remarks
 * 
  * An additional value SVSI_NOSTATECHANGE is also defined outside of the enumeration. This value indicates that an operation to edit or position an item should not affect the item's focus or selected state. Its numeric value is (UINT)0x80000000.
  * 
  * The <b>SVSIF</b> type used to refer to members of the <b>_SVSIF</b> enumeration is defined in Shobjidl.h as shown here.
  * 
  *                 
  * 
  * 
  * ```
  * typedef UINT SVSIF;
  * ```
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-_svsif
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _SVSIF{

    /**
     * 0x00000000. Deselect the item.
     * @type {Integer (Int32)}
     */
    static SVSI_DESELECT => 0

    /**
     * 0x00000001. Select the item.
     * @type {Integer (Int32)}
     */
    static SVSI_SELECT => 1

    /**
     * 0x00000003. Put the name of the item into rename mode. This value includes SVSI_SELECT.
     * @type {Integer (Int32)}
     */
    static SVSI_EDIT => 3

    /**
     * 0x00000004. Deselect all but the selected item. If the item parameter is <b>NULL</b>, deselect all items.
     * @type {Integer (Int32)}
     */
    static SVSI_DESELECTOTHERS => 4

    /**
     * 0x00000008. In the case of a folder that cannot display all of its contents on one screen, display the portion that contains the selected item.
     * @type {Integer (Int32)}
     */
    static SVSI_ENSUREVISIBLE => 8

    /**
     * 0x00000010. Give the selected item the focus when multiple items are selected, placing the item first in any list of the collection returned by a method.
     * @type {Integer (Int32)}
     */
    static SVSI_FOCUSED => 16

    /**
     * 0x00000020. Convert the input point from screen coordinates to the list-view client coordinates.
     * @type {Integer (Int32)}
     */
    static SVSI_TRANSLATEPT => 32

    /**
     * 0x00000040. Mark the item so that it can be queried using <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderview-getselectionmarkeditem">IFolderView::GetSelectionMarkedItem</a>.
     * @type {Integer (Int32)}
     */
    static SVSI_SELECTIONMARK => 64

    /**
     * 0x00000080. Allows the window's default view to position the item. In most cases, this will place the item in the first available position. However, if the call comes during the processing of a mouse-positioned context menu, the position of the context menu is used to position the item.
     * @type {Integer (Int32)}
     */
    static SVSI_POSITIONITEM => 128

    /**
     * 0x00000100. The item should be checked. This flag is used with items in views where the checked mode is supported.
     * @type {Integer (Int32)}
     */
    static SVSI_CHECK => 256

    /**
     * 0x00000200. The second check state when the view is in tri-check mode, in which there are three values for the checked state. You can indicate tri-check mode by specifying FWF_TRICHECKSELECT in <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ifolderview2-setcurrentfolderflags">IFolderView2::SetCurrentFolderFlags</a>. The 3 states for FWF_TRICHECKSELECT are unchecked, SVSI_CHECK and SVSI_CHECK2.
     * @type {Integer (Int32)}
     */
    static SVSI_CHECK2 => 512

    /**
     * 0x00000401. Selects the item and marks it as selected by the keyboard. This value includes SVSI_SELECT.
     * @type {Integer (Int32)}
     */
    static SVSI_KEYBOARDSELECT => 1025

    /**
     * 0x40000000. An operation to select or focus an item should not also set focus on the view itself.
     * @type {Integer (Int32)}
     */
    static SVSI_NOTAKEFOCUS => 1073741824
}
