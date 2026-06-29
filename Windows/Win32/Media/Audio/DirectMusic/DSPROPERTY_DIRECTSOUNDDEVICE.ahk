#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.Audio.DirectMusic
 */
export default struct DSPROPERTY_DIRECTSOUNDDEVICE {
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
    static DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_A => 1

    /**
     * @type {Integer (Int32)}
     */
    static DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_1 => 2

    /**
     * @type {Integer (Int32)}
     */
    static DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_1 => 3

    /**
     * @type {Integer (Int32)}
     */
    static DSPROPERTY_DIRECTSOUNDDEVICE_WAVEDEVICEMAPPING_W => 4

    /**
     * @type {Integer (Int32)}
     */
    static DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_A => 5

    /**
     * @type {Integer (Int32)}
     */
    static DSPROPERTY_DIRECTSOUNDDEVICE_DESCRIPTION_W => 6

    /**
     * @type {Integer (Int32)}
     */
    static DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_A => 7

    /**
     * @type {Integer (Int32)}
     */
    static DSPROPERTY_DIRECTSOUNDDEVICE_ENUMERATE_W => 8
}
