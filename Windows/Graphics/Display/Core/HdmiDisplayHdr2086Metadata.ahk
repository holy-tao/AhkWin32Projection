#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes the 10 bit display metadata which is usually used for video. This is used to adjust the output to best match a display's capabilities.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.core.hdmidisplayhdr2086metadata
 * @namespace Windows.Graphics.Display.Core
 * @version WindowsRuntime 1.4
 */
class HdmiDisplayHdr2086Metadata extends Win32Struct
{
    static sizeof => 24

    static packingSize => 2

    /**
     * The X chromaticity coordinate of the red value.
     * @type {Integer}
     */
    RedPrimaryX {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * The Y chromaticity coordinate of the red value.
     * @type {Integer}
     */
    RedPrimaryY {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * The X chromaticity coordinate of the green value.
     * @type {Integer}
     */
    GreenPrimaryX {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * The Y chromaticity coordinate of the green value.
     * @type {Integer}
     */
    GreenPrimaryY {
        get => NumGet(this, 6, "ushort")
        set => NumPut("ushort", value, this, 6)
    }

    /**
     * The X chromaticity coordinate of the blue value.
     * @type {Integer}
     */
    BluePrimaryX {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * The Y chromaticity coordinate of the blue value.
     * @type {Integer}
     */
    BluePrimaryY {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * The X chromaticity coordinate of the white point.
     * @type {Integer}
     */
    WhitePointX {
        get => NumGet(this, 12, "ushort")
        set => NumPut("ushort", value, this, 12)
    }

    /**
     * The Y chromaticity coordinate of the white point.
     * @type {Integer}
     */
    WhitePointY {
        get => NumGet(this, 14, "ushort")
        set => NumPut("ushort", value, this, 14)
    }

    /**
     * The maximum number of nits of the display used to master the content. Units are 0.0001 nit, so if the value is 1 nit, the value should be 10,000.
     * @type {Integer}
     */
    MaxMasteringLuminance {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * The minimum number of nits (in units of 0.00001 nit) of the display used to master the content.
     * @type {Integer}
     */
    MinMasteringLuminance {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }

    /**
     * The maximum nit value (in units of 0.00001 nit) used anywhere in the content.
     * @type {Integer}
     */
    MaxContentLightLevel {
        get => NumGet(this, 20, "ushort")
        set => NumPut("ushort", value, this, 20)
    }

    /**
     * The per-frame average of the maximum nit values (in units of 0.00001 nit).
     * @type {Integer}
     */
    MaxFrameAverageLightLevel {
        get => NumGet(this, 22, "ushort")
        set => NumPut("ushort", value, this, 22)
    }
}
