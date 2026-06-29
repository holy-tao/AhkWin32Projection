#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_CA {
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
    static KSPROPERTY_BDA_ECM_MAP_STATUS => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_CA_MODULE_STATUS => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_CA_SMART_CARD_STATUS => 2

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_CA_MODULE_UI => 3

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_CA_SET_PROGRAM_PIDS => 4

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_CA_REMOVE_PROGRAM => 5
}
