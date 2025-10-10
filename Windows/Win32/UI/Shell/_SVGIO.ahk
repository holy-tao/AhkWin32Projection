#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used with the IFolderView::Items, IFolderView::ItemCount, and IShellView::GetItemObject methods to restrict or control the items in their collections.
 * @remarks
 * 
  * The <b>SVGIO</b> type used to refer to members of the <b>_SVGIO</b> enumeration is defined in Shobjidl.h as shown here.
  * 
  * 
  * ```
  * typedef int SVGIO;
  * ```
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-_svgio
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _SVGIO{

    /**
     * 0x00000000. Refers to the background of the view. It is used with IID_IContextMenu to get a shortcut menu for the view background and with IID_IDispatch to get a dispatch interface that represents the <a href="https://docs.microsoft.com/windows/desktop/shell/shellfolderview">ShellFolderView</a> object for the view.
     * @type {Integer (Int32)}
     */
    static SVGIO_BACKGROUND => 0

    /**
     * 0x00000001. Refers to the currently selected items. Used with IID_IDataObject to retrieve a data object that represents the selected items.
     * @type {Integer (Int32)}
     */
    static SVGIO_SELECTION => 1

    /**
     * 0x00000002. Used in the same way as <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svgio">SVGIO_SELECTION</a> but refers to all items in the view.
     * @type {Integer (Int32)}
     */
    static SVGIO_ALLVIEW => 2

    /**
     * 0x00000003. Used in the same way as <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svgio">SVGIO_SELECTION</a> but refers to checked items in views where checked mode is supported. For more details on checked mode, see <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-folderflags">FOLDERFLAGS</a>.
     * @type {Integer (Int32)}
     */
    static SVGIO_CHECKED => 3

    /**
     * 0x0000000F. Masks all bits but those corresponding to the <a href="https://docs.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_svgio">_SVGIO</a> flags.
     * @type {Integer (Int32)}
     */
    static SVGIO_TYPE_MASK => 15

    /**
     * 0x80000000. Returns the items in the order they appear in the view. If this flag is not set, the selected item will be listed first.
     * @type {Integer (Int32)}
     */
    static SVGIO_FLAG_VIEWORDER => -2147483648
}
