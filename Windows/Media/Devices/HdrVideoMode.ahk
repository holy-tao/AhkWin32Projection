#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the High Dynamic Range (HDR) video modes.
 * @remarks
 * Set the temporal denoising mode with the [HdrVideoControl.Mode](hdrvideocontrol_mode.md) property.
 * 
 * Not all modes may be available on all devices. Check the [HdrVideoControl.SupportedModes](hdrvideocontrol_supportedmodes.md) property to determine what modes are supported on the current device.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.hdrvideomode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class HdrVideoMode extends Win32Enum{

    /**
     * HDR video capture is disabled.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * HDR video capture is enabled.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * The system dynamically enables HDR video capture when appropriate.
     * @type {Integer (Int32)}
     */
    static Auto => 2
}
