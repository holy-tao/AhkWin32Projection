#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.WinRT.Metadata
 * @version v4.0.30319
 */
class CorErrorIfEmitOutOfOrder{

    /**
     * @type {Integer (Int32)}
     */
    static MDErrorOutOfOrderDefault => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDErrorOutOfOrderNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static MDErrorOutOfOrderAll => -1

    /**
     * @type {Integer (Int32)}
     */
    static MDMethodOutOfOrder => 1

    /**
     * @type {Integer (Int32)}
     */
    static MDFieldOutOfOrder => 2

    /**
     * @type {Integer (Int32)}
     */
    static MDParamOutOfOrder => 4

    /**
     * @type {Integer (Int32)}
     */
    static MDPropertyOutOfOrder => 8

    /**
     * @type {Integer (Int32)}
     */
    static MDEventOutOfOrder => 16
}
