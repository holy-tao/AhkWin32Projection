#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how a shortcut should be handled by the browser.
 * @see https://docs.microsoft.com/windows/win32/api//shlobj_core/ne-shlobj_core-ieshortcutflags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IESHORTCUTFLAGS{

    /**
     * A new browser window should be opened for each shortcut.
     * @type {Integer (Int32)}
     */
    static IESHORTCUT_NEWBROWSER => 1

    /**
     * The current or topmost browser window should open the link in a new foreground tab.
     * @type {Integer (Int32)}
     */
    static IESHORTCUT_OPENNEWTAB => 2

    /**
     * The current or topmost browser window should open the link.
     * @type {Integer (Int32)}
     */
    static IESHORTCUT_FORCENAVIGATE => 4

    /**
     * The current or topmost browser window should open the link in a new  background tab.
     * @type {Integer (Int32)}
     */
    static IESHORTCUT_BACKGROUNDTAB => 8
}
