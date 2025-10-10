#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include Common\D2D_POINT_2F.ahk

/**
 * Simple description of a color space.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_3/ns-d2d1_3-d2d1_simple_color_profile
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_SIMPLE_COLOR_PROFILE extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The XY coordinates of the red primary in CIEXYZ space.
     * @type {D2D_POINT_2F}
     */
    redPrimary{
        get {
            if(!this.HasProp("__redPrimary"))
                this.__redPrimary := D2D_POINT_2F(this.ptr + 0)
            return this.__redPrimary
        }
    }

    /**
     * The XY coordinates of the green primary in CIEXYZ space.
     * @type {D2D_POINT_2F}
     */
    greenPrimary{
        get {
            if(!this.HasProp("__greenPrimary"))
                this.__greenPrimary := D2D_POINT_2F(this.ptr + 8)
            return this.__greenPrimary
        }
    }

    /**
     * The XY coordinates of the blue primary in CIEXYZ space.
     * @type {D2D_POINT_2F}
     */
    bluePrimary{
        get {
            if(!this.HasProp("__bluePrimary"))
                this.__bluePrimary := D2D_POINT_2F(this.ptr + 16)
            return this.__bluePrimary
        }
    }

    /**
     * The X/Z tristimulus values for the whitepoint, normalized for relative luminance.
     * @type {D2D_POINT_2F}
     */
    whitePointXZ{
        get {
            if(!this.HasProp("__whitePointXZ"))
                this.__whitePointXZ := D2D_POINT_2F(this.ptr + 24)
            return this.__whitePointXZ
        }
    }

    /**
     * The gamma encoding to use for this color space.
     * @type {Integer}
     */
    gamma {
        get => NumGet(this, 32, "int")
        set => NumPut("int", value, this, 32)
    }
}
