#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of properties supported by the Direct2D property interface.
 * @see https://docs.microsoft.com/windows/win32/api//d2d1_1/ne-d2d1_1-d2d1_property_type
 * @namespace Windows.Win32.Graphics.Direct2D
 * @version v4.0.30319
 */
class D2D1_PROPERTY_TYPE{

    /**
     * An unknown property.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_UNKNOWN => 0

    /**
     * An arbitrary-length string.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_STRING => 1

    /**
     * A 32-bit integer value constrained to be either 0 or 1.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_BOOL => 2

    /**
     * An unsigned 32-bit integer.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_UINT32 => 3

    /**
     * A signed 32-bit integer.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_INT32 => 4

    /**
     * A 32-bit float.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_FLOAT => 5

    /**
     * Two 32-bit float values.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_VECTOR2 => 6

    /**
     * Three 32-bit float values.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_VECTOR3 => 7

    /**
     * Four 32-bit float values.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_VECTOR4 => 8

    /**
     * An arbitrary number of bytes.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_BLOB => 9

    /**
     * A returned COM or nano-COM interface.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_IUNKNOWN => 10

    /**
     * An enumeration. The value should be treated as a <b>UINT32</b> with a defined array of fields to specify the bindings to human-readable strings.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_ENUM => 11

    /**
     * An enumeration. The value is the count of sub-properties in the array. The set of array elements will be contained in the sub-property.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_ARRAY => 12

    /**
     * A CLSID.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_CLSID => 13

    /**
     * A 3x2 matrix of  float values.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_MATRIX_3X2 => 14

    /**
     * A 4x2 matrix of  float values.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_MATRIX_4X3 => 15

    /**
     * A 4x4 matrix of  float values.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_MATRIX_4X4 => 16

    /**
     * A 5x4 matrix of  float values.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_MATRIX_5X4 => 17

    /**
     * A nano-COM color context interface pointer.
     * @type {Integer (Int32)}
     */
    static D2D1_PROPERTY_TYPE_COLOR_CONTEXT => 18
}
