#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The SHV_COMBINATION_TYPE enumeration type specifies the type of a System Health Validator (SHV) combination.
 * @see https://learn.microsoft.com/windows/win32/api/sdoias/ne-sdoias-shv_combination_type
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 */
class SHV_COMBINATION_TYPE extends Win32Enum {

    /**
     * Native name: SHV_COMBINATION_TYPE_ALL_PASS
     * @type {Integer (Int32)}
     */
    static ALL_PASS => 0

    /**
     * Native name: SHV_COMBINATION_TYPE_ALL_FAIL
     * @type {Integer (Int32)}
     */
    static ALL_FAIL => 1

    /**
     * Native name: SHV_COMBINATION_TYPE_ONE_OR_MORE_PASS
     * @type {Integer (Int32)}
     */
    static ONE_OR_MORE_PASS => 2

    /**
     * Native name: SHV_COMBINATION_TYPE_ONE_OR_MORE_FAIL
     * @type {Integer (Int32)}
     */
    static ONE_OR_MORE_FAIL => 3

    /**
     * Native name: SHV_COMBINATION_TYPE_ONE_OR_MORE_INFECTED
     * @type {Integer (Int32)}
     */
    static ONE_OR_MORE_INFECTED => 4

    /**
     * Native name: SHV_COMBINATION_TYPE_ONE_OR_MORE_TRANSITIONAL
     * @type {Integer (Int32)}
     */
    static ONE_OR_MORE_TRANSITIONAL => 5

    /**
     * Native name: SHV_COMBINATION_TYPE_ONE_OR_MORE_UNKNOWN
     * @type {Integer (Int32)}
     */
    static ONE_OR_MORE_UNKNOWN => 6

    /**
     * Use this constant to test whether the value is in range.
     * Native name: SHV_COMBINATION_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 7
}
