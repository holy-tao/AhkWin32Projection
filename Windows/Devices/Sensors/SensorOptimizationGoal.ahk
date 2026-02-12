#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Indicates whether power or precision should be optimized for sensors.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.sensoroptimizationgoal
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class SensorOptimizationGoal extends Win32Enum{

    /**
     * This sensor will prioritize precision over power efficiency.
     * @type {Integer (Int32)}
     */
    static Precision => 0

    /**
     * This sensor will prioritize power efficiency over precision depending on the hardware available.
     * @type {Integer (Int32)}
     */
    static PowerEfficiency => 1
}
