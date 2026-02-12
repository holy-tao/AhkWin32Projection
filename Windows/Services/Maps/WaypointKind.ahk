#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of waypoint.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.waypointkind
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class WaypointKind extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Stop => 0

    /**
     * @type {Integer (Int32)}
     */
    static Via => 1
}
