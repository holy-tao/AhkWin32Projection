#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents the backend operational state of the power/thermal subsystem. Use values to determine whether the backend is started or stopped.
 * @remarks
 * **PowerThermalBackEndStatus** is expected to be **Started** in normal operation; **Stopped** typically indicates the MPTF backend was restarted (for example, during tuning). Clients should stop reading or publishing data while the backend is Stopped and resume when it reports **Started**. The enum is preferred over a Boolean for clarity and is not expected to be extended.
 * @see https://learn.microsoft.com/uwp/api/windows.system.power.thermal.powerthermalbackendstatus
 * @namespace Windows.System.Power.Thermal
 * @version WindowsRuntime 1.4
 */
class PowerThermalBackEndStatus extends Win32Enum{

    /**
     * The power/thermal backend is not running.
     * @type {Integer (Int32)}
     */
    static Stopped => 0

    /**
     * The power/thermal backend is running and responsive.
     * @type {Integer (Int32)}
     */
    static Started => 1
}
