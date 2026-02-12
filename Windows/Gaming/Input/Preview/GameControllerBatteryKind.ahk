#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The kind of battery in the controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.gamecontrollerbatterykind
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GameControllerBatteryKind extends Win32Enum{

    /**
     * The kind of battery is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The controller does not have a battery.
     * @type {Integer (Int32)}
     */
    static None => 1

    /**
     * The controller has a non-rechargeable battery.
     * @type {Integer (Int32)}
     */
    static Standard => 2

    /**
     * The controller has a rechargeable battery.
     * @type {Integer (Int32)}
     */
    static Rechargeable => 3
}
