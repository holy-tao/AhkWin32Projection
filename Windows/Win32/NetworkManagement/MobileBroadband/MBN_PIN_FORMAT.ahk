#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The MBN_PIN_FORMAT enumerated type indicates whether a PIN is numeric or alphanumeric.
 * @see https://learn.microsoft.com/windows/win32/api/mbnapi/ne-mbnapi-mbn_pin_format
 * @namespace Windows.Win32.NetworkManagement.MobileBroadband
 * @version v4.0.30319
 */
class MBN_PIN_FORMAT extends Win32Enum{

    /**
     * Indicates that the PIN format is not known.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_FORMAT_NONE => 0

    /**
     * Indicates that the PIN is in numeric format.  The only allowed characters are 0-9.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_FORMAT_NUMERIC => 1

    /**
     * Indicates that the PIN is in alphanumeric format.  Allowed characters are a-z, A-Z, 0-9, *, and #.
     * @type {Integer (Int32)}
     */
    static MBN_PIN_FORMAT_ALPHANUMERIC => 2
}
