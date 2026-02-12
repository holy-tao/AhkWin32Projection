#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the optical image stabilization modes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.opticalimagestabilizationmode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class OpticalImageStabilizationMode extends Win32Enum{

    /**
     * Optical image stabilization is disabled.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * Optical image stabilization is enabled.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * The system dynamically enables optical image stabilization when appropriate.
     * @type {Integer (Int32)}
     */
    static Auto => 2
}
