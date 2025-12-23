#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_INTERPOLATION_MODE_DEFINITION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR => 0

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR => 1

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_CUBIC => 2

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_MULTI_SAMPLE_LINEAR => 3

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_ANISOTROPIC => 4

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_HIGH_QUALITY_CUBIC => 5

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_FANT => 6

    /**
     * @type {Integer (Int32)}
     */
    static D2D1_INTERPOLATION_MODE_DEFINITION_MIPMAP_LINEAR => 7
}
