#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_CONSENT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WerConsentNotAsked => 1

    /**
     * @type {Integer (Int32)}
     */
    static WerConsentApproved => 2

    /**
     * @type {Integer (Int32)}
     */
    static WerConsentDenied => 3

    /**
     * @type {Integer (Int32)}
     */
    static WerConsentAlwaysPrompt => 4

    /**
     * @type {Integer (Int32)}
     */
    static WerConsentMax => 5
}
