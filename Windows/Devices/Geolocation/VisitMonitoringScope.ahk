#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Contains values that describe the intended scope of location monitoring for use with the Visits feature.
 * @remarks
 * A value must be specified when setting up a [GeovisitTrigger](/uwp/api/windows.applicationmodel.background.geovisittrigger) or [GeovisitMonitor](geovisitmonitor.md), in order to determine which Visit-related events will be processed.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.geolocation.visitmonitoringscope
 * @namespace Windows.Devices.Geolocation
 * @version WindowsRuntime 1.4
 */
class VisitMonitoringScope extends Win32Enum{

    /**
     * Monitor all Visit-related events that concern changes in building-sized areas.
     * @type {Integer (Int32)}
     */
    static Venue => 0

    /**
     * Monitor only the Visit-related events that concern changes in city-sized areas.
     * @type {Integer (Int32)}
     */
    static City => 1
}
