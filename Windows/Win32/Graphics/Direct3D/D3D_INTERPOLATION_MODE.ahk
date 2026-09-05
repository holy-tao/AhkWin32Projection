#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies interpolation mode, which affects how values are calculated during rasterization.
 * @see https://learn.microsoft.com/windows/win32/api/d3dcommon/ne-d3dcommon-d3d_interpolation_mode
 * @namespace Windows.Win32.Graphics.Direct3D
 */
class D3D_INTERPOLATION_MODE extends Win32Enum {

    /**
     * The interpolation mode is undefined.
     * Native name: D3D_INTERPOLATION_UNDEFINED
     * @type {Integer (Int32)}
     */
    static UNDEFINED => 0

    /**
     * Don't interpolate between register values.
     * Native name: D3D_INTERPOLATION_CONSTANT
     * @type {Integer (Int32)}
     */
    static CONSTANT => 1

    /**
     * Interpolate linearly between register values.
     * Native name: D3D_INTERPOLATION_LINEAR
     * @type {Integer (Int32)}
     */
    static LINEAR => 2

    /**
     * Interpolate linearly between register values but centroid clamped when multisampling.
     * Native name: D3D_INTERPOLATION_LINEAR_CENTROID
     * @type {Integer (Int32)}
     */
    static LINEAR_CENTROID => 3

    /**
     * Interpolate linearly between register values but with no perspective correction.
     * Native name: D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE
     * @type {Integer (Int32)}
     */
    static LINEAR_NOPERSPECTIVE => 4

    /**
     * Interpolate linearly between register values but with no perspective correction and centroid clamped when multisampling.
     * Native name: D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE_CENTROID
     * @type {Integer (Int32)}
     */
    static LINEAR_NOPERSPECTIVE_CENTROID => 5

    /**
     * Interpolate linearly between register values but sample clamped when multisampling.
     * Native name: D3D_INTERPOLATION_LINEAR_SAMPLE
     * @type {Integer (Int32)}
     */
    static LINEAR_SAMPLE => 6

    /**
     * Interpolate linearly between register values but with no perspective correction and sample clamped when multisampling.
     * Native name: D3D_INTERPOLATION_LINEAR_NOPERSPECTIVE_SAMPLE
     * @type {Integer (Int32)}
     */
    static LINEAR_NOPERSPECTIVE_SAMPLE => 7
}
