#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The position of the game controller's switch.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamecontrollerswitchposition
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class GameControllerSwitchPosition extends Win32Enum{

    /**
     * The center position.
     * @type {Integer (Int32)}
     */
    static Center => 0

    /**
     * The top position.
     * @type {Integer (Int32)}
     */
    static Up => 1

    /**
     * The top-right position.
     * @type {Integer (Int32)}
     */
    static UpRight => 2

    /**
     * The right position.
     * @type {Integer (Int32)}
     */
    static Right => 3

    /**
     * The bottom right position.
     * @type {Integer (Int32)}
     */
    static DownRight => 4

    /**
     * The bottom position.
     * @type {Integer (Int32)}
     */
    static Down => 5

    /**
     * The bottom left position.
     * @type {Integer (Int32)}
     */
    static DownLeft => 6

    /**
     * The left position.
     * @type {Integer (Int32)}
     */
    static Left => 7

    /**
     * The top-left position.
     * @type {Integer (Int32)}
     */
    static UpLeft => 8
}
