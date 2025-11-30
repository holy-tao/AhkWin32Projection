#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 * @version v4.0.30319
 */
class DECISION_LOCATION extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_REFRESH_GLOBAL_DATA => 0

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_PARAMETER_VALIDATION => 1

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_AUDIT => 2

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_FAILED_CONVERT_GUID => 3

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_ENTERPRISE_DEFINED_CLASS_ID => 4

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_GLOBAL_BUILT_IN_LIST => 5

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_PROVIDER_BUILT_IN_LIST => 6

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_ENFORCE_STATE_LIST => 7

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_NOT_FOUND => 8

    /**
     * @type {Integer (Int32)}
     */
    static DECISION_LOCATION_UNKNOWN => 9
}
