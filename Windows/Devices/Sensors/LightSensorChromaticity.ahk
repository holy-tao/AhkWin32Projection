#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Provides access to light sensor chromaticity coordinate values. These coordinates represent xy in the CIE xyY color space.
 * @remarks
 * [IsChromaticitySupported](lightsensor_ischromaticitysupported_620535635.md)
 * @see https://learn.microsoft.com/uwp/api/windows.devices.sensors.lightsensorchromaticity
 * @namespace Windows.Devices.Sensors
 * @version WindowsRuntime 1.4
 */
class LightSensorChromaticity extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Chromaticity value of the x coordinate of the CIE xyY color space. Values are normalized, and range from 0 - 1.
     * @type {Float}
     */
    X {
        get => NumGet(this, 0, "double")
        set => NumPut("double", value, this, 0)
    }

    /**
     * Chromaticity value of the y coordinate of the CIE xyY color space. Values are normalized, and range from 0 - 1.
     * @type {Float}
     */
    Y {
        get => NumGet(this, 8, "double")
        set => NumPut("double", value, this, 8)
    }
}
