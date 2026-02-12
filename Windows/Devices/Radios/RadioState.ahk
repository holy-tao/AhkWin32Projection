#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the operational states of a radio (power and controllability).
 * @remarks
 * Hardware switches or system policy can force **Disabled** regardless of prior requests. **Unknown** typically clears 
 * after hardware/driver stabilization; re-read state after [StateChanged](radio_statechanged.md) events.
 * @see https://learn.microsoft.com/uwp/api/windows.devices.radios.radiostate
 * @namespace Windows.Devices.Radios
 * @version WindowsRuntime 1.4
 */
class RadioState extends Win32Enum{

    /**
     * The radio state is unknown, or the radio is in a bad or uncontrollable state. Typically represents transient 
     * hardware conditions or driver initialization states that resolve automatically.
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * The radio is powered on.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * The radio is powered off.
     * @type {Integer (Int32)}
     */
    static Off => 2

    /**
     * The radio is powered off and disabled by the device firmware or a hardware switch on the device. Cannot be changed 
     * programmatically.
     * @type {Integer (Int32)}
     */
    static Disabled => 3
}
