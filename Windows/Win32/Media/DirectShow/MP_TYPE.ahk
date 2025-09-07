#Requires AutoHotkey v2.0.0 64-bit

/**
 * The MP_TYPE enumeration specifies the data type for a parameter.
 * @remarks
 * To reduce type conversions at run time, all parameters have 32-bit float values, defined as type <b>MP_DATA</b>. The members of this enumeration specify how a given parameter should be interpreted.
 * @see https://learn.microsoft.com/windows/win32/api/medparam/ne-medparam-mp_type
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class MP_TYPE{

    /**
     * Value is a signed 32-bit integer.
     * @type {Integer (Int32)}
     */
    static MPT_INT => 0

    /**
     * Value is a 32-bit IEEE floating-point value.
     * @type {Integer (Int32)}
     */
    static MPT_FLOAT => 1

    /**
     * Value is Boolean. Use the following constants for Boolean parameters:
     * @type {Integer (Int32)}
     */
    static MPT_BOOL => 2

    /**
     * Value is taken from a set of consecutive integers.
     * @type {Integer (Int32)}
     */
    static MPT_ENUM => 3

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static MPT_MAX => 4
}
