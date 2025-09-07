#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DRMENCODINGTYPE enumeration identifies possible encoding types used in licenses.
 * @see https://learn.microsoft.com/windows/win32/api/msdrmdefs/ne-msdrmdefs-drmencodingtype
 * @namespace Windows.Win32.Data.RightsManagement
 * @version v4.0.30319
 */
class DRMENCODINGTYPE{

    /**
     * Base 64 encoded value.
     * @type {Integer (Int32)}
     */
    static DRMENCODINGTYPE_BASE64 => 0

    /**
     * String value.
     * @type {Integer (Int32)}
     */
    static DRMENCODINGTYPE_STRING => 1

    /**
     * Long value.
     * @type {Integer (Int32)}
     */
    static DRMENCODINGTYPE_LONG => 2

    /**
     * Time value.
     * @type {Integer (Int32)}
     */
    static DRMENCODINGTYPE_TIME => 3

    /**
     * Unsigned integer.
     * @type {Integer (Int32)}
     */
    static DRMENCODINGTYPE_UINT => 4

    /**
     * Binary data.
     * @type {Integer (Int32)}
     */
    static DRMENCODINGTYPE_RAW => 5
}
