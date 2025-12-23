#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechRecognitionType extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SRTStandard => 0

    /**
     * @type {Integer (Int32)}
     */
    static SRTAutopause => 1

    /**
     * @type {Integer (Int32)}
     */
    static SRTEmulated => 2

    /**
     * @type {Integer (Int32)}
     */
    static SRTSMLTimeout => 4

    /**
     * @type {Integer (Int32)}
     */
    static SRTExtendableParse => 8

    /**
     * @type {Integer (Int32)}
     */
    static SRTReSent => 16
}
