#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputRawDeviceReportItemFlags extends Win32BitflagEnum {

    /**
     * Native name: GameInputDefaultItem
     * @type {Integer (Int32)}
     */
    static DefaultItem => 0

    /**
     * Native name: GameInputConstantItem
     * @type {Integer (Int32)}
     */
    static ConstantItem => 1

    /**
     * Native name: GameInputArrayItem
     * @type {Integer (Int32)}
     */
    static ArrayItem => 2

    /**
     * Native name: GameInputRelativeItem
     * @type {Integer (Int32)}
     */
    static RelativeItem => 4

    /**
     * Native name: GameInputWraparoundItem
     * @type {Integer (Int32)}
     */
    static WraparoundItem => 8

    /**
     * Native name: GameInputNonlinearItem
     * @type {Integer (Int32)}
     */
    static NonlinearItem => 16

    /**
     * Native name: GameInputStableItem
     * @type {Integer (Int32)}
     */
    static StableItem => 32

    /**
     * Native name: GameInputNullableItem
     * @type {Integer (Int32)}
     */
    static NullableItem => 64

    /**
     * Native name: GameInputVolatileItem
     * @type {Integer (Int32)}
     */
    static VolatileItem => 128

    /**
     * Native name: GameInputBufferedItem
     * @type {Integer (Int32)}
     */
    static BufferedItem => 256
}
