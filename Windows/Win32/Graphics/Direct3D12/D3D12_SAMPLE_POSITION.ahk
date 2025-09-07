#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Describes a sub-pixel sample position for use with programmable sample positions.
 * @remarks
 * Sample positions have the origin (0, 0) at the pixel center. Each of the X and Y coordinates are signed values in the range -8 (top/left) to 7 (bottom/right). Values outside this range are invalid.
  * 
  * Each increment of these integer values represents 1/16th of a pixel. For example, X and Y values of -8 and 4, respectively, correspond to floating-point values of -0.5 and 0.25, a point located on the left-most edge of the pixel, half-way between its center-line and the bottom edge. Because of this, the bottom-most and right-most edge of a pixel are not reachable by sampling (these positions are reachable as the top-most and left-most edges of the neighboring pixels).
 * @see https://learn.microsoft.com/windows/win32/api/d3d12/ns-d3d12-d3d12_sample_position
 * @namespace Windows.Win32.Graphics.Direct3D12
 * @version v4.0.30319
 */
class D3D12_SAMPLE_POSITION extends Win32Struct
{
    static sizeof => 2

    static packingSize => 1

    /**
     * A signed sub-pixel coordinate value in the X axis.
     * @type {Integer}
     */
    X {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }

    /**
     * A signed sub-pixel coordinate value in the Y axis.
     * @type {Integer}
     */
    Y {
        get => NumGet(this, 1, "char")
        set => NumPut("char", value, this, 1)
    }
}
