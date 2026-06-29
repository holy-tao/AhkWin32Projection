#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_SUBMIT_RESULT {
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
    static WerReportQueued => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerReportUploaded => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerReportDebug => 3

    /**
     * @type {Integer (Int32)}
     */
    static WerReportFailed => 4

    /**
     * @type {Integer (Int32)}
     */
    static WerDisabled => 5

    /**
     * @type {Integer (Int32)}
     */
    static WerReportCancelled => 6

    /**
     * @type {Integer (Int32)}
     */
    static WerDisabledQueue => 7

    /**
     * @type {Integer (Int32)}
     */
    static WerReportAsync => 8

    /**
     * @type {Integer (Int32)}
     */
    static WerCustomAction => 9

    /**
     * @type {Integer (Int32)}
     */
    static WerThrottled => 10

    /**
     * @type {Integer (Int32)}
     */
    static WerReportUploadedCab => 11

    /**
     * @type {Integer (Int32)}
     */
    static WerStorageLocationNotFound => 12

    /**
     * @type {Integer (Int32)}
     */
    static WerSubmitResultMax => 13
}
