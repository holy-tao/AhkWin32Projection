#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
export default struct KSPROPERTY_BDA_LNB_INFO {
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
    static KSPROPERTY_BDA_LNB_LOF_LOW_BAND => 0

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_LNB_LOF_HIGH_BAND => 1

    /**
     * @type {Integer (Int32)}
     */
    static KSPROPERTY_BDA_LNB_SWITCH_FREQUENCY => 2
}
