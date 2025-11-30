#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Values that indicate the minimum desired interpolation precision.
 * @remarks
 * 
 * For more info, see <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/dx-graphics-hlsl-scalar">Scalar Types</a> and <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/using-hlsl-minimum-precision">Using HLSL minimum precision</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3dcommon/ne-d3dcommon-d3d_min_precision
 * @namespace Windows.Win32.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3D_MIN_PRECISION extends Win32Enum{

    /**
     * Default minimum precision, which is 32-bit precision.
     * @type {Integer (Int32)}
     */
    static D3D_MIN_PRECISION_DEFAULT => 0

    /**
     * Minimum precision is min16float, which is 16-bit floating point.
     * @type {Integer (Int32)}
     */
    static D3D_MIN_PRECISION_FLOAT_16 => 1

    /**
     * Minimum precision is min10float, which is 10-bit floating point.
     * @type {Integer (Int32)}
     */
    static D3D_MIN_PRECISION_FLOAT_2_8 => 2

    /**
     * Reserved
     * @type {Integer (Int32)}
     */
    static D3D_MIN_PRECISION_RESERVED => 3

    /**
     * Minimum precision is min16int, which is 16-bit signed integer.
     * @type {Integer (Int32)}
     */
    static D3D_MIN_PRECISION_SINT_16 => 4

    /**
     * Minimum precision is min16uint, which is 16-bit unsigned integer.
     * @type {Integer (Int32)}
     */
    static D3D_MIN_PRECISION_UINT_16 => 5

    /**
     * Minimum precision is any 16-bit value.
     * @type {Integer (Int32)}
     */
    static D3D_MIN_PRECISION_ANY_16 => 240

    /**
     * Minimum precision is any 10-bit value.
     * @type {Integer (Int32)}
     */
    static D3D_MIN_PRECISION_ANY_10 => 241
}
