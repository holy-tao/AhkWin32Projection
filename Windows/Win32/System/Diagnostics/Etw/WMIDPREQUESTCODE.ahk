#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Diagnostics.Etw
 */
export default struct WMIDPREQUESTCODE {
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
    static WMI_GET_ALL_DATA => 0

    /**
     * @type {Integer (Int32)}
     */
    static WMI_GET_SINGLE_INSTANCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static WMI_SET_SINGLE_INSTANCE => 2

    /**
     * @type {Integer (Int32)}
     */
    static WMI_SET_SINGLE_ITEM => 3

    /**
     * @type {Integer (Int32)}
     */
    static WMI_ENABLE_EVENTS => 4

    /**
     * @type {Integer (Int32)}
     */
    static WMI_DISABLE_EVENTS => 5

    /**
     * @type {Integer (Int32)}
     */
    static WMI_ENABLE_COLLECTION => 6

    /**
     * @type {Integer (Int32)}
     */
    static WMI_DISABLE_COLLECTION => 7

    /**
     * @type {Integer (Int32)}
     */
    static WMI_REGINFO => 8

    /**
     * @type {Integer (Int32)}
     */
    static WMI_EXECUTE_METHOD => 9

    /**
     * @type {Integer (Int32)}
     */
    static WMI_CAPTURE_STATE => 10
}
