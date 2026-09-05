#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputKeyboardKind extends Win32Enum {

    /**
     * Native name: GameInputUnknownKeyboard
     * @type {Integer (Int32)}
     */
    static UnknownKeyboard => -1

    /**
     * Native name: GameInputAnsiKeyboard
     * @type {Integer (Int32)}
     */
    static AnsiKeyboard => 0

    /**
     * Native name: GameInputIsoKeyboard
     * @type {Integer (Int32)}
     */
    static IsoKeyboard => 1

    /**
     * Native name: GameInputKsKeyboard
     * @type {Integer (Int32)}
     */
    static KsKeyboard => 2

    /**
     * Native name: GameInputAbntKeyboard
     * @type {Integer (Int32)}
     */
    static AbntKeyboard => 3

    /**
     * Native name: GameInputJisKeyboard
     * @type {Integer (Int32)}
     */
    static JisKeyboard => 4
}
