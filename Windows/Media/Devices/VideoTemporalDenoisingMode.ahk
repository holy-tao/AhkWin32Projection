#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the video temporal denoising modes.
 * @remarks
 * Set the temporal denoising mode with the [VideoTemporalDenoisingControl.Mode](videotemporaldenoisingcontrol_mode.md) property.
 * 
 * Not all modes may be available on all devices. Check the [VideoTemporalDenoisingControl.SupportedModes](videotemporaldenoisingcontrol_supportedmodes.md) property to determine what modes are supported on the current device.
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.videotemporaldenoisingmode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class VideoTemporalDenoisingMode extends Win32Enum{

    /**
     * Temporal denoising is off.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Temporal denoising is on.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * The system dynamically enables temporal denoising when appropriate.
     * @type {Integer (Int32)}
     */
    static Auto => 2
}
