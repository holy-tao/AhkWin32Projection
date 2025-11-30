#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputArcadeStickButtons extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickMenu => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickView => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickUp => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickDown => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickLeft => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickRight => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction1 => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction2 => 128

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction3 => 256

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction4 => 512

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction5 => 1024

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickAction6 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickSpecial1 => 4096

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArcadeStickSpecial2 => 8192
}
