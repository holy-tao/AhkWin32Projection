#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the view options returned by the ViewOptions property.
 * @see https://learn.microsoft.com/windows/win32/api/shldisp/ne-shldisp-shellfolderviewoptions
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class ShellFolderViewOptions{

    /**
     * 0x0001. The <b>Show All Files</b> option is enabled.
     * @type {Integer (Int32)}
     */
    static SFVVO_SHOWALLOBJECTS => 1

    /**
     * 0x0002. The <b>Hide extensions for known file types</b> option is disabled.
     * @type {Integer (Int32)}
     */
    static SFVVO_SHOWEXTENSIONS => 2

    /**
     * 0x0008. The <b>Display Compressed Files and Folders with Alternate Color</b> option is enabled.
     * @type {Integer (Int32)}
     */
    static SFVVO_SHOWCOMPCOLOR => 8

    /**
     * 0x0020. The <b>Do Not Show Hidden Files</b> option is enabled.
     * @type {Integer (Int32)}
     */
    static SFVVO_SHOWSYSFILES => 32

    /**
     * 0x0040. The <b>Classic Style</b> option is enabled.
     * @type {Integer (Int32)}
     */
    static SFVVO_WIN95CLASSIC => 64

    /**
     * 0x0080. The <b>Double-Click to Open an Item</b> option is enabled.
     * @type {Integer (Int32)}
     */
    static SFVVO_DOUBLECLICKINWEBVIEW => 128

    /**
     * 0x0200. The <b>Active Desktop – View as Web Page</b> option is enabled.
     * @type {Integer (Int32)}
     */
    static SFVVO_DESKTOPHTML => 512
}
