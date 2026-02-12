#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the access rights to the vibration device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.haptics.vibrationaccessstatus
 * @namespace Windows.Devices.Haptics
 * @version WindowsRuntime 1.4
 */
class VibrationAccessStatus extends Win32Enum{

    /**
     * Vibration enabled.
     * @type {Integer (Int32)}
     */
    static Allowed => 0

    /**
     * Vibration disabled by user.
     * @type {Integer (Int32)}
     */
    static DeniedByUser => 1

    /**
     * Vibration disabled by system.
     * @type {Integer (Int32)}
     */
    static DeniedBySystem => 2

    /**
     * Vibration disabled for energy saving.
     * @type {Integer (Int32)}
     */
    static DeniedByEnergySaver => 3
}
