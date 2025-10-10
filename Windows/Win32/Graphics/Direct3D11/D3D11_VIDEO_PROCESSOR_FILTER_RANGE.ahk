#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines the range of supported values for an image filter.
 * @remarks
 * 
  * The multiplier enables the filter range to have a fractional step value.
  * 
  * For example, a hue filter might have an actual range of [–180.0 ... +180.0] with a step size of 0.25. The device would report the following range and multiplier:
  * 
  * <ul>
  * <li>Minimum: –720</li>
  * <li>Maximum: +720</li>
  * <li>Multiplier: 0.25</li>
  * </ul>
  * In this case,  a filter value of 2 would be interpreted by the device as 0.50 (or 2 × 0.25).
  * 
  * The device should use  a multiplier that can be represented exactly as a base-2 fraction.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_video_processor_filter_range
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_PROCESSOR_FILTER_RANGE extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * The minimum value of the filter.
     * @type {Integer}
     */
    Minimum {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The maximum value of the filter.
     * @type {Integer}
     */
    Maximum {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The default value of the filter.
     * @type {Integer}
     */
    Default {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * A multiplier. Use the following formula to translate the filter setting into the actual filter value: <i>Actual Value</i> = <i>Set Value</i> × <i>Multiplier</i>.
     * @type {Float}
     */
    Multiplier {
        get => NumGet(this, 12, "float")
        set => NumPut("float", value, this, 12)
    }
}
