#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Specifies the modes of the [DigitalWindowControl](digitalwindowcontrol.md).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.digitalwindowmode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class DigitalWindowMode extends Win32Enum{

    /**
     * The **DigitalWindowControl** is off.
     * @type {Integer (Int32)}
     */
    static Off => 0

    /**
     * The **DigitalWindowControl** is on.
     * @type {Integer (Int32)}
     */
    static On => 1

    /**
     * The bounds of the digital window are selected automatically by the capture device driver.
     * @type {Integer (Int32)}
     */
    static Auto => 2
}
