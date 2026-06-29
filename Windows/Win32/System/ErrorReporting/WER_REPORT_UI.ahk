#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
export default struct WER_REPORT_UI {
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
    static WerUIAdditionalDataDlgHeader => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerUIIconFilePath => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerUIConsentDlgHeader => 3

    /**
     * @type {Integer (Int32)}
     */
    static WerUIConsentDlgBody => 4

    /**
     * @type {Integer (Int32)}
     */
    static WerUIOnlineSolutionCheckText => 5

    /**
     * @type {Integer (Int32)}
     */
    static WerUIOfflineSolutionCheckText => 6

    /**
     * @type {Integer (Int32)}
     */
    static WerUICloseText => 7

    /**
     * @type {Integer (Int32)}
     */
    static WerUICloseDlgHeader => 8

    /**
     * @type {Integer (Int32)}
     */
    static WerUICloseDlgBody => 9

    /**
     * @type {Integer (Int32)}
     */
    static WerUICloseDlgButtonText => 10

    /**
     * @type {Integer (Int32)}
     */
    static WerUIMax => 11
}
