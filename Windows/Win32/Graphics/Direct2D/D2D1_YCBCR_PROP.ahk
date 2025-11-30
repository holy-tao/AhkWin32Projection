#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Identifiers for properties of the YCbCr effect.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1effects_1/ne-d2d1effects_1-d2d1_ycbcr_prop
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_YCBCR_PROP extends Win32Enum{

    /**
     * Specifies the chroma subsampling of the input chroma image.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_1/ne-d2d1effects_1-d2d1_ycbcr_chroma_subsampling">D2D1_YCBCR_CHROMA_SUBSAMPLING</a>.
     * 
     * The default value is D2D1_YCBCR_CHROMA_SUBSAMPLING_AUTO.
     * @type {Integer (Int32)}
     */
    static D2D1_YCBCR_PROP_CHROMA_SUBSAMPLING => 0

    /**
     * A 3x2 Matrix specifying the axis-aligned affine transform of the image. Axis aligned transforms include Scale, Flips, and 90 degree rotations.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/Direct2D/d2d1-matrix-3x2-f">D2D1_MATRIX_3X2_F</a>.
     * 
     * The default value is Matrix3x2F::Identity().
     * @type {Integer (Int32)}
     */
    static D2D1_YCBCR_PROP_TRANSFORM_MATRIX => 1

    /**
     * The interpolation mode.
     *             
     * 
     * The type is <a href="https://docs.microsoft.com/windows/desktop/api/d2d1effects_1/ne-d2d1effects_1-d2d1_ycbcr_interpolation_mode">D2D1_YCBCR_INTERPOLATION_MODE</a>.
     * @type {Integer (Int32)}
     */
    static D2D1_YCBCR_PROP_INTERPOLATION_MODE => 2
}
