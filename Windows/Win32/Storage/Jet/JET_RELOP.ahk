#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 */
class JET_RELOP extends Win32Enum {

    /**
     * Native name: JET_relopEquals
     * @type {Integer (Int32)}
     */
    static Equals => 0

    /**
     * Native name: JET_relopPrefixEquals
     * @type {Integer (Int32)}
     */
    static PrefixEquals => 1

    /**
     * Native name: JET_relopNotEquals
     * @type {Integer (Int32)}
     */
    static NotEquals => 2

    /**
     * Native name: JET_relopLessThanOrEqual
     * @type {Integer (Int32)}
     */
    static LessThanOrEqual => 3

    /**
     * Native name: JET_relopLessThan
     * @type {Integer (Int32)}
     */
    static LessThan => 4

    /**
     * Native name: JET_relopGreaterThanOrEqual
     * @type {Integer (Int32)}
     */
    static GreaterThanOrEqual => 5

    /**
     * Native name: JET_relopGreaterThan
     * @type {Integer (Int32)}
     */
    static GreaterThan => 6

    /**
     * Native name: JET_relopBitmaskEqualsZero
     * @type {Integer (Int32)}
     */
    static BitmaskEqualsZero => 7

    /**
     * Native name: JET_relopBitmaskNotEqualsZero
     * @type {Integer (Int32)}
     */
    static BitmaskNotEqualsZero => 8
}
