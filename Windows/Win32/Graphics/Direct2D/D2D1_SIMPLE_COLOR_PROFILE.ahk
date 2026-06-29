#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D2D1_GAMMA1.ahk" { D2D1_GAMMA1 }
#Import "Common\D2D_POINT_2F.ahk" { D2D_POINT_2F }

/**
 * Simple description of a color space.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_3/ns-d2d1_3-d2d1_simple_color_profile
 * @namespace Windows.Win32.Graphics.Direct2D
 */
export default struct D2D1_SIMPLE_COLOR_PROFILE {
    #StructPack 4

    /**
     * The xy coordinates of the red primary in the CIExyY color space.
     */
    redPrimary : D2D_POINT_2F

    /**
     * The xy coordinates of the green primary in the CIExyY color space.
     */
    greenPrimary : D2D_POINT_2F

    /**
     * The xy coordinates of the blue primary in the CIExyY color space.
     */
    bluePrimary : D2D_POINT_2F

    /**
     * The XZ tristimulus values for the whitepoint in the CIEXYZ color space, normalized to luminance (Y) of 1.
     */
    whitePointXZ : D2D_POINT_2F

    /**
     * The gamma encoding to use for this color space.
     */
    gamma : D2D1_GAMMA1

}
