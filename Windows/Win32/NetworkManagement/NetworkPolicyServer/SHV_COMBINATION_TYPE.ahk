#Requires AutoHotkey v2.0.0 64-bit

/**
 * The SHV_COMBINATION_TYPE enumeration type specifies the type of a System Health Validator (SHV) combination.
 * @see https://docs.microsoft.com/windows/win32/api//sdoias/ne-sdoias-shv_combination_type
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class SHV_COMBINATION_TYPE{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SHV_COMBINATION_TYPE_ALL_PASS => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SHV_COMBINATION_TYPE_ALL_FAIL => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SHV_COMBINATION_TYPE_ONE_OR_MORE_PASS => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SHV_COMBINATION_TYPE_ONE_OR_MORE_FAIL => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SHV_COMBINATION_TYPE_ONE_OR_MORE_INFECTED => 4

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SHV_COMBINATION_TYPE_ONE_OR_MORE_TRANSITIONAL => 5

    /**
     * 
     * @type {Integer (Int32)}
     */
    static SHV_COMBINATION_TYPE_ONE_OR_MORE_UNKNOWN => 6

    /**
     * Use this constant to test whether the value is in range.
     * @type {Integer (Int32)}
     */
    static SHV_COMBINATION_TYPE_MAX => 7
}
