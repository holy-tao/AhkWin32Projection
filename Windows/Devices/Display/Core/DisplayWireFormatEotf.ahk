#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines constants that specify an electro-optical transfer function (EOTF) for encoded pixels. The EOTF defines how a pixel's encoded value is transformed to an optical brightness on a hardware display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.devices.display.core.displaywireformateotf
 * @namespace Windows.Devices.Display.Core
 * @version WindowsRuntime 1.4
 */
class DisplayWireFormatEotf extends Win32Enum{

    /**
     * Indicates that pixels are encoded for SDR brightness with a 2.2 gamma curve.
     * @type {Integer (Int32)}
     */
    static Sdr => 0

    /**
     * Indicates that pixels are encoded for the SMPTE ST 2084 transfer function, also known as Perceptual Quantizer (PQ).
     * @type {Integer (Int32)}
     */
    static HdrSmpte2084 => 1
}
