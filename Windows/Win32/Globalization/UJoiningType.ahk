#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Globalization
 */
class UJoiningType extends Win32Enum {

    /**
     * Native name: U_JT_NON_JOINING
     * @type {Integer (Int32)}
     */
    static JT_NON_JOINING => 0

    /**
     * Native name: U_JT_JOIN_CAUSING
     * @type {Integer (Int32)}
     */
    static JT_JOIN_CAUSING => 1

    /**
     * Native name: U_JT_DUAL_JOINING
     * @type {Integer (Int32)}
     */
    static JT_DUAL_JOINING => 2

    /**
     * Native name: U_JT_LEFT_JOINING
     * @type {Integer (Int32)}
     */
    static JT_LEFT_JOINING => 3

    /**
     * Native name: U_JT_RIGHT_JOINING
     * @type {Integer (Int32)}
     */
    static JT_RIGHT_JOINING => 4

    /**
     * Native name: U_JT_TRANSPARENT
     * @type {Integer (Int32)}
     */
    static JT_TRANSPARENT => 5
}
