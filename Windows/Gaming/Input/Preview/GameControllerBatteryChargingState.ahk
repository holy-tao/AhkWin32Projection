#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Battery charging state of the controller.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.gamecontrollerbatterychargingstate
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class GameControllerBatteryChargingState extends Win32Enum{

    /**
     * The battery charging state is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The battery is not charging.
     * @type {Integer (Int32)}
     */
    static Inactive => 1

    /**
     * The battery is charging.
     * @type {Integer (Int32)}
     */
    static Active => 2

    /**
     * The controller has reported a charging error.
     * @type {Integer (Int32)}
     */
    static Error => 3
}
