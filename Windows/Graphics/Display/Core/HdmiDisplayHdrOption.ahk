#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify the high dynamic range (HDR) options of a connected device such as a TV or a monitor.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayhdroption
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class HdmiDisplayHdrOption extends Win32Enum{

    /**
     * Specifies no option.
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Specifies a standard dynamic range (SDR) electro-optical transfer function (EOTF).
     * @type {Integer (Int32)}
     */
    static EotfSdr => 1

    /**
     * Specifies an SMPTE ST 2084 electro-optical transfer function (EOTF).
     * @type {Integer (Int32)}
     */
    static Eotf2084 => 2

    /**
     * Specifies the low-latency profile for Dolby Vision.
     * @type {Integer (Int32)}
     */
    static DolbyVisionLowLatency => 3
}
