#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 */
class JET_RELOP extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopEquals => 0

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopPrefixEquals => 1

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopNotEquals => 2

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopLessThanOrEqual => 3

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopLessThan => 4

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopGreaterThanOrEqual => 5

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopGreaterThan => 6

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopBitmaskEqualsZero => 7

    /**
     * @type {Integer (Int32)}
     */
    static JET_relopBitmaskNotEqualsZero => 8
}
