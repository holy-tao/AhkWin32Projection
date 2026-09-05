#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Input.GameInput
 */
class GameInputDeviceFamily extends Win32Enum {

    /**
     * Native name: GameInputFamilyVirtual
     * @type {Integer (Int32)}
     */
    static Virtual => -1

    /**
     * Native name: GameInputFamilyAggregate
     * @type {Integer (Int32)}
     */
    static Aggregate => 0

    /**
     * Native name: GameInputFamilyXboxOne
     * @type {Integer (Int32)}
     */
    static XboxOne => 1

    /**
     * Native name: GameInputFamilyXbox360
     * @type {Integer (Int32)}
     */
    static Xbox360 => 2

    /**
     * Native name: GameInputFamilyHid
     * @type {Integer (Int32)}
     */
    static Hid => 3

    /**
     * Native name: GameInputFamilyI8042
     * @type {Integer (Int32)}
     */
    static FamilyI8042 => 4
}
