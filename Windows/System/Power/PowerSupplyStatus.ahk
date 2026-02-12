#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the device's power supply status.
 * @remarks
 * An **Inadequate** status occurs when the power supply is present, but the charge rate is negative. For example, the device is plugged in, but it’s losing charge.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.powersupplystatus
 * @namespace Windows.System.Power
 * @version WindowsRuntime 1.4
 */
class PowerSupplyStatus extends Win32Enum{

    /**
     * The device has no power supply.
     * @type {Integer (Int32)}
     */
    static NotPresent => 0

    /**
     * The device has an inadequate power supply.
     * @type {Integer (Int32)}
     */
    static Inadequate => 1

    /**
     * The device has an adequate power supply.
     * @type {Integer (Int32)}
     */
    static Adequate => 2
}
