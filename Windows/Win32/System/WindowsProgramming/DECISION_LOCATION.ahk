#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.WindowsProgramming
 */
export default struct DECISION_LOCATION {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
