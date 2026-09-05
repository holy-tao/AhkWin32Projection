#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 */
class WER_CONSENT extends Win32Enum {

    /**
     * Native name: WerConsentNotAsked
     * @type {Integer (Int32)}
     */
    static NotAsked => 1

    /**
     * Native name: WerConsentApproved
     * @type {Integer (Int32)}
     */
    static Approved => 2

    /**
     * Native name: WerConsentDenied
     * @type {Integer (Int32)}
     */
    static Denied => 3

    /**
     * Native name: WerConsentAlwaysPrompt
     * @type {Integer (Int32)}
     */
    static AlwaysPrompt => 4

    /**
     * Native name: WerConsentMax
     * @type {Integer (Int32)}
     */
    static Max => 5
}
