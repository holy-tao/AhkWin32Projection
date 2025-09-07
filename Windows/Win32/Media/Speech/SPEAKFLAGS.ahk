#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPEAKFLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static SPF_DEFAULT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPF_ASYNC => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPF_PURGEBEFORESPEAK => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPF_IS_FILENAME => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPF_IS_XML => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPF_IS_NOT_XML => 16

    /**
     * @type {Integer (Int32)}
     */
    static SPF_PERSIST_XML => 32

    /**
     * @type {Integer (Int32)}
     */
    static SPF_NLP_SPEAK_PUNC => 64

    /**
     * @type {Integer (Int32)}
     */
    static SPF_PARSE_SAPI => 128

    /**
     * @type {Integer (Int32)}
     */
    static SPF_PARSE_SSML => 256

    /**
     * @type {Integer (Int32)}
     */
    static SPF_PARSE_AUTODETECT => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPF_NLP_MASK => 64

    /**
     * @type {Integer (Int32)}
     */
    static SPF_PARSE_MASK => 384

    /**
     * @type {Integer (Int32)}
     */
    static SPF_VOICE_MASK => 511

    /**
     * @type {Integer (Int32)}
     */
    static SPF_UNUSED_FLAGS => -512
}
