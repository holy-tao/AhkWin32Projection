#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class DISPID_SpeechRecoResult extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRRecoContext => 1

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRTimes => 2

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRAudioFormat => 3

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRPhraseInfo => 4

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRAlternates => 5

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRAudio => 6

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRSpeakAudio => 7

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRSaveToMemory => 8

    /**
     * @type {Integer (Int32)}
     */
    static DISPID_SRRDiscardResultInfo => 9
}
