#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Represents filtering modes that a transform may select to use on input textures.
 * @remarks
 * This enumeration has the same numeric values as <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_filter">D3D11_FILTER</a>.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1effectauthor/ne-d2d1effectauthor-d2d1_filter
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_FILTER extends Win32Enum{

    /**
     * Use point sampling for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_MIN_MAG_MIP_POINT => 0

    /**
     * Use point sampling for minification and magnification; use linear interpolation for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_MIN_MAG_POINT_MIP_LINEAR => 1

    /**
     * Use point sampling for minification; use linear interpolation for magnification; use point sampling for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_MIN_POINT_MAG_LINEAR_MIP_POINT => 4

    /**
     * Use point sampling for minification; use linear interpolation for magnification and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_MIN_POINT_MAG_MIP_LINEAR => 5

    /**
     * Use linear interpolation for minification; use point sampling for magnification and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_MIN_LINEAR_MAG_MIP_POINT => 16

    /**
     * Use linear interpolation for minification; use point sampling for magnification; use linear interpolation for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_MIN_LINEAR_MAG_POINT_MIP_LINEAR => 17

    /**
     * Use linear interpolation for minification and magnification; use point sampling for mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_MIN_MAG_LINEAR_MIP_POINT => 20

    /**
     * Use linear interpolation for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_MIN_MAG_MIP_LINEAR => 21

    /**
     * Use anisotropic interpolation for minification, magnification, and mip-level sampling.
     * @type {Integer (Int32)}
     */
    static D2D1_FILTER_ANISOTROPIC => 85
}
