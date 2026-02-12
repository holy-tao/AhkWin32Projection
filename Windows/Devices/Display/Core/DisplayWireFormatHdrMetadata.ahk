#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify a format for HDR mastering metadata embedded in a pixel bitstream. HDR mastering metadata typically defines how a video stream should be adapted for playback on specific display hardware.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformathdrmetadata
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayWireFormatHdrMetadata extends Win32Enum{

    /**
     * Indicates that no HDR mastering metadata will be supported.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Indicates that HDR10 mastering metadata will be supported, standardized as SMPTE ST 2086.
     * @type {Integer (Int32)}
     */
    static Hdr10 => 1

    /**
     * Indicates that HDR10+ HDR mastering metadata will be supported, standardized as SMPTE ST 2094-40.
     * @type {Integer (Int32)}
     */
    static Hdr10Plus => 2

    /**
     * Indicates that Dolby Vision low-latency mastering metadata will be supported.
     * @type {Integer (Int32)}
     */
    static DolbyVisionLowLatency => 3
}
