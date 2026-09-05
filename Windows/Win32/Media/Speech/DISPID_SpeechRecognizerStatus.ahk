#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 */
class DISPID_SpeechRecognizerStatus extends Win32Enum {

    /**
     * Native name: DISPID_SRSAudioStatus
     * @type {Integer (Int32)}
     */
    static SRSAudioStatus => 1

    /**
     * Native name: DISPID_SRSCurrentStreamPosition
     * @type {Integer (Int32)}
     */
    static SRSCurrentStreamPosition => 2

    /**
     * Native name: DISPID_SRSCurrentStreamNumber
     * @type {Integer (Int32)}
     */
    static SRSCurrentStreamNumber => 3

    /**
     * Native name: DISPID_SRSNumberOfActiveRules
     * @type {Integer (Int32)}
     */
    static SRSNumberOfActiveRules => 4

    /**
     * Native name: DISPID_SRSClsidEngine
     * @type {Integer (Int32)}
     */
    static SRSClsidEngine => 5

    /**
     * Native name: DISPID_SRSSupportedLanguages
     * @type {Integer (Int32)}
     */
    static SRSSupportedLanguages => 6
}
