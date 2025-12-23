#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Used with method IBrowserFrameOptions::GetFrameOptions.
 * @remarks
 * These constants are defined in the Shobjidl.h file beginning in Windows Vista.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ne-shobjidl_core-_browserframeoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class _BROWSERFRAMEOPTIONS extends Win32Enum{

    /**
     * Do nothing.
     * @type {Integer (Int32)}
     */
    static BFO_NONE => 0

    /**
     * Use the browser stream for this item. (Same window position as IE browser windows.)
     * @type {Integer (Int32)}
     */
    static BFO_BROWSER_PERSIST_SETTINGS => 1

    /**
     * Rename <b>Folder Options</b> to <b>Internet Options</b> in the Tools or View menu.
     * @type {Integer (Int32)}
     */
    static BFO_RENAME_FOLDER_OPTIONS_TOINTERNET => 2

    /**
     * Keep both <b>Folder Options</b> and <b>Internet Options</b> in the Tools or View menu.
     * @type {Integer (Int32)}
     */
    static BFO_BOTH_OPTIONS => 4

    /**
     * This namespace extension prefers a .url shortcut over a .lnk shortcut.
     * @type {Integer (Int32)}
     */
    static BIF_PREFER_INTERNET_SHORTCUT => 8

    /**
     * Do not use "Browse in New Process" by invoking a shortcut.
     * @type {Integer (Int32)}
     */
    static BFO_BROWSE_NO_IN_NEW_PROCESS => 16

    /**
     * Track display name to determine when hyperlinks should be tagged as previously used.
     * @type {Integer (Int32)}
     */
    static BFO_ENABLE_HYPERLINK_TRACKING => 32

    /**
     * Use Internet Explorer's offline support.
     * @type {Integer (Int32)}
     */
    static BFO_USE_IE_OFFLINE_SUPPORT => 64

    /**
     * Use Start Page support for this namespace extension.
     * @type {Integer (Int32)}
     */
    static BFO_SUBSTITUE_INTERNET_START_PAGE => 128

    /**
     * Use the Brand block in the Toolbar.
     * @type {Integer (Int32)}
     */
    static BFO_USE_IE_LOGOBANDING => 256

    /**
     * Append <c>" - Internet Explorer"</c> to display name in the caption bar.
     * @type {Integer (Int32)}
     */
    static BFO_ADD_IE_TOCAPTIONBAR => 512

    /**
     * Reference the DialUp reference count while the browser is navigated to this location. This will also enable the ICW and Software update.
     * @type {Integer (Int32)}
     */
    static BFO_USE_DIALUP_REF => 1024

    /**
     * Use the Internet Explorer toolbar.
     * @type {Integer (Int32)}
     */
    static BFO_USE_IE_TOOLBAR => 2048

    /**
     * Disable navigation to parent folders. Used for the button that navigates to parent folder or the View.GoTo.ParentFolder feature.
     * @type {Integer (Int32)}
     */
    static BFO_NO_PARENT_FOLDER_SUPPORT => 4096

    /**
     * Browser windows are not reopened after a reboot of the system, regardless of whether they were open before the reboot. Use the same behavior for the namespace extension.
     * @type {Integer (Int32)}
     */
    static BFO_NO_REOPEN_NEXT_RESTART => 8192

    /**
     * Add <b>Home Page</b> to menu (Go).
     * @type {Integer (Int32)}
     */
    static BFO_GO_HOME_PAGE => 16384

    /**
     * Prefer use of Iexplore.exe over Explorer.exe.
     * @type {Integer (Int32)}
     */
    static BFO_PREFER_IEPROCESS => 32768

    /**
     * If navigation is terminated, show the <b>Action Canceled</b> HTML page.
     * @type {Integer (Int32)}
     */
    static BFO_SHOW_NAVIGATION_CANCELLED => 65536

    /**
     * Use the persisted Internet Explorer status bar settings.
     * @type {Integer (Int32)}
     */
    static BFO_USE_IE_STATUSBAR => 131072

    /**
     * Return all values.
     * @type {Integer (Int32)}
     */
    static BFO_QUERY_ALL => -1
}
