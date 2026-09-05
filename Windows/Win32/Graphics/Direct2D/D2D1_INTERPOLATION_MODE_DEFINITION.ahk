#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_INTERPOLATION_MODE_DEFINITION extends Win32Enum {

    /**
     * Native name: D2D1_INTERPOLATION_MODE_DEFINITION_NEAREST_NEIGHBOR
     * @type {Integer (Int32)}
     */
    static NEAREST_NEIGHBOR => 0

    /**
     * Native name: D2D1_INTERPOLATION_MODE_DEFINITION_LINEAR
     * @type {Integer (Int32)}
     */
    static LINEAR => 1

    /**
     * Native name: D2D1_INTERPOLATION_MODE_DEFINITION_CUBIC
     * @type {Integer (Int32)}
     */
    static CUBIC => 2

    /**
     * Native name: D2D1_INTERPOLATION_MODE_DEFINITION_MULTI_SAMPLE_LINEAR
     * @type {Integer (Int32)}
     */
    static MULTI_SAMPLE_LINEAR => 3

    /**
     * Native name: D2D1_INTERPOLATION_MODE_DEFINITION_ANISOTROPIC
     * @type {Integer (Int32)}
     */
    static ANISOTROPIC => 4

    /**
     * Native name: D2D1_INTERPOLATION_MODE_DEFINITION_HIGH_QUALITY_CUBIC
     * @type {Integer (Int32)}
     */
    static HIGH_QUALITY_CUBIC => 5

    /**
     * Native name: D2D1_INTERPOLATION_MODE_DEFINITION_FANT
     * @type {Integer (Int32)}
     */
    static FANT => 6

    /**
     * Native name: D2D1_INTERPOLATION_MODE_DEFINITION_MIPMAP_LINEAR
     * @type {Integer (Int32)}
     */
    static MIPMAP_LINEAR => 7
}
