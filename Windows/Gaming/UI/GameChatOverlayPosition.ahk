#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates the game chat overlay's position on the screen.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.ui.gamechatoverlayposition
 * @namespace Windows.Gaming.UI
 * @version WindowsRuntime 1.4
 */
class GameChatOverlayPosition extends Win32Enum{

    /**
     * The bottom center position.
     * @type {Integer (Int32)}
     */
    static BottomCenter => 0

    /**
     * The bottom left position.
     * @type {Integer (Int32)}
     */
    static BottomLeft => 1

    /**
     * The bottom right position.
     * @type {Integer (Int32)}
     */
    static BottomRight => 2

    /**
     * The middle right position.
     * @type {Integer (Int32)}
     */
    static MiddleRight => 3

    /**
     * The middle left position.
     * @type {Integer (Int32)}
     */
    static MiddleLeft => 4

    /**
     * The top center position.
     * @type {Integer (Int32)}
     */
    static TopCenter => 5

    /**
     * The top left position.
     * @type {Integer (Int32)}
     */
    static TopLeft => 6

    /**
     * The top right position.
     * @type {Integer (Int32)}
     */
    static TopRight => 7
}
