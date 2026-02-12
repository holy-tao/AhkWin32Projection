#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * The type of step taken according to the pedometer.
 * @remarks
 * A single step type applies to all of the steps recorded during a single [PedometerReading](pedometerreading.md).
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.pedometerstepkind
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class PedometerStepKind extends Win32Enum{

    /**
     * An unknown step type.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * A walking step.
     * @type {Integer (Int32)}
     */
    static Walking => 1

    /**
     * A running step.
     * @type {Integer (Int32)}
     */
    static Running => 2
}
