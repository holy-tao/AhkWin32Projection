#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputRawDeviceItemCollectionKind extends Win32Enum {

    /**
     * Native name: GameInputUnknownItemCollection
     * @type {Integer (Int32)}
     */
    static UnknownItemCollection => -1

    /**
     * Native name: GameInputPhysicalItemCollection
     * @type {Integer (Int32)}
     */
    static PhysicalItemCollection => 0

    /**
     * Native name: GameInputApplicationItemCollection
     * @type {Integer (Int32)}
     */
    static ApplicationItemCollection => 1

    /**
     * Native name: GameInputLogicalItemCollection
     * @type {Integer (Int32)}
     */
    static LogicalItemCollection => 2

    /**
     * Native name: GameInputReportItemCollection
     * @type {Integer (Int32)}
     */
    static ReportItemCollection => 3

    /**
     * Native name: GameInputNamedArrayItemCollection
     * @type {Integer (Int32)}
     */
    static NamedArrayItemCollection => 4

    /**
     * Native name: GameInputUsageSwitchItemCollection
     * @type {Integer (Int32)}
     */
    static UsageSwitchItemCollection => 5

    /**
     * Native name: GameInputUsageModifierItemCollection
     * @type {Integer (Int32)}
     */
    static UsageModifierItemCollection => 6
}
