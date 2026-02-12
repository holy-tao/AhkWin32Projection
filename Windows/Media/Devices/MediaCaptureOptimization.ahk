#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Defines the optimizations that the media capture device can use.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.devices.mediacaptureoptimization
 * @namespace Windows.Media.Devices
 * @version WindowsRuntime 1.4
 */
class MediaCaptureOptimization extends Win32Enum{

    /**
     * The default driver settings are used.
     * @type {Integer (Int32)}
     */
    static Default => 0

    /**
     * High picture quality is prioritized.
     * @type {Integer (Int32)}
     */
    static Quality => 1

    /**
     * Low latency is prioritized.
     * @type {Integer (Int32)}
     */
    static Latency => 2

    /**
     * Low power consumption is prioritized.
     * @type {Integer (Int32)}
     */
    static Power => 3

    /**
     * Low latency is prioritized, with high picture quality prioritized second.
     * @type {Integer (Int32)}
     */
    static LatencyThenQuality => 4

    /**
     * Low latency is prioritized, with low power consumption prioritized second.
     * @type {Integer (Int32)}
     */
    static LatencyThenPower => 5

    /**
     * Low power consumption and high picture quality are prioritized.
     * @type {Integer (Int32)}
     */
    static PowerAndQuality => 6
}
