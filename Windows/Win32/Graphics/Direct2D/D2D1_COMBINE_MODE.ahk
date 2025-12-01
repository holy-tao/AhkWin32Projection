#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the different methods by which two geometries can be combined.
 * @remarks
 * The following illustration shows the different geometry combine modes.
 * 
 * 
 * <img alt="Illustration of two geometries and the resulting shapes after various geometry combine modes" src="./images/geometry_combine_modes.png"/>
 * @see https://learn.microsoft.com/windows/win32/api/d2d1/ne-d2d1-d2d1_combine_mode
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_COMBINE_MODE extends Win32Enum{

    /**
     * The two regions are combined by taking the union of both. Given two geometries, <i>A</i> and <i>B</i>, the resulting geometry is geometry <i>A</i> + geometry <i>B</i>.
     * @type {Integer (Int32)}
     */
    static D2D1_COMBINE_MODE_UNION => 0

    /**
     * The two regions are combined by taking their intersection. The new area consists of the overlapping region between the two geometries.
     * @type {Integer (Int32)}
     */
    static D2D1_COMBINE_MODE_INTERSECT => 1

    /**
     * The two regions are combined by taking the area that exists in the first region but not the second and the area that exists in the second region but not the first. Given two geometries, <i>A</i> and <i>B</i>, the new region consists of (<i>A</i>-<i>B</i>) + (<i>B</i>-<i>A</i>).
     * @type {Integer (Int32)}
     */
    static D2D1_COMBINE_MODE_XOR => 2

    /**
     * The second region is excluded from the first. Given two geometries, <i>A</i> and <i>B</i>, the area of geometry <i>B</i> is removed from the area of geometry <i>A</i>, producing a region that is <i>A</i>-<i>B</i>.
     * @type {Integer (Int32)}
     */
    static D2D1_COMBINE_MODE_EXCLUDE => 3
}
