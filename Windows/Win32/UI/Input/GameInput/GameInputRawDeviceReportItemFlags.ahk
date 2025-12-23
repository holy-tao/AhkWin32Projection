#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 * @version v4.0.30319
 */
class GameInputRawDeviceReportItemFlags extends Win32BitflagEnum{

    /**
     * @type {Integer (Int32)}
     */
    static GameInputDefaultItem => 0

    /**
     * @type {Integer (Int32)}
     */
    static GameInputConstantItem => 1

    /**
     * @type {Integer (Int32)}
     */
    static GameInputArrayItem => 2

    /**
     * @type {Integer (Int32)}
     */
    static GameInputRelativeItem => 4

    /**
     * @type {Integer (Int32)}
     */
    static GameInputWraparoundItem => 8

    /**
     * @type {Integer (Int32)}
     */
    static GameInputNonlinearItem => 16

    /**
     * @type {Integer (Int32)}
     */
    static GameInputStableItem => 32

    /**
     * @type {Integer (Int32)}
     */
    static GameInputNullableItem => 64

    /**
     * @type {Integer (Int32)}
     */
    static GameInputVolatileItem => 128

    /**
     * @type {Integer (Int32)}
     */
    static GameInputBufferedItem => 256
}
