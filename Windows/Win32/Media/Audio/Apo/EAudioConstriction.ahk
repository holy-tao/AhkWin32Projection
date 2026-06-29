#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.Apo
 */
export default struct EAudioConstriction {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstrictionOff => 0

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstriction48_16 => 1

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstriction44_16 => 2

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstriction14_14 => 3

    /**
     * @type {Integer (Int32)}
     */
    static eAudioConstrictionMute => 4
}
