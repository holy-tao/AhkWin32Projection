#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the level of traffic congestion along a map route or route leg.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.trafficcongestion
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class TrafficCongestion extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static Light => 1

    /**
     * @type {Integer (Int32)}
     */
    static Mild => 2

    /**
     * @type {Integer (Int32)}
     */
    static Medium => 3

    /**
     * @type {Integer (Int32)}
     */
    static Heavy => 4
}
