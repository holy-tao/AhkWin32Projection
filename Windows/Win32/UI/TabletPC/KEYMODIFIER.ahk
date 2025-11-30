#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines which, if any, modifier keys were pressed when the flick gesture occurred.
 * @see https://docs.microsoft.com/windows/win32/api//tabflicks/ne-tabflicks-keymodifier
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class KEYMODIFIER extends Win32Enum{

    /**
     * The Control key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_CONTROL => 1

    /**
     * The Menu key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_MENU => 2

    /**
     * The Shift key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_SHIFT => 4

    /**
     * The Windows key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_WIN => 8

    /**
     * The Alt key was pressed when the Flicks gesture occurred.
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_ALTGR => 16

    /**
     * The pressed key's scan code was preceded by a prefix byte that has the value 0xE0 (224).
     * @type {Integer (Int32)}
     */
    static KEYMODIFIER_EXT => 32
}
