#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the library options.
 * @remarks
 * 
 * <h3><a id="Used_By"></a><a id="used_by"></a><a id="USED_BY"></a>Used By</h3>
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-getoptions">IShellLibrary::GetOptions</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishelllibrary-setoptions">IShellLibrary::SetOptions</a>
 * </li>
 * </ul>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-libraryoptionflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class LIBRARYOPTIONFLAGS{

    /**
     * No library options are set.
     * @type {Integer (Int32)}
     */
    static LOF_DEFAULT => 0

    /**
     * Pin the library to the navigation pane.
     * @type {Integer (Int32)}
     */
    static LOF_PINNEDTONAVPANE => 1

    /**
     * All valid library options flags.
     * @type {Integer (Int32)}
     */
    static LOF_MASK_ALL => 1
}
