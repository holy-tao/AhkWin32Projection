#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPEVENTENUM extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_UNDEFINED => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_START_INPUT_STREAM => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_END_INPUT_STREAM => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_VOICE_CHANGE => 3

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_TTS_BOOKMARK => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_WORD_BOUNDARY => 5

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_PHONEME => 6

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_SENTENCE_BOUNDARY => 7

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_VISEME => 8

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_TTS_AUDIO_LEVEL => 9

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_TTS_PRIVATE => 15

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_MIN_TTS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_MAX_TTS => 15

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_END_SR_STREAM => 34

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_SOUND_START => 35

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_SOUND_END => 36

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_PHRASE_START => 37

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RECOGNITION => 38

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_HYPOTHESIS => 39

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_SR_BOOKMARK => 40

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_PROPERTY_NUM_CHANGE => 41

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_PROPERTY_STRING_CHANGE => 42

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_FALSE_RECOGNITION => 43

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_INTERFERENCE => 44

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_REQUEST_UI => 45

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RECO_STATE_CHANGE => 46

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_ADAPTATION => 47

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_START_SR_STREAM => 48

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RECO_OTHER_CONTEXT => 49

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_SR_AUDIO_LEVEL => 50

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_SR_RETAINEDAUDIO => 51

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_SR_PRIVATE => 52

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RESERVED4 => 53

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RESERVED5 => 54

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RESERVED6 => 55

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_MIN_SR => 34

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_MAX_SR => 55

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RESERVED1 => 30

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RESERVED2 => 33

    /**
     * @type {Integer (Int32)}
     */
    static SPEI_RESERVED3 => 63
}
