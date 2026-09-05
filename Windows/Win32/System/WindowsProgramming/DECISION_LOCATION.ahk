#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
class DECISION_LOCATION extends Win32Enum {

    /**
     * Native name: DECISION_LOCATION_REFRESH_GLOBAL_DATA
     * @type {Integer (Int32)}
     */
    static REFRESH_GLOBAL_DATA => 0

    /**
     * Native name: DECISION_LOCATION_PARAMETER_VALIDATION
     * @type {Integer (Int32)}
     */
    static PARAMETER_VALIDATION => 1

    /**
     * Native name: DECISION_LOCATION_AUDIT
     * @type {Integer (Int32)}
     */
    static AUDIT => 2

    /**
     * Native name: DECISION_LOCATION_FAILED_CONVERT_GUID
     * @type {Integer (Int32)}
     */
    static FAILED_CONVERT_GUID => 3

    /**
     * Native name: DECISION_LOCATION_ENTERPRISE_DEFINED_CLASS_ID
     * @type {Integer (Int32)}
     */
    static ENTERPRISE_DEFINED_CLASS_ID => 4

    /**
     * Native name: DECISION_LOCATION_GLOBAL_BUILT_IN_LIST
     * @type {Integer (Int32)}
     */
    static GLOBAL_BUILT_IN_LIST => 5

    /**
     * Native name: DECISION_LOCATION_PROVIDER_BUILT_IN_LIST
     * @type {Integer (Int32)}
     */
    static PROVIDER_BUILT_IN_LIST => 6

    /**
     * Native name: DECISION_LOCATION_ENFORCE_STATE_LIST
     * @type {Integer (Int32)}
     */
    static ENFORCE_STATE_LIST => 7

    /**
     * Native name: DECISION_LOCATION_NOT_FOUND
     * @type {Integer (Int32)}
     */
    static NOT_FOUND => 8

    /**
     * Native name: DECISION_LOCATION_UNKNOWN
     * @type {Integer (Int32)}
     */
    static UNKNOWN => 9
}
