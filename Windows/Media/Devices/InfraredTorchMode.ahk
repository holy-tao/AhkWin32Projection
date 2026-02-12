#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the Infrared torch modes.
 * @remarks
 * Set the current infrared torch mode with the [InfraredTorchControl.CurrentMode](infraredtorchcontrol_currentmode.md)
 * 
 * Not all modes may be available on all devices. Check the [InfraredTorchControl.SupportedModes](infraredtorchcontrol_supportedmodes.md) property to determine what modes are supported on the current device.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.infraredtorchmode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class InfraredTorchMode extends Win32Enum{

    /**
     * “Off” mode means that the infrared LED is constantly off
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * “On” mode means that the infrared LED is constantly on
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * “AlternatingFrameIllumination” mode means that the infrared LED is on for every other frame.
     * @type {Integer (Int32)}
     */
    static AlternatingFrameIllumination => 2
}
