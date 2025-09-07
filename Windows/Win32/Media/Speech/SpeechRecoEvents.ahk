#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SpeechRecoEvents{

    /**
     * @type {Integer (Int32)}
     */
    static SREStreamEnd => 1

    /**
     * @type {Integer (Int32)}
     */
    static SRESoundStart => 2

    /**
     * @type {Integer (Int32)}
     */
    static SRESoundEnd => 4

    /**
     * @type {Integer (Int32)}
     */
    static SREPhraseStart => 8

    /**
     * @type {Integer (Int32)}
     */
    static SRERecognition => 16

    /**
     * @type {Integer (Int32)}
     */
    static SREHypothesis => 32

    /**
     * @type {Integer (Int32)}
     */
    static SREBookmark => 64

    /**
     * @type {Integer (Int32)}
     */
    static SREPropertyNumChange => 128

    /**
     * @type {Integer (Int32)}
     */
    static SREPropertyStringChange => 256

    /**
     * @type {Integer (Int32)}
     */
    static SREFalseRecognition => 512

    /**
     * @type {Integer (Int32)}
     */
    static SREInterference => 1024

    /**
     * @type {Integer (Int32)}
     */
    static SRERequestUI => 2048

    /**
     * @type {Integer (Int32)}
     */
    static SREStateChange => 4096

    /**
     * @type {Integer (Int32)}
     */
    static SREAdaptation => 8192

    /**
     * @type {Integer (Int32)}
     */
    static SREStreamStart => 16384

    /**
     * @type {Integer (Int32)}
     */
    static SRERecoOtherContext => 32768

    /**
     * @type {Integer (Int32)}
     */
    static SREAudioLevel => 65536

    /**
     * @type {Integer (Int32)}
     */
    static SREPrivate => 262144

    /**
     * @type {Integer (Int32)}
     */
    static SREAllEvents => 393215
}
