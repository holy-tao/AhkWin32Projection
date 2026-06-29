#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_SIGNAL_STATS {
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
    static KSPROPERTY_BDA_SIGNAL_STRENGTH => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SIGNAL_QUALITY => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SIGNAL_PRESENT => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SIGNAL_LOCKED => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SAMPLE_TIME => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SIGNAL_LOCK_CAPS => 5

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_SIGNAL_LOCK_TYPE => 6
}
