#Requires AutoHotkey v2.0.0 64-bit

/**
 * These flags are used with IExplorerBrowser::FillFromObject.
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/ne-shobjidl_core-explorer_browser_fill_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class EXPLORER_BROWSER_FILL_FLAGS{

    /**
     * No flags.
     * @type {Integer (Int32)}
     */
    static EBF_NONE => 0

    /**
     * Causes <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-iexplorerbrowser-fillfromobject">IExplorerBrowser::FillFromObject</a> to first populate the results folder with the contents of the parent folders of the items in the data object, and then select only the items that are in the data object.
     * @type {Integer (Int32)}
     */
    static EBF_SELECTFROMDATAOBJECT => 256

    /**
     * Do not allow dropping on the folder. In other words, do not register a drop target for the view. Applications can then register their own drop targets.
     * @type {Integer (Int32)}
     */
    static EBF_NODROPTARGET => 512
}
