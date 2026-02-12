#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Types of gamepad remapping.
 * @remarks
 * > [!CAUTION]
 * > Controller mapping is system-wide and persistent for the given user. This should only be done at the user's direction.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.remappingbuttoncategory
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class RemappingButtonCategory extends Win32Enum{

    /**
     * Used to remap buttons.
     * @type {Integer (Int32)}
     */
    static ButtonSettings => 0

    /**
     * Used to swap analog controls.
     * @type {Integer (Int32)}
     */
    static AnalogSettings => 1

    /**
     * Used to disable vibration.
     * @type {Integer (Int32)}
     */
    static VibrationSettings => 2

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareShortPress => 3

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareShortPressMetaData => 4

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareShortPressMetaDataDisplay => 5

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareLongPress => 6

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareLongPressMetaData => 7

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareLongPressMetaDataDisplay => 8

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareDoublePress => 9

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareDoublePressMetaData => 10

    /**
     * Not implemented.
     * @type {Integer (Int32)}
     */
    static ShareDoublePressMetaDataDisplay => 11
}
