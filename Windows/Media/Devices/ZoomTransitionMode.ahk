#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the zoom transition modes.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.zoomtransitionmode
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class ZoomTransitionMode extends Win32Enum{

    /**
     * The default zoom transition mode for the device. Can be Direct or Smooth, depending on the device.
     * @type {Integer (Int32)}
     */
    static Auto => 0

    /**
     * The zoom transition is instantaneous.
     * @type {Integer (Int32)}
     */
    static Direct => 1

    /**
     * The zoom transition is smooth.
     * @type {Integer (Int32)}
     */
    static Smooth => 2
}
