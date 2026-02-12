#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines values used by the [NetworkOperatorTetheringManager.TetheringOperationalState](networkoperatortetheringmanager_tetheringoperationalstate.md) property to indicate the operational state of a device's tethering capabilities.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.networking.networkoperators.tetheringoperationalstate
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class TetheringOperationalState extends Win32Enum{

    /**
     * Current operational state is unknown.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Tethering is on.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * Tethering is off.
     * @type {Integer (Int32)}
     */
    static Off => 2

    /**
     * The tethering feature is currently in transition between the **On** and **Off** states.
     * @type {Integer (Int32)}
     */
    static InTransition => 3
}
