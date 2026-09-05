#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Determines which, if any, modifier keys were pressed when the flick gesture occurred.
 * @see https://learn.microsoft.com/windows/win32/api/tabflicks/ne-tabflicks-keymodifier
 * @namespace Windows.Win32.UI.TabletPC
 */
class KEYMODIFIER extends Win32Enum {

    /**
     * The Control key was pressed when the Flicks gesture occurred.
     * Native name: KEYMODIFIER_CONTROL
     * @type {Integer (Int32)}
     */
    static CONTROL => 1

    /**
     * The Menu key was pressed when the Flicks gesture occurred.
     * Native name: KEYMODIFIER_MENU
     * @type {Integer (Int32)}
     */
    static MENU => 2

    /**
     * The Shift key was pressed when the Flicks gesture occurred.
     * Native name: KEYMODIFIER_SHIFT
     * @type {Integer (Int32)}
     */
    static SHIFT => 4

    /**
     * The Windows key was pressed when the Flicks gesture occurred.
     * Native name: KEYMODIFIER_WIN
     * @type {Integer (Int32)}
     */
    static WIN => 8

    /**
     * The Alt key was pressed when the Flicks gesture occurred.
     * Native name: KEYMODIFIER_ALTGR
     * @type {Integer (Int32)}
     */
    static ALTGR => 16

    /**
     * The pressed key's scan code was preceded by a prefix byte that has the value 0xE0 (224).
     * Native name: KEYMODIFIER_EXT
     * @type {Integer (Int32)}
     */
    static EXT => 32
}
