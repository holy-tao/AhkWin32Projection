#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a wireless frequency band for a WiFi adapter.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringwifiband
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class TetheringWiFiBand extends Win32Enum{

    /**
     * Specifies that the WiFi adapter is free to choose any band per internal logic.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * Specifies that the WiFi adapter should use only the 2.4 GHz band.
     * @type {Integer (Int32)}
     */
    static TwoPointFourGigahertz => 1

    /**
     * Specifies that the WiFi adapter should use only the 5 GHz band.
     * @type {Integer (Int32)}
     */
    static FiveGigahertz => 2

    /**
     * Specifies that the WiFi adapter should use only the 6 GHz band.
     * @type {Integer (Int32)}
     */
    static SixGigahertz => 3
}
