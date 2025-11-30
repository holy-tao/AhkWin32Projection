#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputEnumerationKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputNoEnumeration => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputAsyncEnumeration => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputBlockingEnumeration => 2
}
