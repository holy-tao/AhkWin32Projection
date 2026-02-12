#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The amount of battery remaining in the controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.gamecontrollerbatterylevel
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GameControllerBatteryLevel extends Win32Enum{

    /**
     * The battery level is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The battery level is very low.
     * @type {Integer (Int32)}
     */
    static Critical => 1

    /**
     * The battery level is low.
     * @type {Integer (Int32)}
     */
    static Low => 2

    /**
     * The battery is partly charged.
     * @type {Integer (Int32)}
     */
    static Medium => 3

    /**
     * The battery is fully charged.
     * @type {Integer (Int32)}
     */
    static Full => 4
}
