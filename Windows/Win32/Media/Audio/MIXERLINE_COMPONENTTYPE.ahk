#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio
 */
export default struct MIXERLINE_COMPONENTTYPE {
    value : UInt32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_DIGITAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_HEADPHONES => 5

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_LINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_MONITOR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_SPEAKERS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_TELEPHONE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_UNDEFINED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_VOICEIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_DST_WAVEIN => 7

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_ANALOG => 4106

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_AUXILIARY => 4105

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_COMPACTDISC => 4101

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_DIGITAL => 4097

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_LINE => 4098

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_MICROPHONE => 4099

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_PCSPEAKER => 4103

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_SYNTHESIZER => 4100

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_TELEPHONE => 4102

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_UNDEFINED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static MIXERLINE_COMPONENTTYPE_SRC_WAVEOUT => 4104
}
