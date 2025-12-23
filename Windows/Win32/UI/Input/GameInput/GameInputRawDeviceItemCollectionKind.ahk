#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputRawDeviceItemCollectionKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUnknownItemCollection => -1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputPhysicalItemCollection => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputApplicationItemCollection => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputLogicalItemCollection => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputReportItemCollection => 3

    /**
     * @type {Integer (Int32)}
     */
    static GameInputNamedArrayItemCollection => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUsageSwitchItemCollection => 5

    /**
     * @type {Integer (Int32)}
     */
    static GameInputUsageModifierItemCollection => 6
}
