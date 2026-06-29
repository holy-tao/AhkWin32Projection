#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_REPORT_TYPE {
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
    static WerReportNonCritical => 0

    /**
     * @type {Integer (Int32)}
     */
    static WerReportCritical => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerReportApplicationCrash => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerReportApplicationHang => 3

    /**
     * @type {Integer (Int32)}
     */
    static WerReportKernel => 4

    /**
     * @type {Integer (Int32)}
     */
    static WerReportInvalid => 5
}
