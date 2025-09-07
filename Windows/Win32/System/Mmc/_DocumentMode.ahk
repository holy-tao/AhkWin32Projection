#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DocumentMode enumeration is used by the Document.Mode property and specifies how the document is opened. This enumeration applies to the MMC 2.0 Automation Object Model.
 * @see https://learn.microsoft.com/windows/win32/api/mmcobj/ne-mmcobj-_documentmode
 * @namespace Windows.Win32.System.Mmc
 * @version v4.0.30319
 */
class _DocumentMode{

    /**
     * The document is opened in Author Mode.
     * @type {Integer (Int32)}
     */
    static DocumentMode_Author => 0

    /**
     * The document is opened in Full-Access User Mode.
     * @type {Integer (Int32)}
     */
    static DocumentMode_User => 1

    /**
     * The document is opened in Limited-Access User Mode with multiple windows.
     * @type {Integer (Int32)}
     */
    static DocumentMode_User_MDI => 2

    /**
     * The document is opened in Limited-Access User Mode with a single window.
     * @type {Integer (Int32)}
     */
    static DocumentMode_User_SDI => 3
}
