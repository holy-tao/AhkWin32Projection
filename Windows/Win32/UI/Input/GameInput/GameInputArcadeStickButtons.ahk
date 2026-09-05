#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputArcadeStickButtons extends Win32BitflagEnum {

    /**
     * Native name: GameInputArcadeStickNone
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: GameInputArcadeStickMenu
     * @type {Integer (Int32)}
     */
    static Menu => 1

    /**
     * Native name: GameInputArcadeStickView
     * @type {Integer (Int32)}
     */
    static View => 2

    /**
     * Native name: GameInputArcadeStickUp
     * @type {Integer (Int32)}
     */
    static Up => 4

    /**
     * Native name: GameInputArcadeStickDown
     * @type {Integer (Int32)}
     */
    static Down => 8

    /**
     * Native name: GameInputArcadeStickLeft
     * @type {Integer (Int32)}
     */
    static Left => 16

    /**
     * Native name: GameInputArcadeStickRight
     * @type {Integer (Int32)}
     */
    static Right => 32

    /**
     * Native name: GameInputArcadeStickAction1
     * @type {Integer (Int32)}
     */
    static Action1 => 64

    /**
     * Native name: GameInputArcadeStickAction2
     * @type {Integer (Int32)}
     */
    static Action2 => 128

    /**
     * Native name: GameInputArcadeStickAction3
     * @type {Integer (Int32)}
     */
    static Action3 => 256

    /**
     * Native name: GameInputArcadeStickAction4
     * @type {Integer (Int32)}
     */
    static Action4 => 512

    /**
     * Native name: GameInputArcadeStickAction5
     * @type {Integer (Int32)}
     */
    static Action5 => 1024

    /**
     * Native name: GameInputArcadeStickAction6
     * @type {Integer (Int32)}
     */
    static Action6 => 2048

    /**
     * Native name: GameInputArcadeStickSpecial1
     * @type {Integer (Int32)}
     */
    static Special1 => 4096

    /**
     * Native name: GameInputArcadeStickSpecial2
     * @type {Integer (Int32)}
     */
    static Special2 => 8192
}
