#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
export default struct KSPROPERTY_JACK {
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
    static KSPROPERTY_JACK_DESCRIPTION => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_DESCRIPTION2 => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_SINK_INFO => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_CONTAINERID => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_JACK_DESCRIPTION3 => 5
}
