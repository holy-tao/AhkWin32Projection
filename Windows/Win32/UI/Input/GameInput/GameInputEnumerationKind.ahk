#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputEnumerationKind extends Win32Enum {

    /**
     * Native name: GameInputNoEnumeration
     * @type {Integer (Int32)}
     */
    static NoEnumeration => 0

    /**
     * Native name: GameInputAsyncEnumeration
     * @type {Integer (Int32)}
     */
    static AsyncEnumeration => 1

    /**
     * Native name: GameInputBlockingEnumeration
     * @type {Integer (Int32)}
     */
    static BlockingEnumeration => 2
}
