#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the indices of the system properties present on the ID2D1Properties interface for an ID2D1Effect.
 * @remarks
 * 
 * Under normal circumstances the minimum and maximum number of inputs to the effect are the same. If the effect supports a variable number of inputs, the <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nf-d2d1_1-id2d1effect-setinputcount">ID2D1Effect::SetNumberOfInputs</a> method can be used to choose the number that the application will enable.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ne-d2d1_1-d2d1_property
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PROPERTY{

    /**
     * The CLSID of the effect.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_CLSID => -2147483648

    /**
     * The name of the effect.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_DISPLAYNAME => -2147483647

    /**
     * The author of the effect.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_AUTHOR => -2147483646

    /**
     * The category of the effect.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_CATEGORY => -2147483645

    /**
     * The description of the effect.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_DESCRIPTION => -2147483644

    /**
     * The names of the effect's inputs.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_INPUTS => -2147483643

    /**
     * The output of the effect should be cached.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_CACHED => -2147483642

    /**
     * The buffer precision of the effect output.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_PRECISION => -2147483641

    /**
     * The minimum number of inputs supported by the effect.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_MIN_INPUTS => -2147483640

    /**
     * The maximum number of inputs supported by the effect.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_MAX_INPUTS => -2147483639
}
