#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class RTL_GENERIC_COMPARE_RESULTS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static GenericLessThan => 0

    /**
     * @type {Integer (Int32)}
     */
    static GenericGreaterThan => 1

    /**
     * @type {Integer (Int32)}
     */
    static GenericEqual => 2
}
