#Requires AutoHotkey v2.0.0 64-bit

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/tdh/ne-tdh-payload_operator
 * @namespace Windows.Win32.System.Diagnostics.Etw
 * @version v4.0.30319
 */
class PAYLOAD_OPERATOR{

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_EQ => 0

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_NE => 1

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_LE => 2

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_GT => 3

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_LT => 4

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_GE => 5

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_BETWEEN => 6

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_NOTBETWEEN => 7

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_MODULO => 8

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_CONTAINS => 20

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_DOESNTCONTAIN => 21

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_IS => 30

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_ISNOT => 31

    /**
     * @type {Integer (Int32)}
     */
    static PAYLOADFIELD_INVALID => 32
}
