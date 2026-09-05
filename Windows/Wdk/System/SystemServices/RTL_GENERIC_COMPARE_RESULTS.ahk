#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class RTL_GENERIC_COMPARE_RESULTS extends Win32Enum {

    /**
     * Native name: GenericLessThan
     * @type {Integer (Int32)}
     */
    static LessThan => 0

    /**
     * Native name: GenericGreaterThan
     * @type {Integer (Int32)}
     */
    static GreaterThan => 1

    /**
     * Native name: GenericEqual
     * @type {Integer (Int32)}
     */
    static Equal => 2
}
