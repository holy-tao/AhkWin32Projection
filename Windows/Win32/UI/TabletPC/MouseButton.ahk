#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies which mouse button was pressed.
 * @see https://docs.microsoft.com/windows/win32/api//inked/ne-inked-mousebutton
 * @namespace Windows.Win32.UI.TabletPC
 * @version v4.0.30319
 */
class MouseButton extends Win32Enum{

    /**
     * Default. No mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static NO_BUTTON => 0

    /**
     * The left mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static LEFT_BUTTON => 1

    /**
     * The right mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static RIGHT_BUTTON => 2

    /**
     * The middle mouse button was pressed.
     * @type {Integer (Int32)}
     */
    static MIDDLE_BUTTON => 4
}
