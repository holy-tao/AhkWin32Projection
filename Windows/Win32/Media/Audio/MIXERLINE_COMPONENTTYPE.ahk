#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Audio
 */
class MIXERLINE_COMPONENTTYPE extends Win32Enum {

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_DIGITAL
     * @type {Integer (UInt32)}
     */
    static DST_DIGITAL => 1

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_HEADPHONES
     * @type {Integer (UInt32)}
     */
    static DST_HEADPHONES => 5

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_LINE
     * @type {Integer (UInt32)}
     */
    static DST_LINE => 2

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_MONITOR
     * @type {Integer (UInt32)}
     */
    static DST_MONITOR => 3

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_SPEAKERS
     * @type {Integer (UInt32)}
     */
    static DST_SPEAKERS => 4

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_TELEPHONE
     * @type {Integer (UInt32)}
     */
    static DST_TELEPHONE => 6

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_UNDEFINED
     * @type {Integer (UInt32)}
     */
    static DST_UNDEFINED => 0

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_VOICEIN
     * @type {Integer (UInt32)}
     */
    static DST_VOICEIN => 8

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_DST_WAVEIN
     * @type {Integer (UInt32)}
     */
    static DST_WAVEIN => 7

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_ANALOG
     * @type {Integer (UInt32)}
     */
    static SRC_ANALOG => 4106

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY
     * @type {Integer (UInt32)}
     */
    static SRC_AUXILIARY => 4105

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC
     * @type {Integer (UInt32)}
     */
    static SRC_COMPACTDISC => 4101

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_DIGITAL
     * @type {Integer (UInt32)}
     */
    static SRC_DIGITAL => 4097

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_LINE
     * @type {Integer (UInt32)}
     */
    static SRC_LINE => 4098

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE
     * @type {Integer (UInt32)}
     */
    static SRC_MICROPHONE => 4099

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER
     * @type {Integer (UInt32)}
     */
    static SRC_PCSPEAKER => 4103

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER
     * @type {Integer (UInt32)}
     */
    static SRC_SYNTHESIZER => 4100

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE
     * @type {Integer (UInt32)}
     */
    static SRC_TELEPHONE => 4102

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED
     * @type {Integer (UInt32)}
     */
    static SRC_UNDEFINED => 4096

    /**
     * Native name: MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT
     * @type {Integer (UInt32)}
     */
    static SRC_WAVEOUT => 4104
}
