#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the types of properties supported by the Direct2D property interface.
 * @see https://learn.microsoft.com/windows/win32/api/d2d1_1/ne-d2d1_1-d2d1_property_type
 * @namespace Windows.Win32.Graphics.Direct2D
 */
class D2D1_PROPERTY_TYPE extends Win32Enum {

    /**
     * An unknown property.
     * Native name: D2D1_PROPERTY_TYPE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 0

    /**
     * An arbitrary-length string.
     * Native name: D2D1_PROPERTY_TYPE_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 1

    /**
     * A 32-bit integer value constrained to be either 0 or 1.
     * Native name: D2D1_PROPERTY_TYPE_BOOL
     * @type {Integer (Int32)}
     */
    static BOOL => 2

    /**
     * An unsigned 32-bit integer.
     * Native name: D2D1_PROPERTY_TYPE_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 3

    /**
     * A signed 32-bit integer.
     * Native name: D2D1_PROPERTY_TYPE_INT32
     * @type {Integer (Int32)}
     */
    static INT32 => 4

    /**
     * A 32-bit float.
     * Native name: D2D1_PROPERTY_TYPE_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 5

    /**
     * Two 32-bit float values.
     * Native name: D2D1_PROPERTY_TYPE_VECTOR2
     * @type {Integer (Int32)}
     */
    static VECTOR2 => 6

    /**
     * Three 32-bit float values.
     * Native name: D2D1_PROPERTY_TYPE_VECTOR3
     * @type {Integer (Int32)}
     */
    static VECTOR3 => 7

    /**
     * Four 32-bit float values.
     * Native name: D2D1_PROPERTY_TYPE_VECTOR4
     * @type {Integer (Int32)}
     */
    static VECTOR4 => 8

    /**
     * An arbitrary number of bytes.
     * Native name: D2D1_PROPERTY_TYPE_BLOB
     * @type {Integer (Int32)}
     */
    static BLOB => 9

    /**
     * A returned COM or nano-COM interface.
     * Native name: D2D1_PROPERTY_TYPE_IUNKNOWN
     * @type {Integer (Int32)}
     */
    static IUNKNOWN => 10

    /**
     * An enumeration. The value should be treated as a <b>UINT32</b> with a defined array of fields to specify the bindings to human-readable strings.
     * Native name: D2D1_PROPERTY_TYPE_ENUM
     * @type {Integer (Int32)}
     */
    static ENUM => 11

    /**
     * An enumeration. The value is the count of sub-properties in the array. The set of array elements will be contained in the sub-property.
     * Native name: D2D1_PROPERTY_TYPE_ARRAY
     * @type {Integer (Int32)}
     */
    static ARRAY => 12

    /**
     * A CLSID.
     * Native name: D2D1_PROPERTY_TYPE_CLSID
     * @type {Integer (Int32)}
     */
    static CLSID => 13

    /**
     * A 3x2 matrix of  float values.
     * Native name: D2D1_PROPERTY_TYPE_MATRIX_3X2
     * @type {Integer (Int32)}
     */
    static MATRIX_3X2 => 14

    /**
     * A 4x2 matrix of  float values.
     * Native name: D2D1_PROPERTY_TYPE_MATRIX_4X3
     * @type {Integer (Int32)}
     */
    static MATRIX_4X3 => 15

    /**
     * A 4x4 matrix of  float values.
     * Native name: D2D1_PROPERTY_TYPE_MATRIX_4X4
     * @type {Integer (Int32)}
     */
    static MATRIX_4X4 => 16

    /**
     * A 5x4 matrix of  float values.
     * Native name: D2D1_PROPERTY_TYPE_MATRIX_5X4
     * @type {Integer (Int32)}
     */
    static MATRIX_5X4 => 17

    /**
     * A nano-COM color context interface pointer.
     * Native name: D2D1_PROPERTY_TYPE_COLOR_CONTEXT
     * @type {Integer (Int32)}
     */
    static COLOR_CONTEXT => 18
}
