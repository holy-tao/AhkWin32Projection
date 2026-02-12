#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the set of possible accelerator key events that can invoke a callback.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.coreacceleratorkeyeventtype
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class CoreAcceleratorKeyEventType extends Win32Enum{

    /**
     * A character key is pressed.
     * @type {Integer (Int32)}
     */
    static Character => 2

    /**
     * A dead character key is pressed. (A *dead character* key is a key that modifies the next keypress, like an accent character.)
     * @type {Integer (Int32)}
     */
    static DeadCharacter => 3

    /**
     * A key is pressed down.
     * @type {Integer (Int32)}
     */
    static KeyDown => 0

    /**
     * A key is raised.
     * @type {Integer (Int32)}
     */
    static KeyUp => 1

    /**
     * A system character key is pressed.
     * @type {Integer (Int32)}
     */
    static SystemCharacter => 6

    /**
     * A system dead character key is pressed.
     * @type {Integer (Int32)}
     */
    static SystemDeadCharacter => 7

    /**
     * A system key is pressed down.
     * @type {Integer (Int32)}
     */
    static SystemKeyDown => 4

    /**
     * A system key is raised.
     * @type {Integer (Int32)}
     */
    static SystemKeyUp => 5

    /**
     * A Unicode character key is pressed.
     * @type {Integer (Int32)}
     */
    static UnicodeCharacter => 8
}
