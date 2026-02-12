#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the severity of a potential issue along a route leg.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maneuverwarningseverity
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class ManeuverWarningSeverity extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * @type {Integer (Int32)}
     */
    static LowImpact => 1

    /**
     * @type {Integer (Int32)}
     */
    static Minor => 2

    /**
     * @type {Integer (Int32)}
     */
    static Moderate => 3

    /**
     * @type {Integer (Int32)}
     */
    static Serious => 4
}
