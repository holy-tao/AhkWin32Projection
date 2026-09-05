#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DRMENCODINGTYPE enumeration identifies possible encoding types used in licenses.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmencodingtype
 * @namespace Windows.Win32.Data.RightsManagement
 */
class DRMENCODINGTYPE extends Win32Enum {

    /**
     * Base 64 encoded value.
     * Native name: DRMENCODINGTYPE_BASE64
     * @type {Integer (Int32)}
     */
    static BASE64 => 0

    /**
     * String value.
     * Native name: DRMENCODINGTYPE_STRING
     * @type {Integer (Int32)}
     */
    static STRING => 1

    /**
     * Long value.
     * Native name: DRMENCODINGTYPE_LONG
     * @type {Integer (Int32)}
     */
    static LONG => 2

    /**
     * Time value.
     * Native name: DRMENCODINGTYPE_TIME
     * @type {Integer (Int32)}
     */
    static TIME => 3

    /**
     * Unsigned integer.
     * Native name: DRMENCODINGTYPE_UINT
     * @type {Integer (Int32)}
     */
    static UINT => 4

    /**
     * Binary data.
     * Native name: DRMENCODINGTYPE_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 5
}
