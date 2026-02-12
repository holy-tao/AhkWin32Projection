#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the constants that indicates power reporting capabilities of the Point of Service (POS) device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.pointofservice.unifiedpospowerreportingtype
 * @namespace Windows.Devices.PointOfService
 * @version WindowsRuntime 1.4
 */
class UnifiedPosPowerReportingType extends Win32Enum{

    /**
     * Cannot determine the state of the device, therefore no power reporting is possible.
     * @type {Integer (Int32)}
     */
    static UnknownPowerReportingType => 0

    /**
     * Can determine and report the two power states (online and off/offline) of the device.
     * @type {Integer (Int32)}
     */
    static Standard => 1

    /**
     * Can determine and report the three power states (off, offline, and online) of the device.
     * @type {Integer (Int32)}
     */
    static Advanced => 2
}
