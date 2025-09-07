#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines options for filtering folder items.
 * @remarks
 * <h3><a id="Used_By"></a><a id="used_by"></a><a id="USED_BY"></a>Used By</h3>
  * The <b>LIBRARYFOLDERFILTER</b> enumeration is used by the following methods and functions.
  *          
  * 
  * <ul>
  * <li>
  * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getfolders">IShellLibrary::GetFolders</a>
  * </li>
  * </ul>
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-libraryfolderfilter
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class LIBRARYFOLDERFILTER{

    /**
     * Return only file system items.
     * @type {Integer (Int32)}
     */
    static LFF_FORCEFILESYSTEM => 1

    /**
     * Return items that can be bound to an IStorage object.
     * @type {Integer (Int32)}
     */
    static LFF_STORAGEITEMS => 2

    /**
     * Return all items.
     * @type {Integer (Int32)}
     */
    static LFF_ALLITEMS => 3
}
