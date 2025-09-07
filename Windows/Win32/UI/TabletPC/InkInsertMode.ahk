#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies how ink is inserted onto the InkEdit control.
 * @see https://learn.microsoft.com/windows/win32/api/inked/ne-inked-inkinsertmode
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class InkInsertMode{

    /**
     * Default. Drawn ink is inserted as text.
     * @type {Integer (Int32)}
     */
    static IEM_InsertText => 0

    /**
     * Drawn ink is inserted as ink.
     * @type {Integer (Int32)}
     */
    static IEM_InsertInk => 1
}
