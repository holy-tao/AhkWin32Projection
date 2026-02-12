#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the type of flight stick button.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstickbuttons
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class FlightStickButtons extends Win32BitflagEnum{

    /**
     * No button.
     * @type {Integer (UInt32)}
     */
    static None => 0

    /**
     * The primary fire button.
     * @type {Integer (UInt32)}
     */
    static FirePrimary => 1

    /**
     * The secondary fire button.
     * @type {Integer (UInt32)}
     */
    static FireSecondary => 2
}
