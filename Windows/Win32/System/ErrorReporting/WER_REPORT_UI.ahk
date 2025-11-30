#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REPORT_UI extends Win32Enum{

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
