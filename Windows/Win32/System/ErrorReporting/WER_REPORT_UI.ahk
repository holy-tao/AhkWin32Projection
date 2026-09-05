#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_REPORT_UI extends Win32Enum {

    /**
     * Native name: WerUIAdditionalDataDlgHeader
     * @type {Integer (Int32)}
     */
    static AdditionalDataDlgHeader => 1

    /**
     * Native name: WerUIIconFilePath
     * @type {Integer (Int32)}
     */
    static IconFilePath => 2

    /**
     * Native name: WerUIConsentDlgHeader
     * @type {Integer (Int32)}
     */
    static ConsentDlgHeader => 3

    /**
     * Native name: WerUIConsentDlgBody
     * @type {Integer (Int32)}
     */
    static ConsentDlgBody => 4

    /**
     * Native name: WerUIOnlineSolutionCheckText
     * @type {Integer (Int32)}
     */
    static OnlineSolutionCheckText => 5

    /**
     * Native name: WerUIOfflineSolutionCheckText
     * @type {Integer (Int32)}
     */
    static OfflineSolutionCheckText => 6

    /**
     * Native name: WerUICloseText
     * @type {Integer (Int32)}
     */
    static CloseText => 7

    /**
     * Native name: WerUICloseDlgHeader
     * @type {Integer (Int32)}
     */
    static CloseDlgHeader => 8

    /**
     * Native name: WerUICloseDlgBody
     * @type {Integer (Int32)}
     */
    static CloseDlgBody => 9

    /**
     * Native name: WerUICloseDlgButtonText
     * @type {Integer (Int32)}
     */
    static CloseDlgButtonText => 10

    /**
     * Native name: WerUIMax
     * @type {Integer (Int32)}
     */
    static Max => 11
}
