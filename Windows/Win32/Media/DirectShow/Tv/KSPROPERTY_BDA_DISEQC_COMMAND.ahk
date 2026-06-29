#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_DISEQC_COMMAND {
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
    static KSPROPERTY_BDA_DISEQC_ENABLE => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_DISEQC_LNB_SOURCE => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_DISEQC_USETONEBURST => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_DISEQC_REPEATS => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_DISEQC_SEND => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_DISEQC_RESPONSE => 5
}
